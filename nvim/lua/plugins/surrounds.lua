return {
  {
    "kylechui/nvim-surround",
    config = true
  },

  {
    "windwp/nvim-autopairs",
    config = true
  },
  {
    "echasnovski/mini.ai",
    config = function()
      require("mini.ai").setup({
        search_method = "cover_or_nearest",
      })
    end
  },
}
