local whichkey = require("which-key")
local formatter = require("method.conform")

-- format keymap set here
formatter.toggle_format_on_save()

local twilight_state = false

local function toggle_twilight()
	twilight_state = not twilight_state
	local desc = "Turn ON twilight"

	if twilight_state then
		desc = "Turn OFF twilight"
	else
		desc = "Turn On twilight"
	end

	whichkey.add({
		{ "<leader>cw", ":Twilight <CR>", desc = desc, mode = { "n" } },
	})
end

toggle_twilight()

whichkey.add({
	{ "<leader>c", group = "Code" },
	{ "<leader>cf", formatter.format_code, desc = "Format Code", mode = { "n" } },
	{ "<leader>ct", ":TSContextToggle<CR>", desc = "Toggle TS Context", mode = { "n" } },
	{ "<leader>cg", vim.lsp.buf.definition, desc = "Go Definition", mode = { "n" } },
	{ "<leader>ci", vim.lsp.buf.implementation, desc = "Go Implementation", mode = { "n" } },
	{ "<leader>chi", vim.lsp.buf.hover, desc = "Hover Code", mode = { "n", "v" } },
	{ "<leader>chl", vim.diagnostic.open_float, desc = "Hover Lint", mode = { "n", "v" } },
	{ "<leader>cc", ":CccPick<CR>", desc = "Color Picker", mode = { "n", "v" } },
})
