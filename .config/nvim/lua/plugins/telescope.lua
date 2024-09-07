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
				preview = false,
				file_ignore_patterns = { "node_modules", ".git" },
				fuzzy_filter = {
					case_mode = "smart-case",
				},
				pickers = {
					fuzzy_filter = true,
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
