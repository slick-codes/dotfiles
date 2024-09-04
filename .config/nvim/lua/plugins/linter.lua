return {
	"mfussenegger/nvim-lint",
	event = {
		"BufReadPre",
		"BufNewFile",
	},
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			go = { "gopls" },
			javascript = { "eslint_d" },
			-- typescript = { "eslint_d" },
			-- svelte = { "eslint_d" },
		}
	end,
}
