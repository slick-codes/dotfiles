local switch_window = require("method.global").switch_window
local switch_opts = { noremap = true, silent = true }

vim.keymap.set({ "n", "v", "t", "i" }, "<c-h>", function() switch_window('h') end, switch_opts)
vim.keymap.set({ "n", "v", "t", "i" }, "<c-j>", function() switch_window('j') end, switch_opts)
vim.keymap.set({ "n", "v", "t", "i" }, "<c-k>", function() switch_window("k") end, switch_opts)
vim.keymap.set({ "n", "v", "t", "i" }, "<c-l>", function() switch_window("l") end, switch_opts)

-- Switch to previous window
vim.keymap.set({'n', "v", "t", "i"}, '<C-Space>', '<C-w>p', { noremap = true, silent = true })

-- increase window height with ctrl + up arrow
vim.keymap.set({ "n", "i", "v" }, "<c-up>", ":resize +2<cr>", switch_opts)
vim.keymap.set({ "n", "i", "v" }, "<c-down>", ":resize -2<cr>", switch_opts)
vim.keymap.set({ "n", "i", "v" }, "<c-right>", ":vertical resize +2<cr>", switch_opts)
vim.keymap.set({ "n", "i", "v" }, "<c-left>", ":vertical resize -2<cr>", switch_opts)

-- Move the current line up with Alt + Up Arrow
vim.keymap.set("n", "<A-Up>", ":m .-2<CR>==", switch_opts)
vim.keymap.set("i", "<A-Up>", "<Esc>:m .-2<CR>==gi", switch_opts)
vim.keymap.set("v", "<A-Up>", ":m '<-2<CR>gv=gv", switch_opts)


-- Function to resize windows more predictably
local smart_resize = require("method.global").smart_resize

-- Resize mappings with smarter behavior
vim.keymap.set("n", "<C-Up>", function() smart_resize("up") end, switch_opts)
vim.keymap.set("n", "<C-Down>", function() smart_resize("down") end, switch_opts)
vim.keymap.set("n", "<C-Right>", function() smart_resize("right") end, switch_opts)
vim.keymap.set("n", "<C-Left>", function() smart_resize("left") end, switch_opts)
