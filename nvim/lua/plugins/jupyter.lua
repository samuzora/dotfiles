return {
  {
    "dccsillag/magma-nvim",
    build = ":UpdateRemotePlugins",
    keys = {
      { "<leader>r", ":MagmaEvaluateOperator<CR>" },
      { "<leader>rr", ":MagmaEvaluateLine<CR>" },
      { "<leader>rr", ":<C-u>MagmaEvaluateVisual<CR>", mode = "x"},
      { "<leader>rc", ":MagmaReevaluateCell<CR>" },
      { "<leader>rd", ":MagmaDelete<CR>" },
      { "<leader>ro", ":MagmaShowOutput<CR>" },
    }
  }
}
