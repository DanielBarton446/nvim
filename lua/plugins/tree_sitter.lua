return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false,
  build = ":TSUpdate",

  config = function()
    require("nvim-treesitter").setup()

    require("nvim-treesitter").install({
      "python",
      "lua",
      "rust",
      "javascript",
      "typescript",
      "bash",
      "c",
      "json",
      "yaml",
      "html",
      "css",
      "markdown",
      "markdown_inline",
    })

    vim.api.nvim_create_autocmd("FileType", {
      callback = function(args)
        local ok, err = pcall(vim.treesitter.start, args.buf)
        -- if not ok then
        --   vim.notify(
        --     "Tree-sitter error: " .. tostring(err),
        --     vim.log.levels.ERROR
        --   )
        -- end
      end,
    })
  end,
}
