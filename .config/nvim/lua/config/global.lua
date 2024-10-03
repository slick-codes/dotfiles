local indent = 3

vim.g.mapleader = " " -- set leader key to be space

vim.cmd("set nowrap")
vim.cmd("set number")
vim.cmd("set relativenumber")

-- allow clipport pasting
vim.opt.clipboard = "unnamedplus"
-- Paste without overwriting the clipboard content
-- Remap c to not affect the clipboard
vim.keymap.set("n", "c", '"_c', { noremap = true, silent = true })
-- Prevent yanked text from being overwritten in Visual mode
vim.keymap.set("v", "p", '"_dP', { noremap = true, silent = true })

-- use tabs for indentation
vim.opt.softtabstop = indent
-- Use spaces instead of tabs
vim.opt.expandtab = true
-- Set the number of spaces inserted for indentation
vim.opt.shiftwidth = indent -- Adjust based on your project's style (e.g., 2 or 4)
-- Set the number of spaces a tab counts for
vim.opt.tabstop = indent
-- Ensure auto-indentation uses the same settings
vim.opt.smartindent = true
vim.opt.autoindent = true

-- Scroll down horizontally when Shift + L is pressed
vim.keymap.set({ "n", "v" }, "<S-l>", "4zl", { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "<S-h>", "6zh", { noremap = true, silent = true })

-- Fix split position
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.smartcase = true

vim.ignorecase = true
vim.hidden = true
vim.opt.scrolloff = 4

-- Highlight on yank
vim.cmd("au TextYankPost * lua vim.highlight.on_yank {on_visual = false}")

-- Indent blankline
vim.opt.list = true
vim.opt.listchars:append({ eol = "↴" })
-- vim.cmd("set list lcs=trail:·,tab:│.")
-- vim.cmd("highlight TabCharacter guifg=#ff0000 guibg=#ffffff")
vim.opt.termguicolors = true
-- Set 'wildmode' option in Neovim
-- vim.opt.wildmode = { "list", "longest" }

-- setup undofiles
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("data") .. "/.vim/undo"
vim.api.nvim_set_keymap("n", "<leader>vr", ":VSplitRight<Space>", { noremap = true, silent = true })

--------------------- The following function is use to implement action that will be carried out when you double click on the Esc button ------------------

-- Function to clear search highlight
local function clear_search_highlight()
	if vim.fn.mode() == "n" then
		vim.cmd("nohlsearch") -- close search
	end
end

-- Variable to store last Esc press time
local last_esc_time = 0
-- Function to handle double Esc
function handle_double_esc()
	local current_time = vim.fn.reltimefloat(vim.fn.reltime())
	if (current_time - last_esc_time) < 0.5 then
		clear_search_highlight()
	end
	last_esc_time = current_time
end

-- Map Esc to handle_double_esc function
vim.api.nvim_set_keymap("n", "<Esc>", ":lua handle_double_esc('nohlsearch')<CR>", { noremap = true, silent = true })

--------------------- The above function is use to implement action that will be carried out when you double click on the Esc button ------------------
