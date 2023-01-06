return {
  'ggandor/leap.nvim',
  dependencies = {
    { "ggandor/leap-spooky.nvim", config = true },
  },
  config = function()
    require('leap').add_default_mappings()
  end
}
