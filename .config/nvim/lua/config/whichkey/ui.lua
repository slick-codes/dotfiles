local whichkey = require("which-key")

local function change_theme()
	require("telescope.builtin").colorscheme(require("telescope.themes").get_dropdown({ enable_preview = true }))
end

whichkey.add({
	{ "<leader>u", group = "UI" },
	{ "<leader>ut", group = "Theme" },
	{ "<leader>utt", "<cmd>:TransparentToggle<CR>", desc = "Toggle Transparent", mode = { "n" } },
	{ "<leader>utl", change_theme, desc = "Theme List", mode = { "n" } },
})
