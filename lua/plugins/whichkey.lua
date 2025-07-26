return {
  "folke/which-key.nvim",
  config = function()
    local setup = {}
    local opts = {
      buffer = nil,   -- Global mappings. Specify a buffer number for buffer local mappings
      silent = true,  -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true,  -- use `nowait` when creating keymaps
    }
    local mappings = {
      { "<leader>/",   "<cmd>CommentToggle<CR>",                                                               desc = "Comment",               nowait = true, remap = false, mode = "n"},
      { "<leader>D",   "<cmd>lua vim.diagnostic.disable()<cr>",                                                desc = "Disable diagnostics",   nowait = true, remap = false, mode = "n"},
      { "<leader>E",   "<cmd>lua vim.diagnostic.enable()<cr>",                                                 desc = "Enable Diagnostics",    nowait = true, remap = false, mode = "n"},
      { "<leader>F",   "<cmd>lua vim.lsp.buf.format()<CR>",                                                    desc = "Format Current Buffer", nowait = true, remap = false, mode = "n"},
      { "<leader>a",   "<cmd>lua vim.lsp.buf.code_action()<CR>",                                               desc = "Code Action",           nowait = true, remap = false, mode = "n"},
      { "<leader>cd",  "<cmd>Copilot disable<CR>",                                                             desc = "Copilot Disable",       nowait = true, remap = false, mode = "n"},
      { "<leader>ce",  "<cmd>Copilot enable<CR>",                                                              desc = "Copilot Enable",        nowait = true, remap = false, mode = "n"},
      { "<leader>ct",  "<cmd>TSContextToggle<CR>",                                                             desc = "Toggle Context",        nowait = true, remap = false, mode = "n"},
      { "<leader>d",   "<cmd>lua vim.diagnostic.open_float()<cr>",                                             desc = "diagnostics",           nowait = true, remap = false, mode = "n"},
      { "<leader>ee",  "<cmd>lua require('telescope.builtin').find_files({search_dirs = {'~/.config/'}})<cr>", desc = "Search dotfiles",       nowait = true, remap = false, mode = "n"},
      { "<leader>fb",  "<cmd>Telescope buffers<CR>",                                                           desc = "View Buffers",          nowait = true, remap = false, mode = "n"},
      { "<leader>ff",  "<cmd>Telescope find_files<CR>",                                                        desc = "Find Files",            nowait = true, remap = false, mode = "n"},
      { "<leader>fg",  "<cmd>Telescope live_grep<CR>",                                                         desc = "Live Grep",             nowait = true, remap = false, mode = "n"},
      { "<leader>gD",  "<cmd>lua vim.lsp.buf.declaration()<cr>",                                               desc = "Type Definition",       nowait = true, remap = false, mode = "n"},
      { "<leader>gd",  "<cmd>lua vim.lsp.buf.definition()<cr>",                                                desc = "Type Declaration",      nowait = true, remap = false, mode = "n"},
      { "<leader>gb",  "<cmd>Gitsigns toggle_current_line_blame<CR>",                                          desc = "Toggle Git Blame",      nowait = true, remap = false, mode = "n"},
      { "<leader>gi",  "<cmd>lua vim.lsp.buf.implementation()<cr>",                                            desc = "Implementation",        nowait = true, remap = false, mode = "n"},
      { "<leader>gpr", "<cmd>GHOpenPR<cr>",                                                                    desc = "Open PR",               nowait = true, remap = false, mode = "n"},
      { "<leader>gr",  "<cmd>lua vim.lsp.buf.references()<cr>",                                                desc = "References",            nowait = true, remap = false, mode = "n"},
      { "<leader>k",   "<cmd>lua vim.lsp.buf.hover()<CR>",                                                     desc = "Hover (read docos)",    nowait = true, remap = false, mode = "n"},
      { "<leader>nf",  "<cmd>Telescope neorg find_norg_files<CR>",                                             desc = "Find Norg Files",       nowait = true, remap = false, mode = "n"},
      { "<leader>nh",  "<cmd>Telescope neorg search_headings<CR>",                                             desc = "Search Headings",       nowait = true, remap = false, mode = "n"},
      { "<leader>ni",  "<cmd>Telescope neorg insert_file_link<CR>",                                            desc = "Insert File Link",      nowait = true, remap = false, mode = "n"},
      { "<leader>nl",  "<cmd>Telescope neorg find_linkable<CR>",                                               desc = "Find Linkables",        nowait = true, remap = false, mode = "n"},
      { "<leader>nw",  "<cmd>Telescope neorg switch_workspace<CR>",                                            desc = "Switch workspaces",     nowait = true, remap = false, mode = "n"},
      { "<leader>rn",  "<cmd>lua require('renamer').rename()<CR>",                                             desc = "Rename a variable",     nowait = true, remap = false, mode = "n"},
      { "<leader>tp",  "<cmd>TermExec direction=float cmd='python3' <CR>",                                     desc = "Open Python Shell",     nowait = true, remap = false, mode = "n"},
      { "<leader>tt",  "<cmd>ToggleTerm direction=float<CR>",                                                  desc = "floating terminal",     nowait = true, remap = false, mode = "n"},
    }

    local visual_mappings = {
      { "<leader>/", ":CommentToggle<CR>", desc = "Comment", nowait = true, remap = false, mode= "v"},
    }

    local which_key = require("which-key")
    which_key.setup(setup)
    which_key.add(mappings, opts)
    which_key.add(visual_mappings, opts)
  end
}
