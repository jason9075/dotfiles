local wk = require("which-key")

local setup = {
  preset = "helix",
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = {
      operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = false, -- adds help for motions
      text_objects = false, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
  },
  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
    mappings = false, -- displays a list of mappings
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    -- width = { min = 25, max = 50 }, -- min and max width of the columns
    spacing = 4, -- spacing between columns
    align = "center", -- align columns left, center or right
  },
  show_help = true, -- show help message on the command line when the popup is visible
}

local mappings = {
  {
    mode = "n",
    { "<leader>/", "<cmd>lua require('Comment.api').toggle.linewise()<CR>", desc = "Comment" },
    { "<leader>e", "<cmd>NeoTreeRevealToggle<CR>", desc = "Explorer (NeoTree)" },
    { "<leader>w", "<cmd>w!<CR>", desc = "Save" },
    { "<leader>p", "<cmd>Lazy<CR>", desc = "Plugins" },
    { "<leader>q", "<cmd>lua require('user.utils.function').smart_quit()<CR>", desc = "Quit" },
    { "<leader>Q", "<cmd>qa!<CR>", desc = "Quit!" },
    { "<leader>x", "<cmd>Bdelete!<CR>", desc = "Close Buffer" },
    { "<leader>n", "<cmd>Noice dismiss<CR>", desc = "Close Noice Message" },
    { "<leader>o", "<cmd>BufferLineCloseOther<CR>", desc = "Close Others" },

    { "<leader>b", group = "Buffers" },
    { "<leader>bj", "<cmd>BufferLinePick<CR", desc = "Jump" },
    { "<leader>bf", "<cmd>FzfLua buffers<CR>", desc = "Find" },
    { "<leader>bp", "<cmd>BufferLineCyclePrev<CR>", desc = "Previous" },
    { "<leader>bn", "<cmd>BufferLineCycleNext<CR>", desc = "Next" },
    { "<leader>bc", "<cmd>BufferLinePickClose<CR>", desc = "Pick which buffer to close" },
    { "<leader>bv", "<cmd>vs<CR>", desc = "Vertical Split" },
    { "<leader>bo", "<cmd>BufferLineCloseOther<CR>", desc = "Close others" },
    { "<leader>bD", "<cmd>BufferLineSortByDirectory<CR>", desc = "Sort by directory" },
    { "<leader>bL", "<cmd>BufferLineSortByExtension<CR>", desc = "Sort by language" },

    { "<leader>g", group = "Git" },
    { "<leader>gj", "<cmd>lua require 'gitsigns'.next_hunk()<CR>", desc = "Next Hunk" },
    { "<leader>gk", "<cmd>lua require 'gitsigns'.prev_hunk()<CR>", desc = "Prev Hunk" },
    { "<leader>gl", "<cmd>lua require 'gitsigns'.blame_line()<CR>", desc = "Blame" },
    { "<leader>gp", "<cmd>lua require 'gitsigns'.preview_hunk()<CR>", desc = "Preview Hunk" },
    { "<leader>gr", "<cmd>lua require 'gitsigns'.reset_hunk()<CR>", desc = "Reset Hunk" },
    { "<leader>gR", "<cmd>lua require 'gitsigns'.reset_buffer()<CR>", desc = "Reset Buffer" },
    { "<leader>gs", "<cmd>FzfLua git_status<CR>", desc = "Statue" },
    { "<leader>gb", "<cmd>FzfLua git_branches<CR>", desc = "Checkout branch" },
    { "<leader>gc", "<cmd>FzfLua git_commits<CR>", desc = "Checkout commit" },
    { "<leader>gd", "<cmd>Gitsigns diffthis HEAD<CR>", desc = "Diff" },

    { "<leader>h", group = "Harpoon" },
    { "<leader>ha", "<cmd>lua require('harpoon.mark').add_file<CR>", desc = "Add" },
    { "<leader>hr", "<cmd>lua require('harpoon.mark').rm_file<CR>", desc = "Remove" },
    { "<leader>hR", "<cmd>lua require('harpoon.mark').clear_all<CR>", desc = "Remove All" },
    { "<leader>hm", "<cmd>lua require('harpoon.ui').toggle_quick_menu<CR>", desc = "Menu" },
    { "<leader>hj", "<cmd>lua require('harpoon.ui').nav_next<CR>", desc = "Next Mark" },
    { "<leader>hk", "<cmd>lua require('harpoon.ui').nav_prev<CR>", desc = "Previous Mark" },

    { "<leader>l", group = "LSP" },
    { "<leader>la", "<cmd>FzfLua lsp_code_actions<CR>", desc = "Code Action" },
    { "<leader>li", "<cmd>LspInfo<CR>", desc = "Info" },
    { "<leader>lI", "<cmd>Mason<CR>", desc = "Installer Info" },
    { "<leader>lj", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", desc = "Next Diagnostic" },
    { "<leader>lk", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", desc = "Prev Diagnostic" },
    { "<leader>ll", "<cmd>lua vim.lsp.codelens.run()<CR>", desc = "CodeLens Action" },
    { "<leader>lq", "<cmd>FzfLua qucikfix<CR>", desc = "Quickfix" },

    { "<leader>r", group = "Refactor" },
    { "<leader>rf", "<cmd>LspZeroFormat<CR>", desc = "Format" },
    { "<leader>rr", "<cmd>lua vim.lsp.buf.rename()<CR>", desc = "Rename" },
    { "<leader>ri", "<Cmd>lua require('refactoring').refactor('Inline Variable')<CR>", desc = "Inline Variable" },

    { "<leader>f", group = "Find" },
    { "<leader>fD", "<cmd>lua vim.lsp.buf.declaration()<CR>", desc = "Declaration" },
    { "<leader>fd", "<cmd>lua vim.lsp.buf.definition()<CR>", desc = "Definition" },
    { "<leader>fe", "<cmd>lua vim.diagnostic.goto_next()<CR>", desc = "Error" },
    { "<leader>fr", "<cmd>FzfLua lsp_references<CR>", desc = "References" },
    { "<leader>fi", "<cmd>FzfLua lsp_implementations<CR>", desc = "Implentations" },
    { "<leader>ff", "<cmd>FzfLua files<CR>", desc = "Files" },
    { "<leader>fn", "<cmd>Noice fzf<CR>", desc = "Notify" },
    { "<leader>fg", "<cmd>FzfLua live_grep<CR>", desc = "Live Grep" },
    { "<leader>fh", "<cmd>FzfLua help_tags<CR>", desc = "Help Tags" },
    { "<leader>fk", "<cmd>FzfLua keymaps<CR>", desc = "Keymaps" },
    { "<leader>fs", "<cmd>ClangdSwitchSourceHeader<CR>", desc = "Switch Source Header" },

    { "<leader>s", group = "Show Info" },
    { "<leader>sh", "<cmd>lua vim.lsp.buf.hover()<CR>", desc = "Hover" },
    { "<leader>sl", "<cmd>lua vim.diagnostic.open_float()<CR>", desc = "Line Diagnostic" },

    { "<leader>d", group = "Debug" },
    { "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", desc = "Breakpoint" },
    { "<leader>dc", "<cmd>lua require'dap'.continue()<CR>", desc = "Start/Continue" },
    { "<leader>dC", "<cmd>lua require'dap'.run_to_cursor()<CR>", desc = "Run To Cursor" },
    { "<leader>di", "<cmd>lua require'dap'.step_into()<CR>", desc = "Into" },
    { "<leader>do", "<cmd>lua require'dap'.step_over()<CR>", desc = "Over" },
    { "<leader>dO", "<cmd>lua require'dap'.step_out()<CR>", desc = "Out" },
    { "<leader>dp", "<cmd>lua require'dap'.pause()<CR>", desc = "Pause" },
    { "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<CR>", desc = "Repl" },
    { "<leader>dl", "<cmd>lua require'dap'.run_last()<CR>", desc = "Last" },
    { "<leader>dx", "<cmd>lua require'dap'.close()<CR>", desc = "Close" },
    {
      "<leader>dd",
      "<cmd>lua require'dap'.disconnect()<CR><cmd>lua require'dap'.repl.close()<CR>",
      desc = "Disconnect",
    },
    { "<leader>du", "<cmd>lua require'dapui'.toggle()<CR>", desc = "UI" },
  },
  {
    mode = "v",
    { "<leader>r", group = "Refactor" },
    { "<leader>rm", "<Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>", desc = "Extract Method" },
    {
      "<leader>rv",
      "<Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>",
      desc = "Extract Variable",
    },
    { "<leader>ri", "<Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>", desc = "Inline Variable" },
  },
}

wk.setup(setup)
wk.add(mappings)
