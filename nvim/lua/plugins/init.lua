-- misc stuff i couldn't find a better place for
return {
  {
    "tpope/vim-repeat",
    event = "VeryLazy",
  },
  {
    "dccsillag/magma-nvim",
    build = ":UpdateRemotePlugins",
    keys = {
      { "<leader>r",  ":MagmaEvaluateOperator<CR>" },
      { "<leader>rr", ":MagmaEvaluateLine<CR>" },
      { "<leader>rr", ":<C-u>MagmaEvaluateVisual<CR>", mode = "x" },
      { "<leader>rc", ":MagmaReevaluateCell<CR>" },
      { "<leader>rd", ":MagmaDelete<CR>" },
      { "<leader>ro", ":MagmaShowOutput<CR>" },
    }
  },

  -- session
  {
    "olimorris/persisted.nvim",
    opts = {
      autosave = true,
      autoload = true,
      ignored_dirs = {
        "/home/samuzora",
      }
    }
  },
}
