return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"folke/noice.nvim",
	},
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		-- Call the setup function to change the default behavior
		local filetype = function()
			local buf_ft = vim.bo.filetype
			local exclude_ft = { "NvimTree", "neo-tree", "toggleterm", "dashboard", "terminal" }
			return not vim.tbl_contains(exclude_ft, buf_ft)
		end

		Breadcrumb = { -- this is abstracted to replace the breadcrumb since it's buggy
			{
				"filename",
				path = 1,
				file_status = false,
				separator = "",
				fmt = function(str)
					str = str:gsub("/", " > ") -- Replace `/` with `>`
					-- Remove the last file name, keeping only directories
					return " " .. (str:match("(.+ > ).+%.%w+$") or str)
				end,
				shorting_target = 40,
				padding = { left = 0, right = 0 }, -- Reduce spacing
			},
			{
				"filetype",
				separator = "",
				icon_only = true,
				padding = { left = 0, right = 0 }, -- Reduce spacing
			},
			{

				"filename",
				separator = "",
				file_status = true,
				cond = filetype,
				padding = { left = 0, right = 0 }, -- Reduce spacing
			},
		}

		require("lualine").setup({
			extensions = { -- ingore windows
				"nvim-tree", -- Keep other extensions
				"fugitive",
				{
					sections = {
						lualine_a = {},
						lualine_b = {},
						lualine_c = {},
						lualine_x = {},
						lualine_y = {},
						lualine_z = {},
					},
					winbar = {
						lualine_a = {},
						lualine_b = {},
						lualine_c = {},
						lualine_x = {},
						lualine_y = {},
						lualine_z = {},
					},
					filetypes = { "toggleterm", "neo-tree" }, -- Hide lualine for toggleterm
				},
			},
			options = {
				icons_enabled = true,
				component_separators = "|",
				section_separators = "",
				theme = "auto",
			},
			tabline = {},
			winbar = {
				lualine_a = {
					{ "filetype", icon_only = true },
					{

						"filename",
						file_status = true,
						cond = filetype,
					},
				},
				lualine_b = Breadcrumb,
			},
			inactive_winbar = {
				lualine_a = {
					{
						"filename",
						file_status = true,
						cond = filetype,
					},
				},
				lualine_b = Breadcrumb,
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
				},
			},
		})
	end,
}
