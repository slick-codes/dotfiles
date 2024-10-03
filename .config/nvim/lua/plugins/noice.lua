return {
	"folke/noice.nvim",
	dependencies = {
		-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
		"MunifTanjim/nui.nvim",
		-- OPTIONAL:
		--   `nvim-notify` is only needed, if you want to use the notification view.
		--   If not available, we use `mini` as the fallback
		"rcarriga/nvim-notify",
	},
	event = "VeryLazy",
	opts = function(_, opts)
		require("notify").setup({
			background_colour = "#FFFFFF",
		})

		require("nui.popup")({
			position = {
				relative = true,
				col = 50,
				row = 50,
			},
			size = {
				width = 80,
				height = 40,
			},
			enter = true,
			focusable = true,
			zindex = 50,
			relative = "editor",
			border = {
				padding = {
					top = 2,
					bottom = 2,
					left = 3,
					right = 3,
				},
				style = "rounded",
				text = {
					top = " I am top title ",
					top_align = "center",
					bottom = "I am bottom title",
					bottom_align = "left",
				},
			},
			buf_options = {
				modifiable = true,
				readonly = false,
			},
			win_options = {
				winblend = 10,
				winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
			},
		})
		opts.presets = {
			notify = {
				position = {
					row = "50%",
					col = "50%",
				},
			},
			command_palette = {
				views = {
					cmdline_popup = {
						position = {
							row = "15%",
							col = "50%",
						},
						size = {
							min_width = 50,
							width = "auto",
							height = "auto",
							max_width = 60,
						},
					},
				},
			},
		}
	end,
}
