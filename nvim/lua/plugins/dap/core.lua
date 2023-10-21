return {
  {
    "mfussenegger/nvim-dap",
    keys = {
      { "<leader>bp", function() require("dap").set_breakpoint() end },
      { "<leader>bt", function() require("dap").toggle_breakpoint() end },
      { "<leader>bc", function() require("dap").continue() end },
      { "<leader>bl", function() require("dap").run_last() end },
    }
  },

  {
    "rcarriga/nvim-dap-ui",
    main = "dapui",
    opts = {},
    keys = {
      { "<leader>do", function() require("dapui").open() end },
      { "<leader>dc", function() require("dapui").close() end },
      { "<leader>dt", function() require("dapui").toggle() end },
    }
  },

  {
    "theHamsta/nvim-dap-virtual-text",
    event = "VeryLazy",
    opts = {}
  }
}
