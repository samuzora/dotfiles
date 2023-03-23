return {
  {
    "f-person/git-blame.nvim",
    config = function()
      vim.g.gitblame_enabled = 0
      vim.g.gitblame_message_template = ' <author> • <summary> • <date>'
      vim.g.gitblame_date_format = '%r'
    end,
    keys = {
      { "<leader>gb", ":GitBlameToggle<CR>", desc = "Git blame" }
    }
  },
  {
    "lewis6991/gitsigns.nvim",
    config = true,
  },
  {
    "sindrets/diffview.nvim",
    dependencies = "nvim-lua/plenary.nvim",
  },
}
