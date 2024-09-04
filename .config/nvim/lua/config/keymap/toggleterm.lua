local opts = { noremap = true, silent = true }

-- Normal mode
vim.keymap.set({ "v", "n" }, "<C-`>", ":ToggleTerm<CR>", opts)
-- Visual mode
vim.keymap.set("v", "<C-`>", ":ToggleTerm<CR>", opts)
-- Insert mode
vim.keymap.set({ "n", "i", "t" }, "<C-`>", [[<C-\><C-N>:ToggleTerm<CR>i]], opts)

-- Use Esc to enter normal mode in terminal mode
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", {
	noremap = true,
	silent = true,
})

-- Automatically enter insert mode in terminal windows with a slight delay
vim.api.nvim_create_autocmd({ "BufEnter" }, {
	pattern = "term://*",
	callback = function()
		-- Add a slight delay before entering insert mode to ensure terminal is ready
		vim.defer_fn(function()
			vim.cmd("startinsert")
		end, 50) -- 50ms delay
	end,
})
