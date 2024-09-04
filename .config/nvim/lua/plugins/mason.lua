local ensure_installed = {
	"tsserver",
	"pyright",
	"lua_ls",
	"jsonls",
	"yamlls",
	"taplo",
	"eslint",
	-- CSS
	"css-lsp",
	-- SASS
	"some-sass-language-server",
	-- HTML
	"htmlhint",
	-- "htmlbeautifier",
	"html-lsp",
	"emmet-language-server",
	-- Golang
	"golangci-lint-langserver",
	"golangci_lint_ls",
	"gopls",
	"golangci-lint",
	"biome", -- javascript linter
	--Svelte Kit
	"svelte-language-server",
	"stylua",
	"eslint_d",
	"prettier",
	"prettierd",
	"dprint",
}

return {
	"williamboman/mason.nvim",
	dependencies = {
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	},
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		-- initiate mason
		require("mason").setup()
		-- mason tool allows me install supported mson lsp
		require("mason-tool-installer").setup({
			automatic_installation = true,
			ensure_installed = ensure_installed,
			ui = {
				icons = {
					package_installed = "🔥",
					package_pending = "🧨",
					package_uninstalled = "😥",
				},
			},
		})

		-- install lsp with mason-lspconfig
		require("mason-lspconfig").setup({
			automatic_installation = true,
			ensure_installed = {
				"lua_ls",
				"gopls",
				"eslint",
				"svelte",
			},
		})

		-- import lsp configuration
		require("plugins.config.lsp")
	end,
}
