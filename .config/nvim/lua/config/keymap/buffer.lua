local function get_active_lsp_clients()
	local bufnr = vim.api.nvim_get_current_buf()
	local clients = vim.lsp.get_active_clients({ bufnr = bufnr })

	if next(clients) == nil then
		print("No active LSP clients for this buffer")
	else
		for _, client in ipairs(clients) do
			print("Active LSP client: " .. client.name)
		end
	end
end

-- vim.api.nvim_del_keymap("n", "<leader>b") -- override the default map
vim.keymap.set("n", "<leader>bc", get_active_lsp_clients, {
	desc = "Print LSP Client",
	noremap = true,
	silent = true,
})

local function close_current_buffer()
	-- Get the current buffer number
	local bufnr = vim.api.nvim_get_current_buf()

	-- Get a list of all buffers
	local buffers = vim.fn.getbufinfo({ buflisted = 1 })

	-- Find the current buffer index
	local current_buf_index
	for i, buf in ipairs(buffers) do
		if buf.bufnr == bufnr then
			current_buf_index = i
			break
		end
	end

	-- Determine the previous buffer index
	local previous_buf_index = current_buf_index and current_buf_index - 1 or #buffers
	if previous_buf_index < 1 then
		previous_buf_index = #buffers
	end

	-- Get the previous buffer number
	local previous_bufnr = buffers[previous_buf_index] and buffers[previous_buf_index].bufnr

	-- Delete the current buffer
	vim.cmd("bdelete " .. bufnr)

	-- Switch to the previous buffer
	if previous_bufnr then
		vim.cmd("buffer " .. previous_bufnr)
	end
end

vim.keymap.set(
	"n",
	"<leader>br",
	close_current_buffer,
	{ noremap = true, silent = true, desc = "Remove current buffer" }
)
