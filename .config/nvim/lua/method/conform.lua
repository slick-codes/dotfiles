local M = {}

local format_on_save = false
local desc = "Turn OFF auto format"

-- format code
function M.format_code()
     -- Get the current buffer's filetype
     local filetype = vim.bo.filetype
     -- If the filetype is JavaScript or TypeScript, use LSP formatting
     if require("method.global").includes({ "javascript", "typescript", "lua" }, filetype) then
          return vim.lsp.buf.format()
     end
     -- Otherwise, use Conform for formatting
     require("conform").format({ async = true })
end

local function toggle_format_on_save()
     format_on_save = not format_on_save

     if format_on_save then
          desc = "Turn OFF auto format"
          print("Auto format deactivated")
     else
          desc = "Turn ON auto format"
     print("Auto format activated")
     end

     require("which-key").add({
          {
          "<leader>cft",
               function() toggle_format_on_save() end,
               desc = desc,
               mode = { "n" }
          },
     })
end

vim.api.nvim_create_autocmd("BufWritePost", {
     pattern = "*",
     callback = function()
          if format_on_save then
               M.format_code()
          end
     end,
})

M.toggle_format_on_save = toggle_format_on_save
return M
