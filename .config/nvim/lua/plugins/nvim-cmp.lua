-- fix auto complete feature / suggestions
return {
	"hrsh7th/nvim-cmp", -- Required
	dependencies = {
		-- Autocompletion
		"hrsh7th/cmp-nvim-lsp", -- Required
		"hrsh7th/cmp-buffer", -- Optional
		"hrsh7th/cmp-path", -- Optional
		"saadparwaiz1/cmp_luasnip", -- Optional
		"hrsh7th/cmp-nvim-lua", -- Optional

		-- Snippets
		"L3MON4D3/LuaSnip", -- Required
		"rafamadriz/friendly-snippets", -- Optional
	},

	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		-- local lspkind = require("lspkind")

		cmp.setup({
			snippet = {
				-- REQUIRED - you must specify a snippet engine
				expand = function(args)
					vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
					-- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
					-- require('snippy').expand_snippet(args.body) -- For `snippy` users.
					-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
					-- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
				end,
			},
			window = {
				-- completion = cmp.config.window.bordered(),
				-- documentation = cmp.config.window.bordered(),
			},
			mapping = cmp.mapping.preset.insert({
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "vsnip" }, -- For vsnip users.
				{ name = "luasnip" }, -- For luasnip users.
				{ name = "ultisnips" }, -- For ultisnips users.
				{ name = "snippy" }, -- For snippy users.
			}, {
				{ name = "buffer" },
			}),
		})
	end,
}
