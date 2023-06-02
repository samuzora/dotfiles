-- misc stuff i couldn't find a better place for
return {
  {
    "tpope/vim-repeat",
    event = "VeryLazy",
  },

  {
    "lambdalisue/suda.vim",
    config = function()
      vim.g["suda_smart_edit"] = 1
    end,
    keys = {
      { "<leader>w", ":SudaWrite<CR>", desc = "Sudo write" }
    }
  },

  {
    "chentoast/marks.nvim",
    event = "VeryLazy",
    config = true,
  },
}
