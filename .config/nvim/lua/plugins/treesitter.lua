return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
	version = true,
	opts = {
		indent = { enable = true },
	},
	config = function()
		--setup treesitter
		local treesitter = require("nvim-treesitter.configs")
		treesitter.setup({
			-- indent = { enable = true },
			highlight = { enable = true },
			build = ":TSUpdate",
			event = { "BufReadPre", "BufNewFile" },
			auto_install = false,
			ensure_installed = {
				"bash",
				"cmake",
				"css",
				"scss",
				-- "go",
				-- "gomod",
				"svelte",
				-- "gosum",
				-- "gotmpl",
				"dockerfile",
				"graphql",
				"html",
				"vue",
				"tsx",
				"typescript",
				"c",
				"lua",
				"vim",
				"vimdoc",
				"query",
				"markdown",
				"markdown_inline",
				"java",
				"javascript",
			},
		})
	end,
}
