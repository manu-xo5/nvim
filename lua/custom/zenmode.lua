local M = {}

M.zen_buf = vim.api.nvim_create_buf(false, true)
vim.api.nvim_buf_set_name(M.zen_buf, "ZenMode")

vim.bo[M.zen_buf].modifiable = false
vim.bo[M.zen_buf].bufhidden = "hide"

M.zen_win = nil

function M.count_real_windows()
	local count = 0
	for _, win in ipairs(vim.api.nvim_list_wins()) do
		local cfg = vim.api.nvim_win_get_config(win)
		local buf = vim.api.nvim_win_get_buf(win)

		if buf ~= M.zen_buf then
			if cfg.relative == "" then
				count = count + 1
			end
		end
	end
	return count
end

function M.open_zen()
	local ui = vim.api.nvim_list_uis()[1]
	local width = math.floor(ui.width * 0.3)

	if M.zen_win and vim.api.nvim_win_is_valid(M.zen_win) then
		return
	end

	local win = vim.api.nvim_open_win(M.zen_buf, false, {
		split = "left",
		width = width,
		focusable = false,
    fixed = true,
		style = "minimal",
	})

	vim.wo[win].winfixwidth = true
	M.zen_win = win
end

function M.close_zen()
	if M.zen_win and vim.api.nvim_win_is_valid(M.zen_win) then
		vim.api.nvim_win_close(M.zen_win, true)
	end
	M.zen_win = nil
end

function M.update()
	if M.opening then
		return
	end

	M.opening = true
	vim.schedule(function()
		local curwin = vim.api.nvim_get_current_win()
		if M.zen_win and curwin == M.zen_win then
			return
		end

		local real_wins = M.count_real_windows()
		if real_wins == 1 then
			M.open_zen()
		else
			M.close_zen()
		end

		M.opening = false
	end)
end

-- Setup autocmds
vim.api.nvim_create_autocmd({ "WinNew", "WinClosed" }, {
	callback = M.update,
})

return M
