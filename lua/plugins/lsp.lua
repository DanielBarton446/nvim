return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },

  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",

    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lua",

    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "rafamadriz/friendly-snippets",
  },

  config = function()
    -- Mason
    require("mason").setup()

    local capabilities =
      require("cmp_nvim_lsp").default_capabilities()

    -- Servers managed by Mason
    local servers = {
      "lua_ls",
      "bashls",
      "clangd",
      "rust_analyzer",
      "ocamllsp",
      "gopls",
      "eslint",
      "ts_ls",
      "ltex",
      "texlab",
      "html",
      "tailwindcss",
      "gdscript",
      "pyrefly",
    }

    -- Install servers, but enable them ourselves
    require("mason-lspconfig").setup({
      ensure_installed = servers,
      automatic_enable = false,
    })

    -- Shared capabilities
    vim.lsp.config("*", {
      capabilities = capabilities,
    })

    -- Lua
    vim.lsp.config("lua_ls", {
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
        },
      },
    })

    -- Clangd
    vim.lsp.config("clangd", {
      cmd = { "clangd", "--enable-config" },
      root_markers = {
        "compile_commands.json",
        ".clangd",
        ".git",
      },
    })

    -- Rust
    vim.lsp.config("rust_analyzer", {
      settings = {
        ["rust-analyzer"] = {
          diagnostics = {
            enable = false,
          },
        },
      },
    })

    -- Go
    vim.lsp.config("gopls", {
      on_attach = function(_, bufnr)
        vim.bo[bufnr].expandtab = true
        vim.bo[bufnr].shiftwidth = 4
        vim.bo[bufnr].softtabstop = 4
      end,
    })

    -- GDScript
    vim.lsp.config("gdscript", {
      on_attach = function(_, bufnr)
        vim.bo[bufnr].expandtab = true
        vim.bo[bufnr].shiftwidth = 4
        vim.bo[bufnr].softtabstop = 4
      end,
    })

    -- Pyrefly (custom LSP)
    vim.lsp.config("pyrefly", {
      cmd = { "pyrefly", "lsp" },
      filetypes = { "python" },
      root_markers = {
        "pyproject.toml",
        "setup.py",
        "setup.cfg",
        "requirements.txt",
        ".git",
      },
      single_file_support = true,

      on_attach = function(client, _)
        client.server_capabilities.semanticTokensProvider = nil
        client.server_capabilities.documentHighlightProvider = false
      end,
    })

    -- Enable all configured servers
    vim.lsp.enable(servers)

    -- Diagnostics
    vim.diagnostic.config({
      virtual_text = {
        prefix = "󰵙",
      },
    })

    -- Completion
    local cmp = require("cmp")
    local luasnip = require("luasnip")

    local function has_words_before()
      if vim.bo.buftype == "prompt" then
        return false
      end

      local line, col = unpack(vim.api.nvim_win_get_cursor(0))

      return col ~= 0
        and vim.api.nvim_get_current_line()
          :sub(1, col)
          :match("^%s*$") == nil
    end

    cmp.setup({
      mapping = {
        ["<CR>"] = cmp.mapping.confirm({
          select = false,
        }),

        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      },

      sources = {
        { name = "copilot" },
        { name = "nvim_lsp" },
        { name = "path" },
        { name = "luasnip" },
        { name = "buffer" },
      },
    })
  end,
}
