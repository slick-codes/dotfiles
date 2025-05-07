local M = {} -- exported object

local last_esc_time = 0

-- help users clear their search highlight on double tab of specified key
function M.clear_search_highlight()
    local current_time = vim.fn.reltimefloat(vim.fn.reltime())
    if (current_time - last_esc_time) < 0.5 then
        vim.cmd("nohlsearch") -- close search
    end
    last_esc_time = current_time
end

-- switch to different windows
function M.switch_window(direction)
    -- local buf_type = vim.api.nvim_buf_get_option(vim.api.nvim_get_current_buf(), "buftype")
    -- vim.api.nvim_set_mode("i")

    local mode = vim.api.nvim_get_mode().mode
    -- ensure terminal mode get's escaped before switching from terminal to another buff
    if vim.bo.filetype == "terminal" or mode == "i" then
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-\\><C-n>", true, false, true), "n", true)
    end
    vim.cmd(string.format("wincmd %s", direction))
end

-- includes check if item exist within an array
function M.includes(tbl, value)
    local valueStr = tostring(value)
    for _, v in ipairs(tbl) do
        if tostring(v) == valueStr then
            return true
        end
    end
    return false
end

function M.is_win()
    return vim.uv.os_uname().sysname == "Windows_NT"
end

function M.smart_resize(direction)
    local win_width = vim.fn.winwidth(0)
    local win_height = vim.fn.winheight(0)

    if direction == "up" then
        if win_height > 5 then vim.cmd("resize +2") end
    elseif direction == "down" then
        if win_height > 5 then vim.cmd("resize -2") end
    elseif direction == "right" then
        if win_width > 10 then vim.cmd("vertical resize +2") end
    elseif direction == "left" then
        if win_width > 10 then vim.cmd("vertical resize -2") end
    end
end

-- export
return M
