return {
  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    opts = {
      options = { "blank", "buffers", "curdir", "folds", "tabpages", "winsize", "winpos", "terminal", "localoptions" }
    },
    keys = {
      { "<leader>qs", function() require("persistence").load() end },
      { "<leader>ql", function() require("persistence").load({ last = true }) end },
      { "<leader>qd", function() require("persistence").stop() end },
    }
  },
}
