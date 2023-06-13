-- Golang
-- Reference: https://github.com/leoluz/nvim-dap-go
local dap_go_ok, dap_go = pcall(require, "dap-go")
if dap_go_ok then
  dap_go.setup()
end
