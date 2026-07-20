local map = vim.keymap.set

map("i", "<C-;>", "<ESC>", { noremap = false, desc = "Exit insert mode" })
map("n", "<C-;>", "i", { noremap = false, desc = "Enter insert mode" })

-- Instant mode switching (no chord delay)
map("i", "jk", "<ESC>", { desc = "Exit insert mode" })
map("v", "jk", "<ESC>", { desc = "Exit visual mode" })
map("n", "vv", "v", { desc = "Enter visual mode" })
map("n", "vi", "v", { desc = "Enter visual mode" })

-- Ctrl+B → Toggle file explorer (ported from NvChad)
map("n", "<C-b>", "<leader>e", { desc = "Toggle file explorer" })

-- Format document (VS Code: Tab+Backspace → LazyVim: <leader>lf)
-- Already available as <leader>lf via LazyVim defaults

-- Accept completion (VS Code: Ctrl+Space → LazyVim: handled by blink.cmp)
-- Tab/Enter already accept completions by default in LazyVim

-- Next/prev Copilot suggestion (VS Code: Right → LazyVim: M-], M-[)
-- Already available via LazyVim copilot extra

-- Accept next word from Copilot (VS Code: Ctrl+Right)
pcall(function()
	if require("copilot").enabled() then
		map("i", "<C-Right>", function()
			require("copilot.suggestion").accept_word()
		end, { desc = "Accept next Copilot word" })
	end
end)

-- Run code (VS Code: Ctrl+Shift+3)
map("n", "<C-S-3>", function()
	if vim.bo.filetype == "python" then
		vim.cmd("!python %")
	elseif vim.bo.filetype == "javascript" or vim.bo.filetype == "typescript" then
		vim.cmd("!node %")
	elseif vim.bo.filetype == "lua" then
		vim.cmd("!lua %")
	else
		vim.cmd("!%:p")
	end
end, { desc = "Run current file" })

-- Toggle Copilot (VS Code: Ctrl+*)
map("n", "<C-*>", "<cmd>Copilot toggle<CR>", { desc = "Toggle Copilot" })

-- Toggle comments (VS Code: Ctrl+/ → Neovim: gcc)
-- Already available via LazyVim/comment.nvim

-- Delete current line (VS Code: Ctrl+Shift+K)
map("n", "<C-S-k>", "dd", { desc = "Delete current line" })
map("i", "<C-S-k>", "<Esc>dd", { desc = "Delete current line" })
map("v", "<C-S-k>", "d", { desc = "Delete selected lines" })

-- Terminal paste (VS Code: Ctrl+V unassigned in terminal)
-- Neovim terminal uses Ctrl+Shift+V for paste by default

-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Comments toggle (Ctrl+/)
keymap.set("n", "<C-/>", function()
	require("mini.comment").toggle_lines(vim.fn.line("."), vim.fn.line("."))
end, { desc = "Toggle comment" })
keymap.set("n", "<C-_>", function()
	require("mini.comment").toggle_lines(vim.fn.line("."), vim.fn.line("."))
end, { desc = "Toggle comment" })
keymap.set("v", "<C-/>", function()
	require("mini.comment").toggle_lines(vim.fn.line("'<"), vim.fn.line("'>"))
end, { desc = "Toggle comment selection" })
keymap.set("v", "<C-_>", function()
	require("mini.comment").toggle_lines(vim.fn.line("'<"), vim.fn.line("'>"))
end, { desc = "Toggle comment selection" })

vim.keymap.set("n", "<leader>dd", "<cmd>Lazydiff<cr>", { desc = "Toggle lazydiff" })
vim.keymap.set("n", "]h", "<cmd>LazydiffNext<cr>", { desc = "Next lazydiff hunk" })
vim.keymap.set("n", "[h", "<cmd>LazydiffPrev<cr>", { desc = "Prev lazydiff hunk" })
