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
            ["<C-o>"] = function(prompt_bufnr) require("telescope.actions").select_default(prompt_bufnr)
              require("telescope.builtin")
                  .resume()
            end,
          }
        }
      }
    })
  end,
  keys = {
    { "<leader>ff", ":Telescope find_files<CR>" },
    { "<leader>fg", ":Telescope live_grep<CR>" },
    { "<leader>fb", ":Telescope buffers<CR>" },
    { "<leader>fh", ":Telescope help_tags<CR>" },
  }
}
