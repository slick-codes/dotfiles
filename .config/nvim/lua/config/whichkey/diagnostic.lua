local whichkey = require("which-key")


whichkey.add({
     { "<leader>d", group ="Diagnostic"},
     { "<leader>dn", "<cmd>: lua vim.diagnostic.goto_next() <CR>", desc ="Next Diagnostic", mode = { "n" }},
     { "<leader>db", "<cmd>: lua vim.diagnostic.goto_prev() <CR>", desc = "Previous Diagnostic", mode =  { "n" }}
})

