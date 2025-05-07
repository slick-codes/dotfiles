return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
		"mfussenegger/nvim-dap",
		"mfussenegger/nvim-dap-ui",
		"mhartington/formatter.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"numToStr/Comment.nvim", -- Optional
		"nvim-telescope/telescope.nvim", -- Optional
		"stevearc/conform.nvim",
		"SmiteshP/nvim-navbuddy",
		"SmiteshP/nvim-navic",
		"MunifTanjim/nui.nvim",
	},
	-- event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("mason").setup({
			registries = {
				-- this ensure the registery is regenerated if it was ever deleted
				"github:mason-org/mason-registry@2023-05-15-next-towel",
			},
		})

		require("mason-tool-installer").setup({
			ensure_installed = { "stylua","eslint-lsp", "eslint_d", "prettier", "typescript-language-server", "prettierd", "emmet-ls", "lua_ls" },
			automatic_installation = true,
		})

		require("mason-lspconfig").setup({
			ensure_installed = { "glint", "emmet_ls", "ember", "volar", "svelte" },
			automatic_installation = true,
		})

		local lspconfig = require("lspconfig")
		-- initiate lps configuration
		require("plugins.lsp.lsp").init(lspconfig)
	end,
}
