
-- local status_ok, comment = pcall(require, "copilot.vim")
-- if not status_ok then
--   print("no copilot.")
--   return
-- end

vim.g.copilot_no_tab_map = true
vim.g.copilot_filetypes = {
    ["*"] = false,
    ["javascript"] = true,
    ["typescript"] = true,
    ["lua"] = false,
    ["rust"] = true,
    ["c"] = true,
    ["c#"] = true,
    ["c++"] = true,
    ["go"] = true,
    ["python"] = true,
  }
