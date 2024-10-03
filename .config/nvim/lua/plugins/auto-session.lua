return {
	"rmagatti/auto-session",
	dependencies = { "rmagatti/session-lens", "rmagatti/auto-session", "nvim-telescope/telescope.nvim" },
	config = function()
		require("auto-session").setup({
			root_dir = vim.fn.stdpath("data") .. ".vim/seassion",
		})

		require("session-lens").setup({
			prompt_title = "Session Recovery",
		})
	end,
}
