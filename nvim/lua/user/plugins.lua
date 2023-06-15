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
    priority = 1000,
    config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme nightfox]])
    end,
  },
  "nvim-lua/plenary.nvim", -- Useful lua functions used by lots of plugins
  "windwp/nvim-autopairs", -- Autopairs, integrates with both cmp and treesitter
  {
    "numToStr/Comment.nvim", -- Easily comment stuff
    event = "VeryLazy",
    config = function()
      require("Comment").setup()
    end,
  },

  -- UI plugins
  "nvim-tree/nvim-web-devicons",
  "lukas-reineke/indent-blankline.nvim",
  "SmiteshP/nvim-gps", -- show status line
  "akinsho/bufferline.nvim",
  { "famiu/bufdelete.nvim", event = "VeryLazy" }, -- close buffer command when you use bufferline
  "nvim-lualine/lualine.nvim",
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    cmd = "NeoTreeRevealToggle",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("user.neo-tree")
    end,
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

  --  Tool
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
  },
  {
    "akinsho/toggleterm.nvim",
    keys = { "<C-\\>", "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" },
    config = function()
      require("user.toggleterm")
    end,
  },
  { "wsdjeg/vim-fetch", lazy = false }, -- open file with specify line
  {
    "phaazon/hop.nvim",
    branch = "v2", -- optional but strongly recommended
  },
  { "ThePrimeagen/harpoon", event = "VeryLazy" },
  {
    "notjedi/nvim-rooter.lua",
    lazy = false,
    config = function()
      require("nvim-rooter").setup()
    end,
  },
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },

  -- LSP
  {
    "github/copilot.vim",
    event = "VeryLazy",
    config = function()
      vim.g.copilot_no_tab_map = true
    end,
  },
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

  -- Fuzzy finder
  { "ibhagwan/fzf-lua", event = "VeryLazy" },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },

  -- Git
  "lewis6991/gitsigns.nvim", -- use to display line change on the left of line numbers

  -- Debug Adapter Protocol
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "theHamsta/nvim-dap-virtual-text",
      "rcarriga/nvim-dap-ui",
    },
    config = function()
      require("nvim-dap-virtual-text").setup({})
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    config = function()
      require("user.dap.ui")
    end,
  },
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    config = function()
      require("user.dap.python")
    end,
  },
  {
    "leoluz/nvim-dap-go",
    ft = "go",
    config = function()
      require("user.dap.go")
    end,
  },

  -- Refactor
  "ThePrimeagen/refactoring.nvim",
}
local opts = {
  defaults = {
    lazy = true, -- should plugins be lazy-loaded?
  },
  lockfile = vim.fn.stdpath("config") .. "/lazy-lock.json",
}

require("lazy").setup(plugins, opts)
