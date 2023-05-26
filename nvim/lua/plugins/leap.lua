return {
  {
    "ggandor/leap.nvim",
    event = "VeryLazy",
    config = function()
      require('leap').add_default_mappings()
      vim.api.nvim_set_hl(0, 'LeapBackdrop', { link = 'Comment' })
      vim.api.nvim_set_hl(0, 'LeapLabelPrimary', { link = 'String' })
      vim.api.nvim_set_hl(0, 'LeapLabelSecondary', { link = 'Function' })
    end,
    keys = {
      { "gs", "<Plug>(leap-from-window)", desc = "Leap from window"}
    }
  },
  {
    "ggandor/leap-spooky.nvim",
    event = "VeryLazy",
    config = true
  },
  {
    "ggandor/flit.nvim",
    event= "VeryLazy",
    config = true
  }
}
