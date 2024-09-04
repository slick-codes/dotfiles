-- Colorizer highlights colors when used in files
--
--

return {
	"norcalli/nvim-colorizer.lua",
	lazy = false,
	config = function()
		local languages = {
			"css",
			"javascript",
			"scss",
			"html",
			"lua",
			"go",
		}

		local configuration = { mode = "background" }
		require("colorizer").setup(languages, configuration)
	end,
}
