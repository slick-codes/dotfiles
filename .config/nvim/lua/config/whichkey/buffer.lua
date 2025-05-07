local whichkey = require("which-key")
local buffer_method = require("method.buffer")

whichkey.add({
	{ "<leader>b", group = "Buffer" },
	{ "<leader>bp", buffer_method.get_active_lsp_clients, desc = "Print LSP" },
	{ "<leader>bd", buffer_method.close_current_buffer, desc = "Close buffer" },
})
