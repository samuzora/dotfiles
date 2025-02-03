return {
  {
    "kevinhwang91/nvim-bqf",
    ft = "qf",
    opts = {
      preview = {
        win_height = 10,
        win_vheight = 10,
      },
      func_map = {
        stogglebuf = "mm",
        stogglevm = "m",
        stoggleup = "m<S-Tab>",
        stoggledown = "m<Tab>",
        sclear = "dm",

        lastleave = "<C-o>",
        filter = "fm",
        filterr = "fM",
      }
    }
  },
  {
    "stevearc/quicker.nvim",
    event = "FileType qf",
    keys = {
      {
        "<Leader>qf",
        function() require("quicker").toggle({ height = 15, focus = true }) end,
        desc = "Toggle quickfix"
      },
      {
        "<Leader>ql",
        function()
          require("quicker").toggle({ loclist = true, height = 15, focus = true })
        end,
        desc = "Toggle quickfix"
      }
    },
    ---@module "quicker"
    ---@type quicker.SetupOptions
    opts = {
      keys = {
        {
          ">", function()
            require("quicker").expand({ before = 2, after = 2, add_to_existing = true })
          end,
          desc = "Expand quickfix context"
        },
        {
          "<", function()
            require("quicker").collapse()
          end,
          desc = "Collapse quickfix context"
        },
      }
    }
  }
}
