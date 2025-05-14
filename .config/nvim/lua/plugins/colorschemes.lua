-- Setup default theme
-- setup must be called before loading

local M = {
	-- {
	-- 	"xiyaowong/transparent.nvim", -- force most theme to be transparent
	-- 	lazy = false,
	-- 	config = function()
	-- 		vim.cmd("TransparentDisable")
	-- 		vim.cmd("colorscheme retrobox")
	-- 	end,
	-- },
     {
          "maxmx03/solarized.nvim",
          lazy = false,
          config = function()end
     },
	{
		"folke/tokyonight.nvim",
		lazy = false,
		-- priority = 500,
		opts = {
			transparent = false,
		},
		config = function()
			-- require("tokyonight").setup({ style = "storm" })
		end,
	},
	{
		"Mofiqul/dracula.nvim",
		lazy = false,
		-- priority = 500,
		opts = {
			transparent = false,
		},
	},
	{
		"sho-87/kanagawa-paper.nvim",
		lazy = false,
		-- priority = 500,
		opts = {
			transparent = false,
		},
	},
	{
		"scottmckendry/cyberdream.nvim",
		lazy = false,
		-- priority = 500,
		opts = {
			transparent = false,
		},
	},
	{
		"sainnhe/everforest",
		lazy = false,
		-- priority = 500,
		config = function() end,
		opts = {
			transparent = false,
		},
	},
	{
		"ellisonleao/gruvbox.nvim",
		lazy = false,
		-- priority = 500,
		opts = {
			transparent = false,
               vim.cmd("colorscheme gruvbox")
		},
	},
	{
		"tsuzat/NeoSolarized.nvim",
		lazy = false,
		-- priority = 500,
		opts = {
			transparent = false,
		},
	},
	{
		"b0o/lavi.nvim",
		lazy = false,
		-- priority = 500,
		dependencies = { "rktjmp/lush.nvim" },
		opts = { transparent = false },
		config = function() end,
	},
	{
		"rose-pine/neovim",
		lazy = false,
		-- priority = 500,
		config = function()
			require("rose-pine").setup({})
		end,
	},
	{
		"catppuccin/nvim",
		lazy = false,
		-- priority = 500,
		config = function()
			require("catppuccin").setup({})
		end,
	},
}

return M
