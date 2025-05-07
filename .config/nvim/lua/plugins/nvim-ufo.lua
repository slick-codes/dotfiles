-- This package is used to fold blocks of code

return {
	"kevinhwang91/nvim-ufo",
	dependencies = {
		"kevinhwang91/promise-async",
		"neoclide/coc.nvim",
	},
	config = function()
		require("ufo").setup({
			provider_selector = function(bufnr, filetype, buftype)
				return { "lsp", "indent" } -- Try LSP first, fallback to indent if LSP folding is not available
			end,
		})
		-- Configure fold settings
		-- vim.opt.foldcolumn = "1" -- Display fold column (0 to disable)
		vim.opt.foldlevel = 99 -- Set the fold level; large value for ufo provider, adjust as needed
		vim.opt.foldlevelstart = 99 -- Set the initial fold level when opening a file
		vim.opt.foldenable = true -- Enable folding

		-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
		vim.keymap.set("n", "zR", require("ufo").openAllFolds)
		vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
	end,
}
