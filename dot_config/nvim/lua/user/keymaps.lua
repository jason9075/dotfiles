local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)
-- Move screen up and down
keymap("n", "<S-k>", "5<C-y>", opts)
keymap("n", "<S-j>", "5<C-e>", opts)

-- Move textline up and down
keymap("n", "<A-j>", ":m .+1<CR>", opts)
keymap("n", "<A-k>", ":m .-2<CR>", opts)

-- Insert --
-- Press kj fast to exit
keymap("i", "kj", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
--keymap("v", "<", "<gv", opts)
--keymap("v", ">", ">gv", opts)

-- Move textline up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
-- Paste without loss register
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move textline up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Custom tmux navigation --
vim.g.tmux_navigator_no_mappings = 1
keymap("n", "<C-h>", "<cmd>TmuxNavigateLeft<CR>", opts)
keymap("n", "<C-j>", "<cmd>TmuxNavigateDown<CR>", opts)
keymap("n", "<C-k>", "<cmd>TmuxNavigateUp<CR>", opts)
keymap("n", "<C-l>", "<cmd>TmuxNavigateRight<CR>", opts)
-- keymap("n", "<C-\\>", "<cmd>TmuxNavigatePrevious<CR>", opts)

-- NeoTree
keymap("n", "<leader>e", "<cmd>NeoTreeRevealToggle<CR>", opts)
