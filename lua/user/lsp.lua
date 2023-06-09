local lsp = require('lsp-zero')
lsp.preset('recommended')

lsp.ensure_installed({
  'rust_analyzer',
})

-- Fix Undefined global 'vim'
lsp.configure('sumneko_lua', {
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
