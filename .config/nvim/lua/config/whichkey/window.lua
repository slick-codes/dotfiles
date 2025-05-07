local whichkey = require("which-key")

whichkey.add({
	{ "<leader>w", group = "Windows" },
	{ "<leader>ws", group = "Split Window" },
	{ "<leader>we", "<cmd> wincmd =<CR>", desc = "Equalize Windows", mode = { "n", "v" } },
	{ "<leader>wsv", "<cmd> vsplit <CR>", desc = "Split Vertical", mode = { "n", "v" } },
	{ "<leader>wsh", "<cmd> split <CR>", desc = "Split Horizontal", mode = { "n", "v" } },
})
