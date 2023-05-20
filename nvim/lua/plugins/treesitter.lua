return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = "VeryLazy",
    run = ":TSUpdate",
    config = function()
      require('nvim-treesitter.configs').setup({
        auto_install = true,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        indent = {
          enable = true,
        },
      })
      require('nvim-treesitter.install').update()
    end
  },

  -- show context using treesitter
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = "VeryLazy",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      mode = "topline",
      separator = '-',
      zindex = 1,
    }
  },

  {
    "windwp/nvim-ts-autotag",
    event = "VeryLazy",
    config = true,
  }
}
