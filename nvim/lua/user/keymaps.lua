local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
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
--keymap("n", "<C-h>", "<C-w>h", opts)
--keymap("n", "<C-j>", "<C-w>j", opts)
--keymap("n", "<C-k>", "<C-w>k", opts)
--keymap("n", "<C-l>", "<C-w>l", opts)

--keymap("n", "<leader>e", ":Lex 30<cr>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "kj", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
--keymap("v", "<", "<gv", opts)
--keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
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

-- Markdown Preview
keymap("n", "<leader>m", ":MarkdownPreviewToggle<cr>", opts)

-- Nvimtree
keymap("n", "<F3>", ":NvimTreeToggle<cr>", opts)

-- LSP
keymap("n", "<leader>rf", "<cmd>Format<cr>", opts)
keymap("n", "<leader>rr", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
keymap("n", "<leader>fD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
keymap("n", "<leader>fd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
keymap("n", "<leader>fh", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
keymap("n", "<leader>sl", '<cmd>lua vim.diagnostic.open_float()<CR>', opts)

-- Fzf Lua
keymap('n', '<c-P>', "<cmd>FzfLua files<CR>", opts)
keymap("n", "<leader>fu", "<cmd>FzfLua lsp_references<cr>", opts)
keymap('n', '<leader>ff', "<cmd>FzfLua files<CR>", opts)
keymap('n', '<leader>fg', "<cmd>FzfLua live_grep<CR>", opts)
keymap('n', '<leader>fh', "<cmd>FzfLua help_tags<CR>", opts)
keymap('n', '<leader>go', "<cmd>FzfLua git_status<cr>", opts)
keymap('n', '<leader>gb', "<cmd>FzfLua git_branches<cr>", opts)
keymap('n', '<leader>gc', "<cmd>FzfLua git_commits<cr>", opts)

-- Trouble
keymap("n", "<leader>t", "<cmd>TroubleToggle<cr>", opts)

-- Dap
keymap("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
keymap("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", opts)
keymap("n", "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", opts)
keymap("n", "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", opts)
keymap("n", "<leader>dO", "<cmd>lua require'dap'.step_out()<cr>", opts)
keymap("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", opts)
keymap("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", opts)
keymap("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", opts)
keymap("n", "<leader>dx", "<cmd>lua require'dap'.terminate()<cr>", opts)

-- Refacror
keymap("v", "<leader>rm", [[<Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>]], opts)
keymap("v", "<leader>rv", [[<Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>]], opts)
keymap("v", "<leader>ri", [[<Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]], opts)

keymap("n", "<leader>ri", [[<Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]], opts)

-- Copilot
keymap("i", "<Right>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
