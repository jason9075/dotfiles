local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer close and reopen Neovim...")
  vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
--[[ packer.init({ ]]
--[[   display = { ]]
--[[     open_fn = function() ]]
--[[       return require("packer.util").float({ border = "rounded" }) ]]
--[[     end, ]]
--[[   }, ]]
--[[ }) ]]

return packer.startup(function(use)
  use("wbthomason/packer.nvim") -- Have packer manage itself
  use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
  use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins
  use("EdenEast/nightfox.nvim") -- color scheme
  use("windwp/nvim-autopairs") -- Autopairs, integrates with both cmp and treesitter
  use("numToStr/Comment.nvim") -- Easily comment stuff
  use("nvim-tree/nvim-web-devicons")
  use("nvim-tree/nvim-tree.lua")
  use("lukas-reineke/indent-blankline.nvim")
  use("folke/which-key.nvim")
  use("akinsho/toggleterm.nvim")
  use("SmiteshP/nvim-gps")
  use("akinsho/bufferline.nvim")
  use("moll/vim-bbye") -- close buffer command when you use bufferline
  use("nvim-lualine/lualine.nvim")
  use("wsdjeg/vim-fetch") -- open file with specify line
  use("lewis6991/impatient.nvim") -- speed up startup time
  use("ThePrimeagen/harpoon")
  use({
    "phaazon/hop.nvim",
    branch = "v1", -- optional but strongly recommended
  })

  -- LSP
  use({
    "VonHeikemen/lsp-zero.nvim",
    requires = {
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
  })

  -- fuzzy find
  use({
    "junegunn/fzf",
    run = "./install --bin",
  })
  use("ibhagwan/fzf-lua")
  use("airblade/vim-rooter") -- will find .gitignore as project root folder to use fuzzy search

  -- treesitter
  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  })
  use("JoosepAlviste/nvim-ts-context-commentstring")

  -- git
  use("lewis6991/gitsigns.nvim") -- use to display line change on the left of line numbers

  -- DAP
  use("mfussenegger/nvim-dap")
  use("theHamsta/nvim-dap-virtual-text")
  use("rcarriga/nvim-dap-ui")
  use("mfussenegger/nvim-dap-python")
  use("leoluz/nvim-dap-go")

  -- Refactor
  use("ThePrimeagen/refactoring.nvim")

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
