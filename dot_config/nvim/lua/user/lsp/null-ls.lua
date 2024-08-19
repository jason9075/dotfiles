local null_ls = require("null-ls")
local mason_null_ls = require("mason-null-ls")

mason_null_ls.setup({
  ensure_installed = { "stylua", "jq" },
  automatic_installation = false,
  automatic_setup = true,
})

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
  sources = {
    null_ls.builtins.code_actions.gitsigns,
    formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
    formatting.black.with({ extra_args = { "--fast" } }),
    formatting.stylua.with({ extra_args = { "--indent-width", "2", "--indent-type", "Spaces" } }),
    formatting.clang_format.with({
      filetypes = { "c", "cpp", "objc", "objcpp", "glsl" },
      extra_args = { "--style={BasedOnStyle: Google, ColumnLimit: 120}" },
    }),
    require("none-ls.diagnostics.flake8").with({ extra_args = { "--max-line-length", "120" } }),
    diagnostics.staticcheck,
  },
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
          vim.lsp.buf.format({ bufnr = bufnr })
        end,
      })
    end
  end,
})

mason_null_ls.setup({
  automatic_setup = true,
})
