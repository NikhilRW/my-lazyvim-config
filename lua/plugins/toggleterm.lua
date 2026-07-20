return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {
      size = function(term)
        if term.direction == "horizontal" then
          return 15
        elseif term.direction == "vertical" then
          return vim.o.columns * 0.4
        end
      end,
      open_mapping = [[<C-\>]],
      hide_numbers = true,
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
      insert_mappings = true,
      terminal_mappings = true,
      persist_size = true,
      persist_mode = true,
      direction = "horizontal",
      close_on_exit = true,
      float_opts = {
        border = "curved",
        winblend = 0,
      },
    },

    keys = {
      -- Main toggle
      { "<C-\\>", "<cmd>ToggleTerm<cr>", mode = { "n", "t" }, desc = "Toggle Terminal" },
      -- Use count prefix: 1<C-\\>, 2<C-\\>, 3<C-\\> → toggles specific terminal

      -- New terminal orientations
      { "<leader>th", "<cmd>ToggleTerm direction=horizontal<cr>", desc = "New Horizontal Terminal" },
      { "<leader>tv", "<cmd>ToggleTerm direction=vertical<cr>", desc = "New Vertical Terminal" },
      { "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", desc = "New Floating Terminal" },
      { "<leader>tt", "<cmd>ToggleTerm direction=tab<cr>", desc = "New Tab Terminal" },
      -- Quick terminal IDs
      { "<leader>t1", "<cmd>ToggleTerm 1<cr>", desc = "Terminal 1" },
      { "<leader>t2", "<cmd>ToggleTerm 2<cr>", desc = "Terminal 2" },
      { "<leader>t3", "<cmd>ToggleTerm 3<cr>", desc = "Terminal 3" },
      { "<leader>t4", "<cmd>ToggleTerm 4<cr>", desc = "Terminal 4" },

      -- Send selection to terminal
      { "<leader>ts", "<cmd>ToggleTermSendVisualSelection<cr>", mode = "v", desc = "Send Selection to Terminal" },
    },
  },
}
