local M = {}

function M.init(lspconfig)
	-- this function will be parsed to all lspconfiguration so any supported feature would be attached automatically
	local navbuddy = require("nvim-navbuddy")
     local capabilities = require("cmp_nvim_lsp").default_capabilities()

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

     lspconfig.prismals.setup({
          capabilities = capabilities,
          on_attach = function(client, bufnr)
			client.server_capabilities.documentFormattingProvider = true
			-- -- Optional: Disable other formatters
			client.server_capabilities.documentRangeFormattingProvider = true
			generic_attach_func(client, bufnr)
          end,
     })

     -- Setup eslint-lsp
     lspconfig.eslint.setup({
       root_dir = lspconfig.util.root_pattern('.eslintrc', '.eslintrc.js', '.git'),
          settings = {
               validate = "on",
               packageManager = "npm",
          },
       on_attach = function(client, bufnr)
            local has_prettierrc = vim.fn.filereadable(vim.fn.getcwd() .. '/.prettierrc') == 1
            if has_prettierrc then
                client.server_capabilities.documentFormattingProvider = false
            end
            generic_attach_func(client, bufnr)
       end,
     })

end

return M
