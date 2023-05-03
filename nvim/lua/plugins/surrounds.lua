return {
  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    config = true
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
      require("mini.ai").setup({
        search_method = "cover_or_nearest",
      })
    end
  },
}
