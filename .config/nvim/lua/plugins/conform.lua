return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				-- Conform will run multiple formatters sequentially
				python = { "isort", "black" },
				-- You can customize some of the format options for the filetype (:help conform.format)
				rust = { "rustfmt", lsp_format = "fallback" },
				-- Conform will run the first available formatter
				javascript = { "ts_ls", "prettierd", stop_after_first = true },
				typescript = { "ts_ls", "prettierd", stop_after_first = true },
				vue = { "prettierd", "prettier", stop_After_first = true },
                    prisma = { "prisma_fmt"},
                    json = { "deno_fmt" },
			},
			linters_by_ft = {
				lua = { "lua_ls", "luacheck" },
		     },
		})

		local conform_methods = require("method.conform")
		local format_code = conform_methods.format_code
		local toggle_format_on_save = conform_methods.toggle_format_on_save

		-- setup format toggler
		-- vim.defer_fn(toggle_format_on_save, 500)
		vim.keymap.set("n", "<leader>cf", format_code, { silent = true, noremap = true, desc = "Code Format" })

		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = "*",
			callback = function(args)
				print("attempting to format")
				-- format_code()
			end,
		})
	end,
}
