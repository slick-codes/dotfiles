-- Function to open Telescope and split selected file or buffer
local function telescope_split(opts)
	local type = opts.args:match("^(%S+)") or "f" -- Default to "f" if no parameter is provided

	if type == "b" then
		require("telescope.builtin").buffers({
			attach_mappings = function(prompt_bufnr, map)
				local actions = require("telescope.actions")
				map("i", "<CR>", function()
					local selection = require("telescope.actions.state").get_selected_entry()
					if selection then
						actions.close(prompt_bufnr)
						vim.cmd("split " .. vim.fn.bufname(selection.bufnr))
					end
				end)
				return true
			end,
		})
	else
		require("telescope.builtin").find_files({
			attach_mappings = function(prompt_bufnr, map)
				local actions = require("telescope.actions")
				map("i", "<CR>", function()
					local selection = require("telescope.actions.state").get_selected_entry()
					if selection then
						actions.close(prompt_bufnr)
						vim.cmd("split " .. selection.path)
					end
				end)
				return true
			end,
		})
	end
end

-- Create a command to call the function with parameters
vim.api.nvim_create_user_command("Split", telescope_split, { nargs = "*" })
