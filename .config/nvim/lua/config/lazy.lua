local themes = require("plugins.colorscheme")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  -- bootstrap lazy.nvim
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

-- Fixes Notify opaicity issues
vim.o.termguicolors = true

-- setup lazyvim configuration
require("lazy").setup({
	spec = {
		-- default LazyVim plugins
		-- { "LazyVim/LazyVim", import = "lazyvim.plugins", opts = {} },
		-- custom plugins importation
		{ import = "plugins" },
	},
	defaults = {},
	checker = { enabled = false }, -- check for plugins updates
	performance = {
		rtp = {},
	},
})
