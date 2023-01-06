return {
  "jbyuki/nabla.nvim",
  keys = {
    { "<leader>m", function() require("nabla").popup({ border = "rounded" }) end },
    { "<leader>M", function() require("nabla").toggle_virt() end }
  }
}
