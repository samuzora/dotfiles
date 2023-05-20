return {
  {
    "tpope/vim-repeat",
    event = "VeryLazy",
  },

  {
    "folke/neodev.nvim",
    event = "VeryLazy",
    config = true
  },

  {
    "echasnovski/mini.move",
    event = "VeryLazy",
    config = function() require("mini.move").setup() end
  },

  {
    "echasnovski/mini.comment",
    event = "VeryLazy",
    config = function() require("mini.comment").setup() end
  },

  {
    "echasnovski/mini.align",
    event = "VeryLazy",
    config = function() require("mini.align").setup() end
  },

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      plugins = {
        spelling = {
          enabled = true,
        }
      }
    }
  },

  {
    "mbbill/undotree",
    keys = {
      { "<leader>u", ":UndotreeToggle<CR>", desc = "Toggle undo tree" }
    }
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

  {
    "Eandrju/cellular-automaton.nvim",
    keys = {
      { "<leader>vim", ":CellularAutomaton make_it_rain<CR>", desc = "Rain" }
    },
  },

  {
    "ziontee113/color-picker.nvim",
    ft = {
      "html",
      "css",
      "javascriptreact",
      "scss",
      "sass",
      "conf",
    },
    opts = {
      border = "rounded",
      icons = { "-", ">" },
      keymap = {
        b = "<Plug>ColorPickerSlider10Decrease",
      }
    },
    keys = {
      { "<leader>c", ":PickColor<CR>", desc = "Colour picker" }
    }
  },
}
