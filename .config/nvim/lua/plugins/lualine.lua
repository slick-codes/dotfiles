return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"folke/noice.nvim",
	},
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local breadcrumb = function()
			local breadcrumb_status_ok, breadcrumb = pcall(require, "breadcrumb")
			if not breadcrumb_status_ok then
				return
			end
			return breadcrumb.get_breadcrumb()
		end

		-- Call the setup function to change the default behavior
		local filetype = function()
			local buf_ft = vim.bo.filetype
			local exclude_ft = { "NvimTree", "neo-tree", "dashboard", "terminal" }
			return not vim.tbl_contains(exclude_ft, buf_ft)
		end

		require("lualine").setup({
			options = {
				icons_enabled = true,
				component_separators = "|",
				section_separators = "",
				theme = "auto",
			},
			tabline = {},
			winbar = {
				lualine_a = {
					{
						"filename",
						file_status = true,
						cond = filetype,
					},
				},
				lualine_b = { breadcrumb },
			},
			inactive_winbar = {
				lualine_a = {
					{
						"filename",
						file_status = true,
						cond = filetype,
					},
				},
				lualine_b = { breadcrumb },
			},
			inactive_sections = {},
			sections = {
				lualine_x = {
					"branch",
					-- "filetype",
					-- "fileformat",
					-- "diff",
				},
				lualine_a = {
					{ "mode" },
					-- { "filename", color = { bg = nil }, cond = filetype },
				},
				lualine_b = {
					"diagnostic",
				},
				lualine_c = {
					{
						"navic",
						color_correction = "dynamic",
						navic_opts = nil,
					},
					-- {
					-- 	"aerial",
					-- 	sep = ".", -- separator between symbols
					-- 	sep_icon = "", -- separator between icon and symbol
					--
					-- 	-- The number of symbols to render top-down. In order to render only 'N' last
					-- 	-- symbols, negative numbers may be supplied. For instance, 'depth = -1' can
					-- 	-- be used in order to render only current symbol.
					-- 	depth = 3,
					--
					-- 	-- When 'dense' mode is on, icons are not rendered near their symbols. Only
					-- 	-- a single icon that represents the kind of current symbol is rendered at
					-- 	-- the beginning of status line.
					-- 	dense = false,
					--
					-- 	-- The separator to be used to separate symbols in dense mode.
					-- 	dense_sep = ">",
					--
					-- 	-- Color the symbol icons.
					-- 	colored = true,
					-- },
				},
			},
		})
	end,
}
