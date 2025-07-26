return {
    "nvim-tree/nvim-tree.lua",
    config = function()
        local nvim_tree = require("nvim-tree")
        local opts = {
            on_attach = on_attach,
            renderer = {
                icons = {
                    glyphs = {
                        default = "",
                        symlink = "",
                        git = {
                            unstaged = "",
                            staged = "✓",
                            unmerged = "",
                            renamed = "➜",
                            untracked = "★",
                            deleted = "",
                            ignored = "◌"
                        }
                    }
                },
            }
        }
        nvim_tree.setup(opts)
    end
}
