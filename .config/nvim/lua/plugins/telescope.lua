return {
	"nvim-telescope/telescope.nvim",
	lazy = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"andrewberty/telescope-themes",
	},
	config = function()
		require("telescope").setup({
			defaults = {
				fuzzy_filter = {
					case_mode = "smart-case",
				},
				pickers = {
					find_files = {
						fuzzy_filter = {
							case_mode = "smart-case",
						},
					},
				},
			},
		})
	end,
}
