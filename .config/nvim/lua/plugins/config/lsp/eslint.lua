-- local on_attach = require("plugins.mason").on_attach
local capabilities = require("plugins.mason").capabilities
local lspconfig = require("lspconfig")

local eslint = {
	lintCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT}",
	lintStdin = true,
	lintFormats = { "%f:%l:%c: %m" },
	lintIgnoreExitCode = true,
	formatCommand = "eslint_d --fix-to-stdout --stdin --stdin-filename=${INPUT}",
	formatStdin = true,
}

return function(on_attach)
	lspconfig.eslint.setup({
		on_attach = function(client, bufnr)
			on_attach(client, bufnr)
		end,
		settings = {
			languages = {
				javascript = { eslint },
				javascriptreact = { eslint },
				["javascript.jsx"] = { eslint },
				typescript = { eslint },
				["typescript.tsx"] = { eslint },
				typescriptreact = { eslint },
			},
		},
		filetypes = {
			"javascript",
			"javascriptreact",
			"javascript.jsx",
			"typescript",
			"typescript.tsx",
			"typescriptreact",
		},
	})
end
