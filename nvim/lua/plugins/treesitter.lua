return {
  -- treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    event = "VeryLazy",
    build = ":TSUpdate",
    config = function()
      require "nvim-treesitter.configs".setup {
        modules = {},
        ensure_installed = "all",
        sync_install = false,
        ignore_install = {},
        auto_install = true,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
          use_languagetree = true,
        },
        context_commentstring = {
          languages = {
            javascript = {
              __default = '// %s',
              jsx_element = '{/* %s */}',
              jsx_fragment = '{/* %s */}',
              jsx_attribute = '// %s',
              comment = '// %s',
            },
            typescript = {
              __default = '// %s',
              jsx_element = '{/* %s */}',
              jsx_fragment = '{/* %s */}',
              jsx_attribute = '// %s',
              comment = '// %s',
            },
          },
        },
        indent = {
          enable = true,
        },
      }
      require "nvim-treesitter.install".update()
    end
  },
}
