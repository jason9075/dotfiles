-- Keymap options
local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- Set leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Shorten function name for convenience
local keymap = vim.keymap.set

-- Normal Mode --

-- Resize windows with arrow keys
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Scroll screen up and down
keymap("n", "<S-k>", "5<C-y>", opts)
keymap("n", "<S-j>", "5<C-e>", opts)

-- Move text lines up and down
keymap("n", "<A-j>", ":m .+1<CR>", opts)
keymap("n", "<A-k>", ":m .-2<CR>", opts)

-- Tmux navigation
vim.g.tmux_navigator_no_mappings = 1
keymap("n", "<C-h>", "<cmd>TmuxNavigateLeft<CR>", opts)
keymap("n", "<C-j>", "<cmd>TmuxNavigateDown<CR>", opts)
keymap("n", "<C-k>", "<cmd>TmuxNavigateUp<CR>", opts)
keymap("n", "<C-l>", "<cmd>TmuxNavigateRight<CR>", opts)
-- keymap("n", "<C-\\>", "<cmd>TmuxNavigatePrevious<CR>", opts)

-- NeoTree toggle
keymap("n", "<leader>e", "<cmd>NeoTreeRevealToggle<CR>", opts)

-- Insert Mode --

-- Exit insert mode by pressing 'kj' quickly
keymap({ "i", "s" }, "kj", "<ESC>", opts)

-- LuaSnip snippet navigation
keymap({ "i", "s" }, "<C-k>", "<cmd>lua require('luasnip').expand_or_jump()<CR>", opts)
keymap({ "i", "s" }, "<C-j>", "<cmd>lua require('luasnip').jump(-1)<CR>", opts)
keymap({ "i", "s" }, "<C-l>", "<cmd>lua require('luasnip').change_choice(1)<CR>", opts)

-- Visual Mode --

-- Stay in indent mode after shifting
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text lines up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)

-- Paste without overwriting the default register
keymap("v", "p", '"_dP', opts)

-- Visual Block Mode --

-- Move blocks of text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal Mode --

-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)
