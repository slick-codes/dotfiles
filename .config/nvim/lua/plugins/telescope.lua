return {
	"nvim-telescope/telescope.nvim",
	lazy = false,
	-- event = "VeryLazy",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"andrewberty/telescope-themes",
	},
	config = function()
		local telescope = require("telescope")
		telescope.load_extension("themes")

		telescope.setup({
			extensions = {
				themes = {
					enable_live_preview = true,
					enable_previewer = false,
					ignore = {},
					theme = "ivy",
				},
			},
			defaults = {
				preview = false,
				file_ignore_patterns = {
                         "lazy-lock.json",
                         "init.lua",
                         "node_modules",
                         ".git",
                         ".output",
                         ".nuxt",
                         "dist"
                    },
				fuzzy_filter = {
					case_mode = "smart-case",
				},
				pickers = {},
			},
		})

		-- setup keymap
		local builtin = require("telescope.builtin")

		vim.keymap.set("n", "<leader><leader>", builtin.find_files, { desc = "Telescope find files" })
		vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
		vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
	end,
}
