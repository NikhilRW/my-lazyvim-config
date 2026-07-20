return {
	"rashedInt32/lazydiff.nvim",
	cmd = {
		"Lazydiff",
		"LazydiffOff",
		"LazydiffRefresh",
		"LazydiffNext",
		"LazydiffPrev",
		"LazydiffFirst",
	},
	config = function()
		require("lazydiff").setup({ show_hunk_header = false })
	end,
}
