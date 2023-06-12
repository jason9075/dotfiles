local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {

  "nvim-lua/popup.nvim", -- An implementation of the Popup API from vim in Neovim
  "nvim-lua/plenary.nvim", -- Useful lua functions used ny lots of plugins
  "EdenEast/nightfox.nvim", -- color scheme
  "windwp/nvim-autopairs", -- Autopairs, integrates with both cmp and treesitter
  "numToStr/Comment.nvim", -- Easily comment stuff
  "nvim-tree/nvim-web-devicons",
  "nvim-tree/nvim-tree.lua",
  "lukas-reineke/indent-blankline.nvim",
  "folke/which-key.nvim",
  "akinsho/toggleterm.nvim",
  "SmiteshP/nvim-gps",
  "akinsho/bufferline.nvim",
  "moll/vim-bbye", -- close buffer command when you use bufferline
  "nvim-lualine/lualine.nvim",
  "wsdjeg/vim-fetch", -- open file with specify line
  "ThePrimeagen/harpoon",

  -- LSP
  "github/copilot.vim",
  {
    "VonHeikemen/lsp-zero.nvim",
    dependencies = {
      -- LSP Support
      { "neovim/nvim-lspconfig" },
      { "williamboman/mason.nvim" },
      { "williamboman/mason-lspconfig.nvim" },

      -- Autocompletion
      { "hrsh7th/nvim-cmp" }, -- The completion plugin
      { "hrsh7th/cmp-buffer" }, -- buffer completions
      { "hrsh7th/cmp-path" }, -- path completions
      { "saadparwaiz1/cmp_luasnip" }, -- snippet completions
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-nvim-lua" },

      -- Snippets
      { "L3MON4D3/LuaSnip" },
      -- Snippet Collection (Optional) --snippet engine
      { "rafamadriz/friendly-snippets" }, -- a bunch of snippets to use

      -- Linter and Formatters
      { "jose-elias-alvarez/null-ls.nvim" },
      { "jayp0521/mason-null-ls.nvim" },
    },
  },

  -- fuzzy find
  {
    "junegunn/fzf",
    build = "./install --bin",
  },
  "ibhagwan/fzf-lua",
  "airblade/vim-rooter", -- will find .gitignore as project root folder to use fuzzy search

  -- treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },
  "JoosepAlviste/nvim-ts-context-commentstring",

  -- git
  "lewis6991/gitsigns.nvim", -- use to display line change on the left of line numbers

  -- DAP
  "mfussenegger/nvim-dap",
  "theHamsta/nvim-dap-virtual-text",
  "rcarriga/nvim-dap-ui",
  "mfussenegger/nvim-dap-python",
  "leoluz/nvim-dap-go",

  -- Refactor
  "ThePrimeagen/refactoring.nvim",
}
local opts = {}

require("lazy").setup(plugins, opts)
