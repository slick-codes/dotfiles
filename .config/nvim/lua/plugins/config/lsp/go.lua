-- local on_attach = require("plugins.mason").on_attach
local capabilities = require("plugins.mason").capabilities

local lspconfig = require("lspconfig")
-- local util = require("lspconfig/util")

return function(on_attach)
	-- Setup golang
	lspconfig.gopls.setup({
		on_attach = function(client, bufnr)
			on_attach(client, bufnr)
		end,
		capabilities = capabilities,
		cmd = { "gopls" },
		filetypes = { "go", "gomod", "gowork", "gtmpl" },
		-- root_dir = util.root_patterm(".git"),
		settings = {
			gopls = {
				completeUnimported = true,
				usePlaceholders = true,
				analyses = {
					unusedparams = true,
				},
			},
		},
	})
end
