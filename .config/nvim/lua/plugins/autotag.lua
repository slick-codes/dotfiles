return {
	"windwp/nvim-ts-autotag",
	config = function()
		local autotag = require("nvim-ts-autotag")
		-- require("plugins.config.treesitter")
		autotag.setup({
			enable = true,
			insert_pair = { enable = true, char = ">" },
			opts = {
				enable_close = true,
				enable_rename = true,
				enable_close_on_slash = false,
			},
			update_in_insert = true, -- allow auto tag on insert
			pre_filetype = {},
		})
	end,
}
