local dap_status_ok, dap = pcall(require, "dap")
if not dap_status_ok then
  return
end

-- Python

-- Reference: https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation#Python
local get_python_path = function()
  local cwd = vim.fn.getcwd()
  if os.getenv("CONDA_PREFIX") ~= nil then
    return os.getenv("CONDA_PREFIX") .. "/bin/python"
  elseif os.getenv("CONDA_PYTHON_EXE") ~= nil then
    return os.getenv("CONDA_PYTHON_EXE")
  elseif vim.fn.executable(cwd .. "/venv/bin/python") == 1 then
    return cwd .. "/venv/bin/python"
  elseif vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
    return cwd .. "/.venv/bin/python"
  elseif vim.fn.executable("/usr/bin/python3") == 1 then
    return "/usr/bin/python3"
  else
    return nil
  end
end

python_path = get_python_path()
if python_path ~= nil then
  dap.adapters.python = {
    type = "executable",
    command = get_python_path(),
    args = { "-m", "debugpy.adapter" },
  }

  dap.configurations.python = {
    {
      -- The first three options are required by nvim-dap
      type = "python", -- the type here established the link to the adapter definition: `dap.adapters.python`
      request = "launch",
      name = "Launch file",
      -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

      program = "${file}", -- This configuration will launch the current file if used.
      pythonPath = python_path,
    },
  }

  vim.g.python3_host_prog = python_path
end
