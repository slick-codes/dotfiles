vim.g.mapleader = " " -- set leader key to be space
_G.vim = vim

-- allow true color 
vim.opt.termguicolors = true
-- ensure diagnostics is still on
vim.diagnostic.config({
  virtual_text = true,        -- 👈 enables inline messages
  signs = true,               -- gutter signs
  underline = true,           -- underline error lines
  update_in_insert = false,   -- only update on Normal mode
  severity_sort = true,       -- sort by severity
})

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
-- Highlight on yank
vim.cmd("au TextYankPost * lua vim.highlight.on_yank {on_visual = false}")

local indent = 5
-- use tabs for indentation
vim.opt.softtabstop = indent
-- Use spaces instead of tabs
vim.opt.expandtab = true
-- Set the number of spaces inserted for indentation
vim.opt.shiftwidth = indent -- Adjust based on your project's style (e.g., 2 or 4)
vim.opt.tabstop = indent -- Set the number of spaces a tab counts for
-- Ensure auto-indentation uses the same settings
vim.opt.smartindent = true
vim.opt.autoindent = true

-- Fix split position
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.smartcase = true

vim.ignorecase = true
vim.hidden = true
vim.opt.scrolloff = 4

-- Indent blankline
vim.opt.list = true
vim.opt.listchars:append({ eol = "↴" })

-- setup undofiles
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("data") .. "/.vim/undo"
vim.api.nvim_set_keymap("n", "<leader>vr", ":VSplitRight<Space>", { noremap = true, silent = true })

local method = require("method.global")

-- ensure searched highlight is gone once you double press the esc btn
vim.keymap.set("n", "<Esc>", function()
	method.clear_search_highlight()
end, { noremap = true, silent = true })

-- ensure visual mode is still active on shift+> 
vim.keymap.set("v", ">", ">gv", { noremap = true, silent = true })
vim.keymap.set("v", "<", "<gv", { noremap = true, silent = true })


-- add cursorline on active buffers 
vim.api.nvim_create_autocmd({ "WinEnter", "BufEnter" }, {
  callback = function()
    vim.opt_local.cursorline = true
  end,
})

vim.api.nvim_create_autocmd({ "WinLeave", "BufLeave" }, {
  callback = function()
    vim.opt_local.cursorline = false
  end,
})
