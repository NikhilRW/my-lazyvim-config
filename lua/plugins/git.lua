return {
	-- Core Git integration (VS Code style)
	{ "tpope/vim-fugitive", lazy = false },

	-- Nice side-by-side diffs
	{
		"sindrets/diffview.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		cmd = { "DiffviewOpen", "DiffviewFileHistory" },
		keys = {
			{ "<leader>df", "<cmd>DiffviewOpen<CR>", desc = "Diffview (open)" },
			{ "<leader>dfx", "<cmd>DiffviewClose<CR>", desc = "Diffview (close)" },
		},
		opts = {},
	},

	-- Optional: even better commit UI
	{
		"NeogitOrg/neogit",
		dependencies = { "sindrets/diffview.nvim" },
		cmd = "Neogit",
		opts = {},
	},

	-- Override LazyVim default gitsigns keymaps
	{
		"lewis6991/gitsigns.nvim",
		keys = {
			{ "gp", "<cmd>Gitsigns preview_hunk_inline<CR>", desc = "Preview hunk inline", mode = "n" },
		},
	},
}
