vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
	pattern = { "*" },
	command = "silent! wall",
	nested = true,
})

-- Autosave for LazyVim
-- Autosave with Debounce for LazyVim
local autosave_timer = nil
local debounce_delay = 700 -- milliseconds (adjust as you like: 300-600 is good)

vim.api.nvim_create_autocmd({ "TextChanged", "TextChangedI", "InsertLeave" }, {
	group = vim.api.nvim_create_augroup("Autosave", { clear = true }),
	callback = function()
		if autosave_timer then
			vim.fn.timer_stop(autosave_timer)
		end

		autosave_timer = vim.fn.timer_start(debounce_delay, function()
			local bufname = vim.api.nvim_buf_get_name(0)
			if vim.bo.modified and vim.bo.buflisted and bufname ~= "" then
				vim.cmd("silent! update")
			end
		end)
	end,
})
