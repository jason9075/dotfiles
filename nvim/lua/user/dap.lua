local dap_status_ok, dap = pcall(require, "dap")
if not dap_status_ok then
    return
end

local dap_ui_status_ok, dapui = pcall(require, "dapui")
if not dap_ui_status_ok then
    return
end

-- Python
if vim.fn.has("python3") == 1 then
    -- Reference: https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation#Python
    local python_path = function ()
        local cwd = vim.fn.getcwd()
        if os.getenv("CONDA_PREFIX") ~= nil then
            return os.getenv("CONDA_PREFIX") .. '/bin/python'
        elseif os.getenv("CONDA_PYTHON_EXE") ~= nil then
            return os.getenv("CONDA_PYTHON_EXE")
        elseif vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
            return cwd .. '/venv/bin/python'
        elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
            return cwd .. '/.venv/bin/python'
        else
            return '/usr/bin/python3'
        end
    end

    dap.adapters.python = {
        type = 'executable';
        command = python_path();
        args = { '-m', 'debugpy.adapter' };
    }

    dap.configurations.python = {
        {
            -- The first three options are required by nvim-dap
            type = 'python'; -- the type here established the link to the adapter definition: `dap.adapters.python`
            request = 'launch';
            name = "Launch file";

            -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

            program = "${file}"; -- This configuration will launch the current file if used.
            pythonPath = python_path;
        },
    }
    
    vim.g.python3_host_prog = python_path()
end


-- Golang
-- Reference: https://github.com/leoluz/nvim-dap-go
local dap_go_ok, dap_go = pcall(require, "dap-go")
if dap_go_ok then
    dap_go.setup()
end


dapui.setup {
    icons = { expanded = "▾", collapsed = "▸" },
    mappings = {
        -- Use a table to apply multiple mappings
        expand = { "<CR>", "<2-LeftMouse>" },
        open = "o",
        remove = "d",
        edit = "e",
        repl = "r",
        toggle = "t",
    },
    sidebar = {
        -- You can change the order of elements in the sidebar
        elements = {
            -- Provide as ID strings or tables with "id" and "size" keys
            {
                id = "scopes",
                size = 0.25, -- Can be float or integer > 1
            },
            { id = "breakpoints", size = 0.25 },
            -- { id = "stacks", size = 0.25 },
            -- { id = "watches", size = 00.25 },
        },
        size = 40,
        position = "right", -- Can be "left", "right", "top", "bottom"
    },
    tray = {
        elements = {},
        -- elements = { "repl" },
        -- size = 10,
        -- position = "bottom", -- Can be "left", "right", "top", "bottom"
    },
    floating = {
        max_height = nil, -- These can be integers or a float between 0 and 1.
        max_width = nil, -- Floats will be treated as percentage of your screen.
        border = "rounded", -- Border style. Can be "single", "double" or "rounded"
        mappings = {
            close = { "q", "<Esc>" },
        },
    },
    windows = { indent = 1 },
}

local icons = require "user.icons"

vim.fn.sign_define('DapBreakpoint', { text = icons.ui.Bug, texthl = 'DiagnosticSignError', linehl = '', numhl = '' })

dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end
