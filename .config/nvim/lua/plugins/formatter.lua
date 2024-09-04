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
				javascript = { "prettierd", stop_after_first = true },
				typescript = { "prettierd", stop_after_first = true },
				javascriptreact = { "prettierd", stop_after_first = true },
				typescriptreact = { "prettierd", stop_after_first = true },
				-- svelte = {"es"}
				go = { "gopls" },
			},
			formatters = {
				prettierd = vim.tbl_deep_extend("force", require("conform.formatters.prettierd"), {
					env = {
						PRETTIERD_LOCAL_PRETTIER_ONLY = "0",
						PRETTIERD_DEFAULT_CONFIG = vim.fn.expand("~/.config/nvim/utils/linter-config/.prettierc.json"),
					},
				}),
			},
		})

		local format_on_save = false

		function codeFormat()
			require("conform").format()
		end

		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = "*",
			callback = function()
				if format_on_save then
					codeFormat()
				end
			end,
		})

		function toggle_format_on_save()
			format_on_save = not format_on_save
			if format_on_save then
				vim.keymap.set("n", "<leader>ct", toggle_format_on_save, { desc = "(T)oggle format on save (ON)" })
				print("Format on save activated")
			else
				vim.keymap.set("n", "<leader>ct", toggle_format_on_save, { desc = "(T)oggle format on save (OFF)" })
				print("Format on save deactivated")
			end
		end
		-- setup format toggler
		vim.defer_fn(toggle_format_on_save, 500)
		vim.keymap.set("n", "<leader>cf", codeFormat, { silent = true, noremap = true, desc = "Code Format" })
	end,
}
