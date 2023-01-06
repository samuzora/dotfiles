return {
  "kkoomen/vim-doge",
  build = ":call doge#install()",
  config = function()
    vim.g.doge_mapping = "<Leader>gd"
  end
}
