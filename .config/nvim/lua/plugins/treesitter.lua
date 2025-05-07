return {
	"nvim-treesitter/nvim-treesitter",
	config = function()
		require("nvim-treesitter.configs").setup({
			-- A list of parser names, or "all" (the listed parsers MUST always be installed)
			ensure_installed = {
				"lua",
				"javascript",
				"typescript",
				"go",
				"glimmer", -- for template files like handlebars
				"gomod",
				"json",
				"html",
				"css",
				"vue",
				-- "react",
				"svelte",
				"html",
				"scss",
			},
			automatic_installation = true,
			-- Install parsers synchronously (only applied to `ensure_installed`)
			sync_install = false,
			-- Automatically install missing parsers when entering buffer
			-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
			auto_install = true,
			-- List of parsers to ignore installing (or "all")
			ignore_install = {},

			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
		})
		vim.filetype.add({
			extension = {
				hbs = "glimmer",
				handlebars = "glimmer",
				javascript = "javascript",
			},
		})

		-- Prevent everything from collapsing
		-- vim.opt.foldmethod = "expr"
		-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
		-- vim.opt.foldenable = false -- Disable folding by default
		-- vim.opt.foldlevel = 99 -- Ensure everything is expanded
	end,
}
