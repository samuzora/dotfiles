return {
  -- guttersigns for git
  {
    "lewis6991/gitsigns.nvim",
    event = "VeryLazy",
    keys = {
      { "<leader>gb", function() vim.cmd("Gitsigns toggle_current_line_blame") end, desc = "Git blame" }
    },
    opts = {
      current_line_blame_opts = {
        delay = 0,
      }
    },
  },

  -- nice git diff
  {
    "sindrets/diffview.nvim",
    cmd = {
      "DiffviewOpen",
      "DiffviewClose",
      "DiffviewToggleFiles",
      "DiffviewFocusFiles",
      "DiffviewRefresh",
      "DiffviewLog",
      "DiffviewFileHistory",
    },
    dependencies = "nvim-lua/plenary.nvim",
  },
}
