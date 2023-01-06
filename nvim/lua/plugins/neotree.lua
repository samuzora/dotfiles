return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = "v2.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "kyazdani42/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

    require("neo-tree").setup()
  end,
  keys = {
    { "<leader>fd", ":Neotree toggle<CR>" }
  }
}
