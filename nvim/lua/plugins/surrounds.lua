return {
  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    opts = {
      keymaps = {
        normal = "yv",
        normal_cur = "yvv",
        normal_line = "yV",
        normal_cur_line = "yVV",
        delete = "dv",
        change = "cv",
        change_line = "cV",
      }
    }
  },

  {
    "windwp/nvim-autopairs",
    event = "VeryLazy",
    config = true
  },
  {
    "echasnovski/mini.ai",
    event = "VeryLazy",
    config = function()
      require "mini.ai".setup {
        search_method = "cover_or_nearest",
      }
    end
  },
}
