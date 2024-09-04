return {
	"lukas-reineke/indent-blankline.nvim",
	opts = {
		indent = {
			char = "",
			tab_char = "",
		},
		scope = { enabled = true },
		exclude = {
			filetypes = { "help", "alpha", "NvimTree", "lazy" },
		},
	},
	main = "ibl",
	config = function()
		require("ibl").setup()
	end,
}
