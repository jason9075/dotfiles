local dap_status_ok, dap = pcall(require, "dap")
if not dap_status_ok then
    return
end

local dap_ui_status_ok, dapui = pcall(require, "dapui")
if not dap_ui_status_ok then
    return
end

-- Python

-- Reference: https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation#Python
local get_python_path = function ()
    local cwd = vim.fn.getcwd()
    if os.getenv("CONDA_PREFIX") ~= nil then
        return os.getenv("CONDA_PREFIX") .. '/bin/python'
    elseif os.getenv("CONDA_PYTHON_EXE") ~= nil then
        return os.getenv("CONDA_PYTHON_EXE")
    elseif vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
        return cwd .. '/venv/bin/python'
    elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
        return cwd .. '/.venv/bin/python'
    elseif vim.fn.executable('/usr/bin/python3') == 1 then
        return '/usr/bin/python3'
    else
        return nil
    end
end

python_path = get_python_path()
if python_path ~= nil then

    dap.adapters.python = {
        type = 'executable';
        command = get_python_path();
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
    
    vim.g.python3_host_prog = python_path
end

-- C++

-- download: https://github.com/vadimcn/vscode-lldb/releases
-- unzip
-- unzip codelldb-x86_64-linux.vsix -d ~/codelldb/
local cmd = '/home/jason9075/codelldb/extension/adapter/codelldb'

dap.adapters.codelldb = function(on_adapter)
  -- This asks the system for a free port
  local tcp = vim.loop.new_tcp()
  tcp:bind('127.0.0.1', 0)
  local port = tcp:getsockname().port
  tcp:shutdown()
  tcp:close()

  -- Start codelldb with the port
  local stdout = vim.loop.new_pipe(false)
  local stderr = vim.loop.new_pipe(false)
  local opts = {
    stdio = {nil, stdout, stderr},
    args = {'--port', tostring(port)},
  }
  local handle
  local pid_or_err
  handle, pid_or_err = vim.loop.spawn(cmd, opts, function(code)
    stdout:close()
    stderr:close()
    handle:close()
    if code ~= 0 then
      print("codelldb exited with code", code)
    end
  end)
  if not handle then
    vim.notify("Error running codelldb: " .. tostring(pid_or_err), vim.log.levels.ERROR)
    stdout:close()
    stderr:close()
    return
  end
  vim.notify('codelldb started. pid=' .. pid_or_err)
  stderr:read_start(function(err, chunk)
    assert(not err, err)
    if chunk then
      vim.schedule(function()
        require("dap.repl").append(chunk)
      end)
    end
  end)
  local adapter = {
    type = 'server',
    host = '127.0.0.1',
    port = port
  }
  -- 💀
  -- Wait for codelldb to get ready and start listening before telling nvim-dap to connect
  -- If you get connect errors, try to increase 500 to a higher value, or check the stderr (Open the REPL)
  vim.defer_fn(function() on_adapter(adapter) end, 500)
end

dap.configurations.cpp = {
  {
    name = "Launch file",
    type = "codelldb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = true,
  },
}

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
