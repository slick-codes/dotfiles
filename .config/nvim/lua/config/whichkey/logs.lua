local whichkey = require("which-key")

whichkey.add({
	{ "<leader>l", group = "(L)ogs" },
	{ "<leader>lc", "<cmd>Telescope command_history<cr>", desc = "Command Logs" },
	{ "<leader>lh", "<cmd>Telescope noice<CR>", desc = "Command", mode = "n" },
})
