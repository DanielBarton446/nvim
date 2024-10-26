return {
  'folke/tokyonight.nvim',
  priority = 1000,
  lazy = false,
  config = function()
    local opts = {
      style = "night",
      styles = {
        -- functions = { italic = true },
        functions = { italic = true },
      }
    }
    require('tokyonight').load(opts)
  end,
}
