return {
  -- telescope
  {
    "nvim-telescope/telescope.nvim",
    cmd = { "Telescope" },
    keys = {
      { "ff", "<cmd>Telescope find_files<CR>",                               desc = "Find file" },
      { "fg", "<cmd>Telescope live_grep<CR>",                                desc = "Find text" },
      { "fh", "<cmd>Telescope help_tags<CR>",                                desc = "Find help" },
      { "fd", "<cmd>Telescope diagnostics<CR>",                              desc = "Workspace diagnostics" },
      { "fn", "<cmd>Noice telescope<CR>",                                    desc = "List notifications" },

      -- telescope lsp finders
      { "gd", function() require("telescope.builtin").lsp_definitions() end, desc = "Symbol definitions" },
      { "gr", function() require("telescope.builtin").lsp_references() end,  desc = "Symbol references" },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      -- "folke/trouble.nvim",
    },
    config = function()
      local actions = require "telescope.actions"
      local action_state = require "telescope.actions.state"

      -- local trouble = require "trouble"

      require "telescope".setup {
        defaults = {
          layout_strategy = "flex",
          initial_mode = "normal",
          mappings = {
            n = {
              ["<C-o>"] = function(prompt_bufnr)
                actions.select_default(prompt_bufnr)
                require "telescope.builtin".resume()
              end,
              ["<C-s>"] = actions.file_vsplit,
              ["<C-h>"] = actions.file_split,
              ["<C-q>"] = function(prompt_bufnr)
                local picker = action_state.get_current_picker(prompt_bufnr)
                if #picker:get_multi_selection() == 0 then
                  actions.send_to_qflist(prompt_bufnr)
                else
                  actions.send_selected_to_qflist(prompt_bufnr)
                end
                actions.open_qflist(prompt_bufnr)
                -- trouble.open("quickfix")
              end,
              ["q"] = actions.close,
              ["<Esc>"] = function() end, -- disable escape
            },
          },
        },
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
          }
        }
      }

      require("telescope").load_extension("noice")
      require("telescope").load_extension("fzf")
    end,
  },
}
