local status, packer = pcall(require, 'packer')
if (not status) then
  print("Packer is not installed")
  return
end

vim.cmd [[packadd packer.nvim]]
packer.startup(function(use)
  use 'wbthomason/packer.nvim' -- Package Manager

  -- VimBeGood
  use 'ThePrimeagen/vim-be-good'
  -- Colorscheme
  use 'folke/tokyonight.nvim'

  -- Note taking
  use "nvim-neorg/neorg"
  use "nvim-neorg/neorg-telescope" -- telescope integration

  -- Terminal In Vim
  use "akinsho/toggleterm.nvim"

  -- Fancy Notifications
  use 'rcarriga/nvim-notify'

  -- GH code reviewing
  use {
    'ldelossa/gh.nvim',
    requires = { { 'ldelossa/litee.nvim' } }
  }

  -- Github copilot
  -- use "github/copilot.vim"
  use {
    "zbirenbaum/copilot.lua",
    -- cmd = "Copilot",
    -- event = "InsertEnter",
    -- config = function()
    --   require("copilot").setup({})
    -- end,
  }
  use {
    "zbirenbaum/copilot-cmp",
    -- after = { "copilot.lua" },
    -- config = function ()
    --   require("copilot_cmp").setup()
    -- end
  }

  -- Lualine
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use { -- Renaming nicer
    'filipdutescu/renamer.nvim',
    branch = 'master',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }

  -- LSP stuff
  use {
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },

      -- Snippets
      { 'L3MON4D3/LuaSnip' },
      { 'rafamadriz/friendly-snippets' },
    }
  }

  -- lsp associated packages
  use 'simrat39/rust-tools.nvim'
  use 'simrat39/inlay-hints.nvim' -- inlay hints for all languages

  -- Harpoon
  use('theprimeagen/harpoon')
  -- Formatter/Linter device for Mason
  use "jose-elias-alvarez/null-ls.nvim"
  -- Tree Sitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  -- Telescope
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }
  -- Bufferline
  use { 'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons' }

  -- Commenter
  use "terrortylor/nvim-comment"

  -- WhichKey keymappings
  use "folke/which-key.nvim"

  -- Auto Pairs
  use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }
  -- Git Signs
  use 'lewis6991/gitsigns.nvim'

  -- Indent Line
  use("lukas-reineke/indent-blankline.nvim")

  -- File Explorer
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icons
    },
  }

  -- ChatGPT integration
  use {
    "jackMort/ChatGPT.nvim",
    requires = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim"
    }
  }
end
)
