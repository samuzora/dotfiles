return {
  -- neorg
  {
    "nvim-neorg/neorg",
    dependencies = {
      {
        "folke/zen-mode.nvim",
        config = true,
        event = "VeryLazy",
        keys = {
          { "<leader>za", ":ZenMode<CR>", desc = "Enter zen mode" },
        },
      }
    },
    config = function()
      require("neorg").setup({
        load = {
          ["core.defaults"] = {},
          ["core.concealer"] = {},
          ["core.completion"] = {
            config = { engine = "nvim-cmp" },
          },
          ["core.dirman"] = {
            config = {
              workspaces = {
                todo = "~/todo"
              },
              autochdir = true,
            },
          },
          ["core.qol.toc"] = {},
          ["core.presenter"] = {
            config = {
              zen_mode = "zen-mode",
            },
          },
        },
      })
    end,
    ft = "norg",
  },
  {
    "max397574/neorg-contexts",
    ft = "norg",
  },

  -- markdown
  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && npm install",
    ft = { "markdown" },
    keys = {
      { "<leader>md", ":MarkdownPreviewToggle", desc = "Toggle markdown preview in browser" }
    }
  },

  -- diagrams and stuff
  {
    "jbyuki/venn.nvim",
    keys = {
      { "<leader>v", ":set ve=all<CR><C-v>", desc = "Draw diagrams" }
    }
  },
  {
    "jbyuki/nabla.nvim",
    keys = {
      { "<leader>m", function() require("nabla").popup({ border = "rounded" }) end, desc = "Toggle math popup view" },
      { "<leader>M", function() require("nabla").toggle_virt() end,                 desc = "Toggle math view" }
    }
  },
}
