local lsp = require("lsp-zero")

lsp.preset({
    name = "recommended",
    set_lsp_keymaps = false,
})

-- Install these servers
lsp.ensure_installed({
    "lua_ls",
    "nixd",
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

-- End

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
require("user.lsp.cmp")
