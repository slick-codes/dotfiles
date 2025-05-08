return {
	"akinsho/toggleterm.nvim",
	config = function()

-- Ensure terminal buffers inherit the normal theme look
vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "*",
  callback = function()
    vim.cmd("setlocal winhighlight=Normal:Normal,NormalNC:Normal")
  end,
})
		require("toggleterm").setup({
			size = function(term)
				if term.direction == "horizontal" then
					return 15 -- Set fixed height for horizontal terminals
				elseif term.direction == "vertical" then
					return 50 -- Set fixed width for vertical terminals
				end
			end,
			persist_size = true, -- Keep size fixed after closing/reopening
		})
		local opts = { noremap = true, silent = true }
		-- Normal mode
		-- vim.keymap.set({ "n", "i", "t" }, "<C-`>", [[<C-\><C-N>:ToggleTerm<CR>i]], opts)

		-- Use Esc to enter normal mode in terminal mode
		vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", {
			noremap = true,
			silent = true,
		})

          local function refresh_terminal_highlights()
            for _, buf in ipairs(vim.api.nvim_list_bufs()) do
              if vim.bo[buf].buftype == "terminal" and vim.api.nvim_buf_is_loaded(buf) then
                local wins = vim.fn.win_findbuf(buf)
                for _, win in ipairs(wins) do
                  vim.api.nvim_win_set_option(win, "winhighlight", "Normal:Normal")
                end
              end
            end
          end

          
          -- Hook on colorscheme change
          vim.api.nvim_create_autocmd("ColorScheme", {
            callback = refresh_terminal_highlights,
          })

          -- ensure the terminal's theme get's updated when theme is changed
          -- vim.api.nvim_create_autocmd("ColorScheme", {
          --   callback = function()
          --     -- force refresh of all terminal highlights
          --     for _, buf in ipairs(vim.api.nvim_list_bufs()) do
          --       if vim.api.nvim_buf_get_option(buf, "buftype") == "terminal" then
          --         vim.api.nvim_buf_call(buf, function()
          --           vim.cmd("doautocmd WinEnter")
          --         end)
          --       end
          --     end
          --   end,
          -- })

		-- Automatically enter insert mode in terminal windows with a slight delay
		vim.api.nvim_create_autocmd({ "BufEnter" }, {
			pattern = "term://*",
			callback = function()
				-- Add a slight delay before entering insert mode to ensure terminal is ready
				vim.defer_fn(function()
					vim.cmd("startinsert")
				end, 0) -- 50ms delay
			end,
		})

		-- this prevents the windows from increasing when there's a WinNew or WinEnter event
		vim.api.nvim_create_autocmd({ "WinNew", "WinEnter" }, {
			callback = function()
				for _, win in ipairs(vim.api.nvim_list_wins()) do
					local buf = vim.api.nvim_win_get_buf(win)
					if vim.bo[buf].buftype == "terminal" then
						vim.api.nvim_win_set_height(win, 10) -- Lock height of terminal
					end
				end
			end,
		})
	end,
}
