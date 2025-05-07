return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	-- opts = {},
	keys = {},
	config = function()
		require("config.whichkey.window")
		require("config.whichkey.buffer")
		require("config.whichkey.code")
		require("config.whichkey.ui")
		require("config.whichkey.logs")
		require("config.whichkey.terminal")
	end,
}
