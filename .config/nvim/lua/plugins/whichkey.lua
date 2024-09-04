return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	-- opts = {},
	keys = {},
	config = function()
		-- setup which key configuration
		require("plugins.config.whichkey.whichkey")
		require("config.keymap.window")
		require("config.keymap.buffer")
		require("config.keymap.telescope")
		require("config.keymap.toggleterm")
	end,
}
