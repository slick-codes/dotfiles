local on_attach = function(client, bufnr)
	print("LSP attached to buffer")
	if client.supports_method("textDocument/documentSymbol") then
		print("Document Symbol is supported")
		require("nvim-navic").attach(client, bufnr)
		-- require("breadcrumb").attach(client, bufnr)
	else
		print("Not supported")
	end

	if client.name == tesserver then
		-- Disable formatting if you prefer to use a different tool like Prettier
		client.server_capabilities.documentFormattingProvider = false
		client.server_capabilities.documentRangeFormattingProvider = false
	end

	-- Key mappings for LSP actions
	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end
end

function exec(attach)
	-- setup html lsp to work on .hbs
	vim.cmd("autocmd BufRead,BufNewFile *.handlebars set filetype=html")
	vim.cmd("autocmd Bufread,BufNewFile *.hbs set filetype=html")

	require("plugins.config.lsp.go")(attach)
	-- require("plugins.config.lsp.svelte")(attach)
	-- require("plugins.config.lsp.eslint")(attach)
	require("plugins.config.lsp.tsserver")(attach)
end

exec(on_attach)
