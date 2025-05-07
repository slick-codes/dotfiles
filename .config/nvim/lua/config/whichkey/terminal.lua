local whichkey = require("which-key")

whichkey.add({
	{ "<leader>t", group = "Terminal" },
	{
		-- toggle terminal using the Ctrl+` keymap
		"<C-`>",
		"<cmd>ToggleTerm<CR>",
		desc = "Toggle Terminal",
		mode = { "n", "i", "t" },
	},
	{ "<leader>tt", "<cmd>ToggleTerm<CR>", desc = "Toggle Terminal", mode = { "n", "v" } },
	{
		"<leader>th",
		"<cmd>ToggleTerm direction=horizontal<CR><cmd>2ToggleTerm direction=horizontal<CR>",
		desc = "Horizontal Terminal",
		mode = { "n", "v" },
	},
	{
		"<leader>tv",
		"<cmd>ToggleTerm direction=vertical<CR> | 2ToggleTerm direction=vertical",
		desc = "Vertical Terminal",
		mode = { "n", "v" },
	},
})
