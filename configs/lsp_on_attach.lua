 return {
    on_attach = function(client, bufnr)
        require("lsp-format").on_attach(client, bufnr)
        require("plugins.configs.lspconfig").on_attach(client, bufnr)
    end
}
