return {
  "nvim-neorg/neorg",
  dependencies = {
    "max397574/neorg-contexts",
    {
      "folke/zen-mode.nvim",
      config = true,
      keys = {
        { "<leader>za", ":ZenMode<CR>" },
      },
      lazy = false,
    }
  },
  ft = "norg",
  config = function()

    require("neorg").setup({
      load = {
        ["core.defaults"] = {},
        ["core.norg.concealer"] = {},
        ["core.norg.completion"] = {
          config = { engine = "nvim-cmp" },
        },
        ["core.norg.dirman"] = {
          config = {
            workspaces = {
              todo = "~/neorg/todo"
            },
            autochdir = true,
          },
        },
        ["core.norg.qol.toc"] = {},
        ["core.presenter"] = {
          config = {
            zen_mode = "zen-mode",
          },
        },
      },
    })
  end,
}
