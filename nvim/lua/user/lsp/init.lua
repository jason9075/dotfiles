local lsp = require("lsp-zero")
lsp.preset("recommended")

-- Install these servers
lsp.ensure_installed({
  "sumneko_lua",
})

-- Python
lsp.configure("pyright", {
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "basic",
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        autoImportCompletions = true,
      },
    },
  },
})

-- Golang
local util = require("lspconfig/util")
lsp.configure("gopls", {
  cmd = { "gopls", "serve" },
  filetypes = { "go", "gomod" },
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
    },
  },
})

-- Terraform
require("user.lsp.settings.terraformls")

lsp.setup()

vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  update_in_insert = false,
  underline = true,
  severity_sort = true,
})

require("user.lsp.luasnip")
require("user.lsp.null-ls")
