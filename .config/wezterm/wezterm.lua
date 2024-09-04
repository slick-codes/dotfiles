local wezterm = require("wezterm")
local ssh_domains = require("extra.ssh")

return {
	-- color scheme
	color_scheme = "Banana Blueberry",
	--window opacity reduced
	window_background_opacity = 0.96,
	-- make sure you use a font you have installed
	font = wezterm.font("Fira Code"),
	-- Change Font Size
	font_size = 9.5,
	dpi = 96.0,
	enable_scroll_bar = true,
	-- Font Height
	line_height = 1.5,
	-- TAB Confiruration --
	hide_tab_bar_if_only_one_tab = true,
	window_frame = {
		inactive_titlebar_bg = "rgba(0,0,0, .85)",
	},
	initial_rows = 10,
	initial_cols = 73,
	adjust_window_size_when_changing_font_size = false,
	window_padding = {},
	colors = {
		tab_bar = {
			inactive_tab_edge = "#ffffff",
		},
	},
	-- scroll bar
	-- Custom Key Bindings
	-- disable_default_key_bindings = true,
	-- ssh_domains = ssh_domains,
}
