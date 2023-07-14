local lsp = require('lsp-zero')
lsp.preset('recommended')

lsp.ensure_installed({
  'lua_ls',
  'rust_analyzer',
})

-- Fix Undefined global 'vim'
lsp.configure('lua_ls', {
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      }
    }
  }
})

lsp.setup_nvim_cmp() -- ensure cmp is initialized

lsp.set_preferences({
  suggest_lsp_servers = true,
  sign_icons = {
    error = " ",
    warn = " ",
    hint = " ",
    info = " "
  }
})

lsp.setup()


-- need to set mapping that on Enter key, select auto completion
local cmp = require('cmp')

-- copilot tab completion
local has_words_before = function()
  if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then return false end
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_text(0, line-1, 0, line-1, col, {})[1]:match("^%s*$") == nil
end

cmp.setup({
  mapping = {
    ['<CR>'] = cmp.mapping.confirm({select = false}),
    ["<Tab>"] = vim.schedule_wrap(function(fallback)
      if cmp.visible() and has_words_before() then
        cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
      else
        fallback()
      end
    end),
  },
  sources = {
    -- copilot
    { name = "copilot", group_index = 2 },
    -- nvim lsp
    { name = "nvim_lsp", group_index = 2 },
    { name = "path", group_index = 2 },
    { name = "luasnip", group_index = 2 }
  }
})
