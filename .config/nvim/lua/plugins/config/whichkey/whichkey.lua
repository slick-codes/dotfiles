local whichkey = require("which-key")

-- find file
whichkey.add({
	{ "<leader>f", group = "(Find) (F)iles" },
	{ "<leader><space>", "<cmd>Telescope find_files hidden=true no_ignore=true<CR>", desc = "Find Files", mode = "n" },
	{ "<leader>ff", "<cmd>Telescope find_files hidden=true no_ignore=true<CR>", desc = "Find Files", mode = "n" },
	{ "<leader>fg", "<cmd>Telescope live_grep hidden=true no_ignore=true<CR>", desc = "Find Grep", mode = "n" },
	{ "<leader>fb", "<cmd>Telescope buffers< hidden=true no_ignore=trueCR>", desc = "Find Buffer", mode = { "n" } },
})

-- logs
whichkey.add({
	{ "<leader>l", group = "(L)ogs" },
	{ "<leader>lc", "<cmd>Telescope command_history<cr>", desc = "Command Logs" },
	{ "<leader>lh", "<cmd>Telescope noice<CR>", desc = "Command", mode = "n" },
})

-- UI
whichkey.add({
	{ "<leader>u", group = "UI" },
	{ "<leader>ut", "<cmd>Telescope themes<CR>", desc = "Theme Switcher" },
})

-- terminal
whichkey.add({
	{ "<leader>t", group = "Terminal" },
	{ "<leader>tt", "<cmd>ToggleTerm<CR>", desc = "Toggle Terminal", mode = { "n", "v" } },
	{
		"<leader>th",
		"<cmd>ToggleTerm direction=horizontal<CR> | 2ToggleTerm direction=horizontal",
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

--- window
whichkey.add({
	{ "<leader>w", group = "Window" },
	{ "<leader>we", "<cmd> wincmd =<CR>", desc = "Equalize Window", mode = { "n" } },
})

-- buffer
whichkey.add({
	{ "<leader>b", group = "Buffer" },
})

-- lsp
whichkey.add({
	{ "<leader>c", group = "Code" },
	{ "<leader>cg", vim.lsp.buf.implementation, desc = "Go Definition", mode = { "n" } },
	{ "<leader>ci", vim.lsp.buf.implementation, desc = "Go Implementation", mode = { "n" } },
	{ "<leader>ch", vim.lsp.buf.hover, desc = "Hover", mode = { "n" } },
})
