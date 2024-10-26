return {
  -- LSP
  "neovim/nvim-lspconfig",
  event = "BufEnter",
  dependencies = {
    -- LSP
    "VonHeikemen/lsp-zero.nvim",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",

    -- Autocompletion
    { 'hrsh7th/nvim-cmp' },
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-path' },
    { 'saadparwaiz1/cmp_luasnip' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-nvim-lua' },

    -- Snippets
    { 'L3MON4D3/LuaSnip' },
    { 'rafamadriz/friendly-snippets' },
  },

  config = function()
    -- LSP zero for formatting and actually attaching languag servers
    local lsp_zero = require('lsp-zero')
    lsp_zero.preset('recommended')

    -- Fix Undefined global 'vim'
    lsp_zero.configure('lua_ls', {
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim' }
          }
        }
      }
    })

    lsp_zero.set_preferences({
      suggest_lsp_servers = true,
      sign_icons = {
        error = " ",
        warn = " ",
        hint = " ",
        info = " "
      }
    })

    vim.diagnostic.config({
      virtual_text = {
        prefix = '󰵙', -- Could be '●', '▎', 'x'
      }
    })

    -- CMP stuff
    -- need to set mapping that on Enter key, select auto completion
    local cmp = require'cmp'
    local luasnip = require'luasnip'

    -- copilot tab completion
    local has_words_before = function()
      if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then return false end
      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      return col ~= 0 and vim.api.nvim_buf_get_text(0, line-1, 0, line-1, col, {})[1]:match("^%s*$") == nil
    end

    cmp.setup({
      mapping = {
        ['<CR>'] = cmp.mapping.confirm({select = false}),
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
        -- copilot
        { name = "copilot"},
        -- nvim lsp
        { name = "nvim_lsp"},
        { name = "path"},
        { name = "luasnip"},

        { name = "buffer" } -- use things locally if we can't get from an lsp source
      }
    })

    lsp_zero.setup()

    -- Mason for installing language servers
    require("mason").setup()

    local servers = {
      "lua_ls",
      -- "pyright",
      "pylsp",
      "bashls",
      "rust_analyzer",
      "ocamllsp",
      "eslint",
      "tsserver",
      "ltex",
      "texlab"
    }

    require("mason-lspconfig").setup {
      ensure_installed = servers,
      automatic_installation = true,
    }


    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    local lspconfig = require('lspconfig')
    for _, ls in ipairs(servers) do
      lspconfig[ls].setup {
        on_attach = on_attach,
        capabilities = capabilities,
    }

    -- we need to setup clangd manually
    lspconfig.clangd.setup {
      on_attach = on_attach,
      capabilities = capabilities,
      cmd = { "clangd", "--enable-config" },
      root_dir = lspconfig.util.root_pattern("compile_commands.json", ".clangd"),
    }

    end
  end

}
