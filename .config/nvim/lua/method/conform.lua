local M = {}

local includes = require("method.global").includes
local format_on_save = false
local desc = "Turn OFF auto format"

-- format code
function M.format_code()
	if not format_on_save then
		return -- prevent format on save from working
	end
	-- Get the current buffer's filetype
	local filetype = vim.bo.filetype
	-- If the filetype is JavaScript or TypeScript, use LSP formatting
	if includes({ "javascript", "typescript" }, filetype) then
		return vim.lsp.buf.format()
	end
	-- Otherwise, use Conform for formatting
	require("conform").format()
end

local function toggle_format_on_save()
	format_on_save = not format_on_save

	if format_on_save then
		desc = "Turn OFF auto format"
		print("Auto format activated")
	else
		desc = "Turn OFF auto format"
		print("Auto format deactivated")
	end

	vim.keymap.set("n", "<leader>ct", toggle_format_on_save, {
		desc = desc,
	})
end

M.toggle_format_on_save = toggle_format_on_save
return M
