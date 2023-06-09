local status, ts = pcall(require, "nvim-treesitter.configs")
if (not status) then
  return
end

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
