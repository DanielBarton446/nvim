local null_ls = require("null-ls")

-- lsp formatting in general case
local lsp_formatting = function(bufnr)
  vim.lsp.buf.format({
    -- filter = function(client)
    --   -- apply whatever logic you want (in this example, we'll only use null-ls)
    --   return client.name == "null-ls"
    -- end,
    bufnr = bufnr,
  })
end

-- if you want to set up formatting on save, you can use this as a callback
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- add to your shared on_attach callback

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.eslint_d,
    null_ls.builtins.formatting.rustfmt,
    null_ls.builtins.diagnostics.write_good,
    null_ls.builtins.completion.spell,
  },

  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          lsp_formatting(bufnr)
        end,
      })
    end
  end
})
