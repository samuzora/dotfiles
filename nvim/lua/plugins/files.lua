vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

return {
  -- telescope
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
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
              ["q"] = require("telescope.actions").close,
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
      require("telescope").load_extension("noice")
    end,
    keys = {
      { "ff", "<cmd>Telescope find_files<CR>",                  desc = "Grep filenames" },
      { "fg", "<cmd>Telescope live_grep<CR>",                   desc = "Grep text" },
      { "fb", "<cmd>Telescope buffers<CR>",                     desc = "Grep buffer names" },
      { "fh", "<cmd>Telescope help_tags<CR>",                   desc = "Grep help" },
      { "fn", "<cmd>Noice telescope<CR>",                       desc = "Grep notifications" },
    }
  },

  -- oil.nvim (buffer filesystem manipulation)
  {
    "stevearc/oil.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons"
    },
    keys = {
      {
        "-",
        function() require("oil").open() end,
      },
      {
        "<leader>o",
        function() require("oil").open_float() end,
      },
    },
    opts = {
      skip_confirm_for_simple_edits = true,
      default_file_explorer = true,
      view_options = {
        show_hidden = true
      },
      float = {
        win_options = {
          winblend = 30,
        }
      },
      keymaps = {
        ["q"] = "actions.close",
      },
    },
    init = function()
      if vim.fn.argc() == 1 then
        local stat = vim.loop.fs_stat(vim.fn.argv(0))
        -- Capture the protocol and lazy load oil if it is "oil-ssh", besides also lazy
        -- loading it when the first argument is a directory.
        local adapter = string.match(vim.fn.argv(0), "^([%l-]*)://")
        if (stat and stat.type == "directory") or adapter == "oil-ssh" then
          require("lazy").load({ plugins = { "oil.nvim" } })
        end
      end
      if not require("lazy.core.config").plugins["oil.nvim"]._.loaded then
        vim.api.nvim_create_autocmd("BufNew", {
          callback = function()
            if vim.fn.isdirectory(vim.fn.expand("<afile>")) == 1 then
              require("lazy").load({ plugins = { "oil.nvim" } })
              -- Once oil is loaded, we can delete this autocmd
              return true
            end
          end,
        })
      end
    end,
  },

  -- quickfix manipulation
  {
    "stefandtw/quickfix-reflector.vim",
    ft = { "qf" },
  }
}
