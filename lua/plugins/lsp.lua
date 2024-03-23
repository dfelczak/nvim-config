local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local function custom_on_attach(client, bufnr)
	-- Custom actions on attaching to a language server (e.g., additional setup)
end

local default_config = {
	on_attach = custom_on_attach,
}

-- Set up TSS server
lspconfig.tsserver.setup(default_config)

-- ... set up other servers (if needed) ...

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	-- Configure diagnostics display
	underline = true,
	virtual_text = false,
	signs = true,
	update_in_insert = true,
})
