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
  {
    "EdenEast/nightfox.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme nightfox]])
    end,
  },
  "nvim-lua/plenary.nvim", -- Useful lua functions used by lots of plugins
  "windwp/nvim-autopairs", -- Autopairs, integrates with both cmp and treesitter
  "numToStr/Comment.nvim", -- Easily comment stuff
  { "nvim-tree/nvim-web-devicons", lazy = true },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      -- add any options here
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
  },
  "lukas-reineke/indent-blankline.nvim",
  { "folke/which-key.nvim", lazy = true },
  { "akinsho/toggleterm.nvim", event = "VeryLazy" },
  "SmiteshP/nvim-gps", -- show status line
  { "akinsho/bufferline.nvim", event = "VeryLazy" },
  "moll/vim-bbye", -- close buffer command when you use bufferline
  { "nvim-lualine/lualine.nvim", event = "VeryLazy" },
  "wsdjeg/vim-fetch", -- open file with specify line
  {
    "phaazon/hop.nvim",
    branch = "v2", -- optional but strongly recommended
    event = "VeryLazy",
  },
  "ThePrimeagen/harpoon",

  -- LSP
  "github/copilot.vim",
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v2.x",
    dependencies = {
      -- LSP Support
      { "neovim/nvim-lspconfig" },
      {
        "williamboman/mason.nvim",
        build = function()
          pcall(vim.cmd, "MasonUpdate")
        end,
      },
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
  { "lewis6991/gitsigns.nvim", event = "VeryLazy" }, -- use to display line change on the left of line numbers

  -- DAP
  { "mfussenegger/nvim-dap", event = "VeryLazy" },
  { "theHamsta/nvim-dap-virtual-text", event = "VeryLazy" },
  { "rcarriga/nvim-dap-ui", event = "VeryLazy" },
  { "mfussenegger/nvim-dap-python", event = "VeryLazy" },
  { "leoluz/nvim-dap-go", event = "VeryLazy" },

  -- Refactor
  "ThePrimeagen/refactoring.nvim",
}
local opts = {}

require("lazy").setup(plugins, opts)
