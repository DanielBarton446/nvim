local opts = { noremap = true, silent = true }

local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- Normal --
-- Vertical Movement
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)
-- Navigate buffers
keymap("n", "<C-n>", ":BufferLineCycleNext<CR>", opts)
keymap("n", "<C-p>", ":BufferLineCyclePrev<CR>", opts)

-- Misc --
keymap("n", "J", "mzJ`z", opts) -- Join next line and keep cursor in same place

keymap("n", "n", "nzzzv", opts) -- keep search terms in middle
keymap("n", "N", "Nzzzv", opts) -- keep search terms in middle


-- Visual --
keymap("v", "K", ":m '<-2<CR>gv=gv", opts)
keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
