return {
  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    opts = {
      keymaps = {
        normal = "yo",
        normal_cur = "yoo",
        normal_line = "yO",
        normal_cur_line = "yOO",
        delete = "do",
        change = "co",
        change_line = "coo",
      }
    }
  },

  {
    "altermo/ultimate-autopair.nvim",
    event = { "InsertEnter", "CmdlineEnter" },
    opts = {
    }
  },
}
