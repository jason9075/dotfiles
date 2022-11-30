local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
    return
end

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)
    local opts = {
        on_attach = require("user.lsp.handlers").on_attach,
        capabilities = require("user.lsp.handlers").capabilities,
    }

    if server.name == "jsonls" then
        local jsonls_opts = require("user.lsp.settings.jsonls")
        opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
    elseif server.name == "sumneko_lua" then
        local sumneko_opts = require("user.lsp.settings.sumneko_lua")
        opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
    elseif server.name == "pyright" then
        local pyright_opts = require("user.lsp.settings.pyright")
        opts = vim.tbl_deep_extend("force", pyright_opts, opts)
    elseif server.name == "gopls" then
        local gopls_opts = require("user.lsp.settings.gopls")
        opts = vim.tbl_deep_extend("force", gopls_opts, opts)
    elseif server.name == "golangci_lint_ls" then
        local pyright_opts = require("user.lsp.settings.golangci_lint_ls")
        opts = vim.tbl_deep_extend("force", pyright_opts, opts)
    elseif server.name == "clangd" then
        local clangd = require("user.lsp.settings.clangd")
        opts = vim.tbl_deep_extend("force", clangd, opts)
    elseif server.name == "terraformls" then
        local terraformls = require("user.lsp.settings.terraformls")
        opts = vim.tbl_deep_extend("force", terraformls, opts)
    else
        print("Warning: lsp-installer server name  \""..server.name .."\"does not have operation.")
    end
    -- This setup() function is exactly the same as lspconfig's setup function.
    -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    server:setup(opts)
end)
