return {
  -- surround operators
  {
    "kylechui/nvim-surround",
    keys = { "yp", "yP", "ypp", "yPP", "dp", "cpp", "cp" },
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
      { "$", "$", ft = { "typst", "tex" }, fly = true, space = true, newline = true, dosuround = true },
    }
  },

  -- auto-exit pairs in insert mode by pressing tab
  {
    "abecodes/tabout.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-cmp"
    },
    keys = {
      { "<Tab>",   mode = "i" },
      { "<S-Tab>", mode = "i" }
    },
    config = true,
  },
}
