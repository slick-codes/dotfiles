local lspconfig = require("lspconfig")

return function(on_attach)
	lspconfig.svelte.setup({
		on_attach = function(client, bufnr)
			on_attach(client, bufnr)
		end,
		settings = {},
		filetypes = {},
	})
end
