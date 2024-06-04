-- Highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank({ higroup = "Visual", timeout = 200 })
  end,
})

-- Chezmoi apply after saving any file in ~/.local/share/chezmoi
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*/.local/share/chezmoi/*",
  callback = function()
    vim.cmd("silent !chezmoi apply --source-path " .. vim.fn.expand("%:p"))
  end,
})

-- Set filetype to sh for .env-example files
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, { pattern = "*.env-example", command = "set filetype=sh" })
