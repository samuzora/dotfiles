vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local permission_hlgroups = {
  ['-'] = 'NonText',
  ['r'] = 'Delimiter',
  ['w'] = 'Number',
  ['x'] = 'DiagnosticSignOk',
}

return {
  -- files
  {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    ft = "oil",
    keys = {
      { "-", function() require("oil").open() end },
    },
    init = function()
      local arg = vim.fn.argv(0)
      if vim.fn.argc() == 1 and type(arg) == "string" then
        local stat = vim.loop.fs_stat(arg)
        -- Capture the protocol and lazy load oil if it is "oil-ssh", besides also lazy
        -- loading it when the first argument is a directory.
        local adapter = string.match(arg, "^([%l-]*)://")
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
    opts = {
      columns = {
        {
          "icon",
          highlight = "Number",
        },
        {
          "size",
          highlight = "Special",
        },
        {
          "permissions",
          highlight = function(permission_str)
            local hls = {}
            for i = 1, #permission_str do
              local char = permission_str:sub(i, i)
              table.insert(hls, { permission_hlgroups[char], i - 1, i })
            end
            return hls
          end,
        }
      },
      win_options = {
        number = false,
        relativenumber = false,
        signcolumn = "yes:1",
        foldcolumn = "0",
        statuscolumn = "",
      },
      delete_to_trash = true,
      skip_confirm_for_simple_edits = true,
      default_file_explorer = true,
      view_options = {
        show_hidden = true
      },
      keymaps = {
        ["q"] = "actions.close",
        ["<C-h>"] = false,
        ["<M-h>"] = "actions.select_vsplit"
      },
    },
  },

  -- filetree (in case ppl complain I don't have one)
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
    cmd = "Neotree",
    keys = {
      { "<leader>ft", "<cmd>Neotree toggle<CR>", desc = "Toggle file tree" }
    }
  }
}
