return {
	"SmiteshP/nvim-navic",
	lazy = true,
	config = function()
		require("nvim-navic").setup({
			seprator = " ",
			highlight = true,
			-- depth_limit = 300,
			click = true,
			auto_attach = true,
			-- icons =
		})
	end,
}
