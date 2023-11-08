return {
  -- surround operators
  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    opts = {
      keymaps = {
        normal = "yp",
        normal_cur = "ypp",
        normal_line = "yP",
        normal_cur_line = "yPP",
        delete = "dp",
        change = "cp",
        change_line = "cpp",
      }
    }
  },

  -- autopairing
  {
    "altermo/ultimate-autopair.nvim",
    event = { "InsertEnter", "CmdlineEnter" },
    opts = {
      { "$", "$", ft = {"typst", "tex"}, fly = true, space = true, newline = true, dosuround = true },
    }
  },
}
