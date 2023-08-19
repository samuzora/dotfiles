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
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true
  },
}
