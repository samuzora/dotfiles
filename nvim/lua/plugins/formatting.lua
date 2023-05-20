return {
  {
    "echasnovski/mini.move",
    event = "VeryLazy",
    config = function() require("mini.move").setup() end
  },

  {
    "echasnovski/mini.comment",
    event = "VeryLazy",
    config = function() require("mini.comment").setup() end
  },

  {
    "echasnovski/mini.align",
    event = "VeryLazy",
    config = function() require("mini.align").setup() end
  },
}
