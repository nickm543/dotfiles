local capabilities = require("cmp_nvim_lsp").default_capabilities()

local lspconfig = require('lspconfig')

lspconfig.gopls.setup {
    capabilities = capabilities 
}
lspconfig.omnisharp.setup {}
