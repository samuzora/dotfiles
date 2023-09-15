return {
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
  {
    "lewis6991/gitsigns.nvim",
    event = "VeryLazy",
    config = true,
  },
  {
    "sindrets/diffview.nvim",
    event = "VeryLazy",
    dependencies = "nvim-lua/plenary.nvim",
  },
}
