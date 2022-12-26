-- Usage: https://github.com/hashicorp/terraform-ls/blob/main/docs/USAGE.md
vim.api.nvim_create_autocmd({"BufWritePre"}, {
  pattern = {"*.tf", "*.tfvars"},
  callback = vim.lsp.buf.format,
})

return {}
