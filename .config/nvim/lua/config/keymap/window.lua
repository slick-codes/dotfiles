-- Adjust windows
-- vim.keymap.set("n", "<leader>we", "C-w>=", {
-- 	noremap = true,
-- 	silent = true,
-- 	desc = "Equal Window",
-- })

-- SWITCH TO SPLIT WINDOWS (BUFFERS) USING HJKL

function switch_window(direction)
	-- local mode = vim.api.nvim_get_mode().mode
	-- local buf_type = vim.api.nvim_buf_get_option(vim.api.nvim_get_current_buf(), "buftype")
	vim.cmd(string.format("wincmd %s", direction))
	-- vim.api.nvim_set_mode("i")
end

local switch_opts = { noremap = true, silent = true }
vim.keymap.set({ "n", "v" }, "<C-h>", ":lua switch_window('h')<CR>", switch_opts)
vim.keymap.set({ "n", "v" }, "<C-j>", ":lua switch_window('j')<CR>", switch_opts)
vim.keymap.set({ "n", "v" }, "<C-k>", ":lua switch_window('k')<CR>", switch_opts)
vim.keymap.set({ "n", "v" }, "<C-l>", ":lua switch_window('l')<CR>", switch_opts)

vim.keymap.set({ "t" }, "<C-h>", [[<C-\><C-N>:lua switch_window('h')<CR>]], switch_opts)
vim.keymap.set({ "t" }, "<C-j>", [[<C-\><C-N>:lua switch_window('j')<CR>]], switch_opts)
vim.keymap.set({ "t" }, "<C-k>", [[<C-\><C-N>:lua switch_window('k')<CR>]], switch_opts)
vim.keymap.set({ "t" }, "<C-l>", [[<C-\><C-N>:lua switch_window('l')<CR>]], switch_opts)

-- Increase window height with Ctrl + Up Arrow
vim.keymap.set({ "n", "i", "v" }, "<C-Up>", ":resize +2<CR>", { noremap = true, silent = true })
vim.keymap.set({ "n", "i", "v" }, "<C-Down>", ":resize -2<CR>", { noremap = true, silent = true })
vim.keymap.set({ "n", "i", "v" }, "<C-Right>", ":vertical resize +2<CR>", { noremap = true, silent = true })
vim.keymap.set({ "n", "i", "v" }, "<C-Left>", ":vertical resize -2<CR>", { noremap = true, silent = true })

-- Move the current line up with Alt + Up Arrow
vim.keymap.set("n", "<A-Up>", ":m .-2<CR>==", { noremap = true, silent = true })
vim.keymap.set("i", "<A-Up>", "<Esc>:m .-2<CR>==gi", { noremap = true, silent = true })
vim.keymap.set("v", "<A-Up>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

-- Move the current line down with Alt + Down Arrow
vim.keymap.set("n", "<A-Down>", ":m .+1<CR>==", { noremap = true, silent = true })
vim.keymap.set("i", "<A-Down>", "<Esc>:m .+1<CR>==gi", { noremap = true, silent = true })
vim.keymap.set("v", "<A-Down>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
