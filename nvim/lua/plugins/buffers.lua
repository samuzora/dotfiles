return {
  {
    "echasnovski/mini.bufremove",
    config = function() require("mini.bufremove").setup() end,
    keys = {
      { "<leader>bd", function() require("mini.bufremove").delete() end, desc = "Delete buffer" }
    }
  },

  -- harpoon
  {
    "ThePrimeagen/harpoon",
    dependencies = {
      "nvim-lua/plenary.nvim"
    },
    keys = {
      { "<leader>ha", function() require("harpoon.mark").add_file() end,        desc = "Add file to harpoon" },
      { "<leader>hh", function() require("harpoon.ui").toggle_quick_menu() end, desc = "View harpoon" }
    }
  }
}
