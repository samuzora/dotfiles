return {
  {
    "ggandor/leap.nvim",
    dependencies = {
    },
    config = function()
      require('leap').add_default_mappings()
      vim.api.nvim_set_hl(0, 'LeapBackdrop', { link = 'Comment' })
      vim.api.nvim_set_hl(0, 'LeapLabelPrimary', { link = 'String' })
      vim.api.nvim_set_hl(0, 'LeapLabelSecondary', { link = 'Function' })
    end
  },
  {
    "ggandor/leap-spooky.nvim",
    config = true
  },
}
