return {
  -- neorg
  {
    "nvim-neorg/neorg",
    ft = "norg",
    config = function()
      require "neorg".setup {
        load = {
          ["core.integrations.treesitter"] = {},
          ["core.concealer"] = {},
          ["core.dirman"] = {
            config = {
              workspaces = {
                todo = "~/todo"
              },
              autochdir = true,
            },
          },
          ["core.qol.toc"] = {},
        },
      }
    end,
  },
}
