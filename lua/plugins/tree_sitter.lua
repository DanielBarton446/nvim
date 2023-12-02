return {
  "nvim-treesitter/nvim-treesitter",
  config = function ()
    local ts = require 'nvim-treesitter.configs'
    ts.setup {
    highlight = {
      enable = true,
      disable = {},
    },
    indent = {
      enable = true,
      disable = {},
    },
    ensure_installed = {
      "javascript",
      "typescript",
      "python",
      "rust",
      "bash",
      "c",
      "toml",
      "json",
      "yaml",
      "css",
      "html",
      "lua"
    },
    autotag = {
      enable = true,
    },
  }
  end

}
