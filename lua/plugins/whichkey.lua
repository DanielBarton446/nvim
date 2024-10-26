return {
  "folke/which-key.nvim",
  config = function()
    local setup = {}
    local opts = {
      mode = "n", -- NORMAL mode
      prefix = "<leader>",
      buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    }
    local mappings = {
    { "<leader>/", ":CommentToggle<CR>", desc = "Comment", nowait = true, remap = false },
    { "<leader>D", "<cmd>lua vim.diagnostic.disable()<cr>", desc = "Disable diagnostics", nowait = true, remap = false },
    { "<leader>E", "<cmd>lua vim.diagnostic.enable()<cr>", desc = "Enable Diagnostics", nowait = true, remap = false },
    { "<leader>F", ":lua vim.lsp.buf.format()<CR>", desc = "Format Current Buffer", nowait = true, remap = false },
    { "<leader>a", "<cmd>lua vim.lsp.buf.code_action()<CR>", desc = "Code Action", nowait = true, remap = false },
    { "<leader>cd", "<cmd>Copilot disable<CR>", desc = "Copilot Disable", nowait = true, remap = false },
    { "<leader>ce", "<cmd>Copilot enable<CR>", desc = "Copilot Enable", nowait = true, remap = false },
    { "<leader>ct", "<cmd>TSContextToggle<CR>", desc = "Toggle Context", nowait = true, remap = false },
    { "<leader>d", "<cmd>lua vim.diagnostic.open_float()<cr>", desc = "diagnostics", nowait = true, remap = false },
    { "<leader>ee", "<cmd>lua require('telescope.builtin').find_files({search_dirs = {'~/.config/'}})<cr>", desc = "Search dotfiles", nowait = true, remap = false },
    { "<leader>fb", ":Telescope buffers<CR>", desc = "View Buffers", nowait = true, remap = false },
    { "<leader>ff", ":Telescope find_files<CR>", desc = "Find Files", nowait = true, remap = false },
    { "<leader>fg", ":Telescope live_grep<CR>", desc = "Live Grep", nowait = true, remap = false },
    { "<leader>gD", "<cmd>lua vim.lsp.buf.type_definition()<cr>", desc = "Type Definition", nowait = true, remap = false },
    { "<leader>gb", ":Gitsigns toggle_current_line_blame<CR>", desc = "Toggle Git Blame", nowait = true, remap = false },
    { "<leader>gd", "<cmd>lua vim.lsp.buf.definition()<cr>", desc = "Definition", nowait = true, remap = false },
    { "<leader>gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", desc = "Implementation", nowait = true, remap = false },
    { "<leader>gpr", "<cmd>GHOpenPR<cr>", desc = "Open PR", nowait = true, remap = false },
    { "<leader>gr", "<cmd>lua vim.lsp.buf.references()<cr>", desc = "References", nowait = true, remap = false },
    { "<leader>k", ":lua vim.lsp.buf.hover()<CR>", desc = "Hover (read docos)", nowait = true, remap = false },
    { "<leader>nf", ":Telescope neorg find_norg_files<CR>", desc = "Find Norg Files", nowait = true, remap = false },
    { "<leader>nh", ":Telescope neorg search_headings<CR>", desc = "Search Headings", nowait = true, remap = false },
    { "<leader>ni", ":Telescope neorg insert_file_link<CR>", desc = "Insert File Link", nowait = true, remap = false },
    { "<leader>nl", ":Telescope neorg find_linkable<CR>", desc = "Find Linkables", nowait = true, remap = false },
    { "<leader>nw", ":Telescope neorg switch_workspace<CR>", desc = "Switch workspaces", nowait = true, remap = false },
    { "<leader>rn", ":lua require('renamer').rename()<CR>", desc = "Rename a variable", nowait = true, remap = false },
    { "<leader>tp", ":TermExec direction=float cmd='python3' <CR>", desc = "Open Python Shell", nowait = true, remap = false },
    { "<leader>tt", ":ToggleTerm direction=float<CR>", desc = "floating terminal", nowait = true, remap = false },
  }

    local which_key = require("which-key")
    which_key.setup(setup)
    which_key.add(mappings, opts)
  end
}
