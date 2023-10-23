return {
  -- surround operators
  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    opts = {
      keymaps = {
        normal = "yr",
        normal_cur = "yrr",
        normal_line = "yR",
        normal_cur_line = "yRR",
        delete = "dr",
        change = "cr",
        change_line = "crr",
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
