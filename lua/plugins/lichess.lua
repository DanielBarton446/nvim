vim.g.lichess_api_token = os.getenv("LICHESS_API_KEY")

return {
  "luk400/vim-lichess",
  config = function()
    require("nvim_comment").setup()
  end,
}
