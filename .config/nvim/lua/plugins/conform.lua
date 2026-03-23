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
                    vue = { "prettierd", "prettier", stop_after_first = true },
                    css = { "prettierd", "prettier", stop_after_first = true },
                    scss = { "prettierd", "prettier", stop_after_first = true },
                    html = { "prettierd", "prettier", stop_after_first = true },
                    ejs = { "prettierd", "prettier", stop_after_first = true },
                    prisma = { "prisma_fmt" },
                    json = { "deno_fmt" },
               },
               linters_by_ft = {
                    lua = { "lua_ls", "luacheck" },
               },
          })

          local format_code = require("method.conform").conform_methods
     end,
}
