vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

return {
  -- telescope
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
    },
    config = function()
      require "telescope".setup {
        defaults = {
          winblend = 30,
          initial_mode = "normal",
          mappings = {
            n = {
              ["<C-o>"] = function(prompt_bufnr)
                require "telescope.actions".select_default(prompt_bufnr)
                require "telescope.builtin".resume()
              end,
            },
          },
        },
        pickers = {
          buffers = {
            mappings = {
              n = {
                ['<c-d>'] = require('telescope.actions').delete_buffer
              }
            }
          }
        }
      }
      require "telescope".load_extension("notify")
    end,
    keys = {
      { "ff", ":Telescope find_files<CR>", desc = "Grep filenames" },
      { "fg", ":Telescope live_grep<CR>",  desc = "Grep text" },
      { "fb", ":Telescope buffers<CR>",    desc = "Grep buffer names" },
      { "fh", ":Telescope help_tags<CR>",  desc = "Grep help" },
      { "fn", ":Telescope notify<CR>",     desc = "Grep notifications" },
    }
  },

  -- oil.nvim (vim-like filesystem manipulation)
  {
    "stevearc/oil.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons"
    },
    keys = {
      {
        "-",
        function() require("oil").open_float() end,
        desc = "Open parent directory in Oil"
      },
    },
    opts = {
      skip_confirm_for_simple_edits = true,
      default_file_explorer = true,
      view_options = {
        show_hidden = true
      },
      keymaps = {
        ["<esc>"] = "actions.close"
      },
    }
  }
}
