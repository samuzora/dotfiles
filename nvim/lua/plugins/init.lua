return {
  {
    "echasnovski/mini.comment",
    config = function() require("mini.comment").setup() end
  },
  {
    "echasnovski/mini.ai",
    config = function()
      require("mini.ai").setup({
        search_method = "cover_or_nearest",
      })
    end
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

  {
    "kylechui/nvim-surround",
    config = true
  },

  {
    "windwp/nvim-autopairs",
    config = true
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
    "smjonas/inc-rename.nvim",
    config = true,
    keys = {
      { "<leader>rn", ":IncRename ", desc = "Rename var" }
    }
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
    config = {
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
  {
    "kevinhwang91/nvim-ufo",
    dependencies = {
      "neovim/nvim-lspconfig",
      "kevinhwang91/promise-async"
    },
    config = function()
      vim.o.foldcolumn = '1' -- '0' is not bad
      vim.o.foldlevel = 99   -- Using ufo provider need a large value, feel free to decrease the value
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true

      -- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
      vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
      vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)

      require("ufo").setup()
    end,
  }
}
