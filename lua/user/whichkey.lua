local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

local setup = {}
local opts = {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local vopts = {
  mode = "v", -- VISUAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}
local mappings = {
  ["/"] = { ":CommentToggle<CR>", "Comment" },
  ["ee"] = { "<cmd>lua require('telescope.builtin').find_files({search_dirs = {'~/.config/nvim/'}})<cr>",
    "Search dotfiles" },
  ["a"] = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Code Action" },
  ["k"] = { ":lua vim.lsp.buf.hover()<CR>", "Hover (read docos)" },

  ["gd"] = { "<cmd>lua vim.lsp.buf.definition()<cr>", "Definition" },
  ["gD"] = { "<cmd>lua vim.lsp.buf.type_definition()<cr>", "Type Definition" },
  ["gi"] = { "<cmd>lua vim.lsp.buf.implementation()<cr>", "Implementation" },
  ["gr"] = { "<cmd>lua vim.lsp.buf.references()<cr>", "References" },
  ["gpr"] = { "<cmd>GHOpenPR<cr>", "Open PR" },

  ["d"] = { "<cmd>lua vim.diagnostic.open_float()<cr>", "diagnostics" },
  ["gb"] = { ":Gitsigns toggle_current_line_blame<CR>", "Toggle Git Blame" },
  ["F"] = { ":lua vim.lsp.buf.format()<CR>", "Format Current Buffer" },
  ["ff"] = { ":Telescope find_files<CR>", "Find Files" },
  ["fg"] = { ":Telescope live_grep<CR>", "Live Grep" },
  ["fb"] = { ":Telescope buffers<CR>", "View Buffers" },
  ["rn"] = { ":lua require('renamer').rename()<CR>", "Rename a variable" },
  -- Neorg stuff
  ["nf"] = { ":Telescope neorg find_norg_files<CR>", "Find Norg Files" },
  ["nh"] = { ":Telescope neorg search_headings<CR>", "Search Headings" },
  ["ni"] = { ":Telescope neorg insert_file_link<CR>", "Insert File Link" },
  ["nl"] = { ":Telescope neorg find_linkable<CR>", "Find Linkables" },
  ["nw"] = { ":Telescope neorg switch_workspace<CR>", "Switch workspaces" },
}
local vmappings = {
  ["/"] = { ":'<,'>CommentToggle<CR>", "Comment" },
}

which_key.setup(setup)
which_key.register(mappings, opts)
which_key.register(vmappings, vopts)
