return {
	"rmagatti/auto-session",
	config = function()
		require("auto-session").setup({
			root_dir = vim.fn.stdpath("data") .. ".vim/seassion",
		})
	end,
}
