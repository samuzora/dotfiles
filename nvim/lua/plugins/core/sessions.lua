return {
  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    opts = {
      options = { "blank", "buffers", "curdir", "folds", "tabpages", "winsize", "winpos", "terminal", "localoptions" }
    },
    keys = {
      { "<leader>ss", function() require("persistence").load() end },
      { "<leader>sd", function() require("persistence").stop() end },
    }
  },
}
