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
		require("notify").setup({ background_colour = "#FFFFFF" })

		opts.presets = {
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
					popupmenu = {
						relative = "editor",
						position = {
							row = 23,
							col = "50%",
						},
						size = {
							width = 60,
							height = "auto",
							max_height = 15,
						},
						border = {
							style = "rounded",
							padding = { 0, 1 },
						},
						win_options = {
							winhighlight = { Normal = "Normal", FloatBorder = "NoiceCmdlinePopupBorder" },
						},
					},
				},
			},
		}
	end,
}
