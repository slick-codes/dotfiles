local M = {}

function M.init(lspconfig)
	-- this function will be parsed to all lspconfiguration so any supported feature would be attached automatically
	local navbuddy = require("nvim-navbuddy")

	local function generic_attach_func(client, bufnr)
		-- setup navbuddy

		if client.supports_method("textDocument/documentSymbol") then
			navbuddy.attach(client, bufnr)
			require("nvim-navic").attach(client, bufnr)
		else
			print("navic not supported")
		end
	end

	lspconfig.emmet_ls.setup({
		on_attach = function(client, bufnr)
			generic_attach_func(client, bufnr)
		end,
	})

	lspconfig.ember.setup({
		filetypes = { "handlebars", "hbs" },
		on_attach = function(client, bufnr)
			generic_attach_func(client, bufnr)
		end,
	}) -- for template files like hbs

	lspconfig.svelte.setup({
		init_options = {
			preferences = {
				importModuleSpecifierPreference = "relative", -- Ensures relative imports
			},
		},
		on_attach = function(client, bufnr)
			-- Enable tsserver formatting
			client.server_capabilities.documentFormattingProvider = true
			-- Optional: Disable other formatters
			client.server_capabilities.documentRangeFormattingProvider = true
			generic_attach_func(client, bufnr)
		end,
	})

	-- setup lua lsp configuration
	lspconfig.lua_ls.setup({
		on_attach = function(client, bufnr)
			generic_attach_func(client, bufnr)
		end,
		settings = {
			Lua = {
				runtime = {
					version = "LuaJIT", -- Neovim uses LuaJIT
				},
				diagnostics = {
					globals = { "vim" }, -- Tell lua_ls that `vim` is a global variable
				},
				workspace = {
					library = {
						vim.env.VIMRUNTIME, -- Make lua_ls aware of Neovim runtime files
					},
					checkThirdParty = false, -- Prevent unnecessary third-party warnings
				},
				telemetry = {
					enable = false, -- Disable telemetry for privacy
				},
			},
		},
	})

	--- configure  typescript language server
	lspconfig.ts_ls .setup({ 
		init_options = {
			preferences = {
				importModuleSpecifierPreference = "relative", -- Ensures relative imports
			},
		},
		on_attach = function(client, bufnr)
			-- Enable tsserver formatting
			client.server_capabilities.documentFormattingProvider = true
			-- Optional: Disable other formatters
			client.server_capabilities.documentRangeFormattingProvider = true
			generic_attach_func(client, bufnr)
		end,
	})

     -- Setup eslint-lsp
     lspconfig.eslint.setup({
       on_attach = generic_attach_func,
       settings = {
         validate = "on",
         packageManager = "npm",
       }
     })
end

return M
