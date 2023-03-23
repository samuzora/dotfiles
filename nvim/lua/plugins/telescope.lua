return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
  },
  config = function()
    require("telescope").setup({
      defaults = {
        mappings = {
          n = {
            ["<C-o>"] = function(prompt_bufnr)
              require("telescope.actions").select_default(prompt_bufnr)
              require("telescope.builtin")
                  .resume()
            end,
          }
        }
      }
    })
    require("telescope").load_extension("notify")
  end,
  keys = {
    { "<leader>ff", ":Telescope find_files<CR>", desc = "Grep filenames" },
    { "<leader>fg", ":Telescope live_grep<CR>",  desc = "Grep text" },
    { "<leader>fb", ":Telescope buffers<CR>",    desc = "Grep buffer names" },
    { "<leader>fh", ":Telescope help_tags<CR>",  desc = "Grep help" },
    { "<leader>fn", ":Telescope notify<CR>",     desc = "Grep notifications" },
  }
}
