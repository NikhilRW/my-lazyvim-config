return {
	"nvim-telescope/telescope.nvim",
	pts = function(_, opts)
		opts.defaults = vim.tbl_deep_extend("force", opts.defaults or {}, {
			file_ignore_patterns = {
				"node_modules",
				"dist",
				".next",
				".nuxt",
				"coverage",
				"__pycache__",
				".venv",
				".git",
				"target", -- Rust
				"vendor", -- Go/PHP
				".github",
				-- ".husky",
				".agents",
			},
		})

		-- For find_files picker specifically
		opts.pickers = vim.tbl_deep_extend("force", opts.pickers or {}, {
			find_files = {
				no_ignore = true, -- Search gitignored files
				hidden = true, -- Also show dotfiles
				file_ignore_patterns = {
					"node_modules",
					"dist",
					".next",
					".nuxt",
					"coverage",
					"__pycache__",
					".venv",
					".git",
					"target", -- Rust
					"vendor", -- Go/PHP
					".github",
					".husky",
					".agents",
				},
			},
		})
	end,
}
