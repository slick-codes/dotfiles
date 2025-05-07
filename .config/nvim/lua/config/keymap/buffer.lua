local switch_opts = { noremap = true, silent = true }

-- Move the current line up or down
vim.keymap.set("n", "<A-Up>", "<cmd>m .-2<CR>", switch_opts)
vim.keymap.set("n", "<A-Down>", "<cmd>m .+1<CR>", switch_opts)

vim.keymap.set("i", "<A-Up>", "<Esc><cmd>m .-2<CR>gi", switch_opts)
vim.keymap.set("i", "<A-Down>", "<Esc><cmd>m .+1<CR>gi", switch_opts)

vim.keymap.set("v", "<A-Up>", ":m '<-2<CR>gv", switch_opts)
vim.keymap.set("v", "<A-Down>", ":m '>+1<CR>gv", switch_opts)

-- Scroll horizontally when Shift + L or Shift + G is pressed
vim.keymap.set({ "n", "v" }, "<S-l>", "4zl", { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "<S-h>", "6zh", { noremap = true, silent = true })
