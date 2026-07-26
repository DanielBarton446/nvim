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
    }

    require("mason-lspconfig").setup({
      ensure_installed = servers,
      automatic_installation = true,
    })

    local capabilities = require("cmp_nvim_lsp").default_capabilities()

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

    -- General servers
    for _, server in ipairs({
      "pylsp",
    }) do
      vim.lsp.config(server, {
        capabilities = capabilities,
      })
    end

--    -- C / C++
--    vim.lsp.config("clangd", {
--      capabilities = capabilities,
--      cmd = {
--        "clangd",
--        "--enable-config",
--      },
--      root_markers = {
--        "compile_commands.json",
--        ".clangd",
--        ".git",
--      },
--    })

--    -- Go
--    vim.lsp.config("gopls", {
--      capabilities = capabilities,
--      settings = {
--        gopls = {},
--      },
--    })

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


    -- Enable all configured servers
    for _, server in ipairs(servers) do
      vim.lsp.enable(server)
    end
  end,
}
