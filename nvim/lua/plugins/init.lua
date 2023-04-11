return {
  {
    "folke/neodev.nvim",
    config = true
  },

  {
    "echasnovski/mini.move",
    config = function() require("mini.move").setup() end
  },

  {
    "echasnovski/mini.comment",
    config = function() require("mini.comment").setup() end
  },

  {
    "folke/which-key.nvim",
    config = {
      plugins = {
        spelling = {
          enabled = true,
        }
      }
    }
  },

  "tpope/vim-repeat",

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
