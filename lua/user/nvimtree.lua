local status, tree = pcall(require, "nvim-tree")
if not status then
  print("nvim tree not loaded")
end

local function open_nvim_tree(data)

  -- buffer is a directory
  local directory = vim.fn.isdirectory(data.file) == 1

  if not directory then
    return
  end

  -- change to the directory
  vim.cmd.cd(data.file)

  -- open the tree
  require("nvim-tree.api").tree.open()
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
tree.setup({
  view = {
    side = "left",
    width = 20,
    adaptive_size = true
  }
})

