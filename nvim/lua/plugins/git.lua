return {
  -- git blame
  {
    "f-person/git-blame.nvim",
    config = function()
      vim.g.gitblame_enabled = 0
      vim.g.gitblame_message_template = ' <author> • <summary> • <date>'
      vim.g.gitblame_date_format = '%r'
    end,
    keys = {
      { "<leader>gb", vim.cmd.GitBlameToggle, desc = "Git blame" }
    }
  },

  -- guttersigns
  {
    "lewis6991/gitsigns.nvim",
    event = "VeryLazy",
    config = true,
  },

  -- nicer git diff
  {
    "sindrets/diffview.nvim",
    event = "VeryLazy",
    dependencies = "nvim-lua/plenary.nvim",
  },
}
