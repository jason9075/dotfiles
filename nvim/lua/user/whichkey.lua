local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

local setup = {
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
  -- operators = { gc = "Comments" },
  key_labels = {
    -- override the label used to display some keys. It doesn't effect WK in any other way.
    -- For example:
    --[[ ["<space>"] = "SPC", ]]
    --[[ ["<CR>"] = "RET", ]]
    --[[ ["<tab>"] = "TAB", ]]
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  popup_mappings = {
    scroll_down = "<c-d>", -- binding to scroll down inside the popup
    scroll_up = "<c-u>", -- binding to scroll up inside the popup
  },
  window = {
    border = "rounded", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    winblend = 0,
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
    align = "left", -- align columns left, center or right
  },
  ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
  show_help = true, -- show help message on the command line when the popup is visible
  triggers = "auto", -- automatically setup triggers
  -- triggers = {"<leader>"} -- or specify a list manually
  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for key maps that start with a native binding
    -- most people should not need to change this
    i = { "j", "k" },
    v = { "j", "k" },
  },
}

local opts = {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
  ["/"] = { '<cmd>lua require("Comment.api").toggle.linewise.current()<CR>', "Comment" },
  ["e"] = { "<cmd>NvimTreeToggle<CR>", "Explorer (NvimTree)" },
  ["w"] = { "<cmd>w!<CR>", "Save" },
  ["W"] = { "<cmd>wqa<CR>", "Save & Quit" },
  ["q"] = { "<cmd>lua require('user.utils.function').smart_quit()<CR>", "Quit" },
  ["Q"] = { "<cmd>qa!<CR>", "Quit!" },
  ["c"] = { "<cmd>Bdelete!<CR>", "Close Buffer" },
  b = {
    name = "Buffers",
    j = { "<cmd>BufferLinePick<CR>", "Jump" },
    f = { "<cmd>FzfLua buffers<CR>", "Find" },
    b = { "<cmd>BufferLineCyclePrev<CR>", "Previous" },
    n = { "<cmd>BufferLineCycleNext<CR>", "Next" },
    c = {
      "<cmd>BufferLinePickClose<CR>",
      "Pick which buffer to close",
    },
    v = { "<cmd>vs<CR>", "Vertical Split" },
    h = { "<cmd>BufferLineCloseLeft<CR>", "Close all to the left" },
    l = {
      "<cmd>BufferLineCloseRight<CR>",
      "Close all to the right",
    },
    D = {
      "<cmd>BufferLineSortByDirectory<CR>",
      "Sort by directory",
    },
    L = {
      "<cmd>BufferLineSortByExtension<CR>",
      "Sort by language",
    },
  },

  p = {
    name = "Packer",
    c = { "<cmd>PackerCompile<CR>", "Compile" },
    i = { "<cmd>PackerInstall<CR>", "Install" },
    s = { "<cmd>PackerSync<CR>", "Sync" },
    S = { "<cmd>PackerStatus<CR>", "Status" },
    u = { "<cmd>PackerUpdate<CR>", "Update" },
  },

  g = {
    name = "Git",
    j = { "<cmd>lua require 'gitsigns'.next_hunk()<CR>", "Next Hunk" },
    k = { "<cmd>lua require 'gitsigns'.prev_hunk()<CR>", "Prev Hunk" },
    l = { "<cmd>lua require 'gitsigns'.blame_line()<CR>", "Blame" },
    p = { "<cmd>lua require 'gitsigns'.preview_hunk()<CR>", "Preview Hunk" },
    r = { "<cmd>lua require 'gitsigns'.reset_hunk()<CR>", "Reset Hunk" },
    R = { "<cmd>lua require 'gitsigns'.reset_buffer()<CR>", "Reset Buffer" },
    s = { "<cmd>lua require 'gitsigns'.stage_hunk()<CR>", "Stage Hunk" },
    u = { "<cmd>lua require 'gitsigns'.undo_stage_hunk()<CR>", "Undo Stage Hunk" },
    o = { "<cmd>FzfLua git_status<CR>", "Statue" },
    b = { "<cmd>FzfLua git_branches<CR>", "Checkout branch" },
    c = { "<cmd>FzfLua git_commits<CR>", "Checkout commit" },
    d = { "<cmd>Gitsigns diffthis HEAD<CR>", "Diff" },
  },

  h = {
    name = "Harpoon",
    a = { "<cmd>lua require('harpoon.mark').add_file()<CR>", "Add" },
    r = { "<cmd>lua require('harpoon.mark').rm_file()<CR>", "Remove" },
    R = { "<cmd>lua require('harpoon.mark').clear_all()<CR>", "Remove All" },
    m = { "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>", "Menu" },
    j = { "<cmd>lua require('harpoon.ui').nav_next()<CR>", "Next Mark" },
    k = { "<cmd>lua require('harpoon.ui').nav_prev()<CR>", "Previous Mark" },
  },

  l = {
    name = "LSP",
    a = { "<cmd>FzfLua lsp_code_actions<CR>", "Code Action" },
    i = { "<cmd>LspInfo<CR>", "Info" },
    I = { "<cmd>Mason<CR>", "Installer Info" },
    j = { "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", "Next Diagnostic" },
    k = { "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", "Prev Diagnostic" },
    l = { "<cmd>lua vim.lsp.codelens.run()<CR>", "CodeLens Action" },
    q = { "<cmd>FzfLua qucikfix<CR>", "Quickfix" },
  },

  r = {
    name = "Refactor",
    f = { "<cmd>LspZeroFormat<CR>", "Format" },
    r = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
    i = { "<Cmd>lua require('refactoring').refactor('Inline Variable')<CR>", "Inline Variable" },
  },

  f = {
    name = "Find",
    D = { "<cmd>lua vim.lsp.buf.declaration()<CR>", "Declaration" },
    d = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Definition" },
    r = { "<cmd>FzfLua lsp_references<CR>", "References" },
    i = { "<cmd>FzfLua lsp_implementations<CR>", "Iplementations" },
    f = { "<cmd>FzfLua files<CR>", "Files" },
    g = { "<cmd>FzfLua live_grep<CR>", "Live Grep" },
    h = { "<cmd>FzfLua help_tags<CR>", "Help Tags" },
    k = { "<cmd>FzfLua keymaps<CR>", "Keymappings" },
  },

  s = {
    name = "Show Info",
    h = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Hover" },
    l = { "<cmd>lua vim.diagnostic.open_float()<CR>", "Line Diagnostic" },
  },

  d = {
    name = "Debug",
    b = { "<cmd>lua require'dap'.toggle_breakpoint()<CR>", "Breakpoint" },
    c = { "<cmd>lua require'dap'.continue()<CR>", "Continue" },
    C = { "<cmd>lua require'dap'.run_to_cursor()<CR>", "Run To Cursor" },
    d = { "<cmd>lua require'dap'.disconnect()<CR>", "Disconnect" },
    i = { "<cmd>lua require'dap'.step_into()<CR>", "Into" },
    o = { "<cmd>lua require'dap'.step_over()<CR>", "Over" },
    O = { "<cmd>lua require'dap'.step_out()<CR>", "Out" },
    p = { "<cmd>lua require'dap'.pause()<CR>", "Pause" },
    r = { "<cmd>lua require'dap'.repl.toggle()<CR>", "Repl" },
    l = { "<cmd>lua require'dap'.run_last()<CR>", "Last" },
    u = { "<cmd>lua require'dapui'.toggle()<CR>", "UI" },
    x = { "<cmd>lua require'dap'.terminate()<CR>", "Exit" },
  },

  -- https://github.com/nvim-tree/nvim-tree.lua/blob/master/doc/nvim-tree-lua.txt
  n = {
    name = "nvimTree Actions",
    a = { "<cmd>lua require('nvim-tree.api').fs.create()<CR>", "Create" },
    r = { "<cmd>lua require('nvim-tree.api').fs.rename_node()<CR>", "Rename" },
    d = { "<cmd>lua require('nvim-tree.api').fs.remove()<CR>", "Remove" },
    p = { "<cmd>lua require('nvim-tree.api').fs.paste()<CR>", "Paste File" },
    x = { "<cmd>lua require('nvim-tree.api').fs.cut()<CR>", "Cut File" },
    c = { "<cmd>lua require('nvim-tree.api').fs.copy.node()<CR>", "Copy File" },
    y = { "<cmd>lua require('nvim-tree.api').fs.copy.filename()<CR>", "Copy Name" },
    Y = { "<cmd>lua require('nvim-tree.api').fs.copy.absolute_path()<CR>", "Copy Path" },
    R = { "<cmd>lua require('nvim-tree.api').tree.reload()<CR>", "Refresh" },
    h = { "<cmd>lua require('nvim-tree.api').tree.toggle_help()<CR>", "Help" },
    I = { "<cmd>lua require('nvim-tree.api').tree.toggle_gitignore_filter()<CR>", "Show/Hide Ignore Files" },
    H = { "<cmd>lua require('nvim-tree.api').tree.toggle_hidden_filter()<CR>", "Show/Hide Hidden Files" },
    v = { "<cmd>lua require('nvim-tree.api').node.open.vertical()<CR>", "Open Vertical" },
  },
}

local vopts = {
  mode = "v", -- VISUAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}
local vmappings = {
  ["/"] = { '<ESC><CMD>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>', "Comment" },
  r = {
    name = "Refactor",
    m = { "<Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>", "Extract Method" },
    v = { "<Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>", "Extract Variable" },
    i = { "<Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>", "Inline Variable" },
  },
}

which_key.setup(setup)
which_key.register(mappings, opts)
which_key.register(vmappings, vopts)
