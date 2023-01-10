return {
  "williamboman/mason-lspconfig.nvim",
  "hrsh7th/cmp-nvim-lsp",

  "tpope/vim-repeat",
  {
    "mbbill/undotree",
    keys = {
      { "<leader>u", ":UndotreeToggle" }
    }
  },
  {
    "anuvyklack/pretty-fold.nvim",
    config = true,
  },
  {
    "lambdalisue/suda.vim",
    config = function() vim.g['suda_smart_edit'] = 1 end,
  },
  {
    "chentoast/marks.nvim",
    config = true,
  },
  {
    "Eandrju/cellular-automaton.nvim",
    keys = {
      { "<leader>fun", ":CellularAutomaton make_it_rain<CR>" }
    },
  },
  {
    "f-person/git-blame.nvim",
    config = function()
      vim.g.gitblame_enabled = 0
      vim.g.gitblame_message_template = ' <author> • <summary> • <date>'
      vim.g.gitblame_date_format = '%r'
    end,
    keys = {
      { "<leader>gb", ":GitBlameToggle<CR>" }
    }
  },
  {
    "stevearc/oil.nvim",
    config = true,
  },
  {
    "lewis6991/gitsigns.nvim",
    config = true,
  },
  {
    "sindrets/diffview.nvim",
    dependencies = "nvim-lua/plenary.nvim",
  },
  {
    "lervag/vimtex",
    ft = { 'tex' },
  },
  {
    "smjonas/inc-rename.nvim",
    config = true,
    keys = {
      { "<leader>rn", ":IncRename " }
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
      { "<leader>c", ":PickColor<CR>" }
    }
  }
}
