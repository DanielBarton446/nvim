return {
  "neovim/nvim-lspconfig",
  event = "BufEnter",

  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",

    -- Completion
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lua",

    -- Snippets
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "rafamadriz/friendly-snippets",
  },

  config = function()
    require("mason").setup()

    local servers = {
      "lua_ls",
      "rust_analyzer",
      "pyrefly",
    }

    require("mason-lspconfig").setup({
      ensure_installed = servers,
      automatic_enable = false,
    })

    local capabilities =
      require("cmp_nvim_lsp").default_capabilities()

    vim.diagnostic.config({
      virtual_text = {
        prefix = "󰵙",
      },
    })

    -- LSP keymaps
    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(args)
        local opts = { buffer = args.buf }

        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)

        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
        vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
      end,
    })

    -- Lua
    vim.lsp.config("lua_ls", {
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
        },
      },
    })

    -- Rust
    vim.lsp.config("rust_analyzer", {
      capabilities = capabilities,
      settings = {
        ["rust-analyzer"] = {
          diagnostics = {
            enable = false,
          },
        },
      },
    })

    -- Python
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

      capabilities = capabilities,

      on_attach = function(client, bufnr)
        client.server_capabilities.semanticTokensProvider = nil
        client.server_capabilities.documentHighlightProvider = false
      end,
    })

    -- LuaSnip
    local luasnip = require("luasnip")

    -- Load friendly snippets
    require("luasnip.loaders.from_vscode").lazy_load()

    -- nvim-cmp
    local cmp = require("cmp")

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
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },

      mapping = cmp.mapping.preset.insert({
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
      }),

      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "path" },
        { name = "buffer" },
        { name = "nvim_lua" },
      }),
    })

    -- Enable configured servers
    vim.lsp.enable(servers)
  end,
}
