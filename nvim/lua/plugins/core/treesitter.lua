-- set some unregistered filetypes
vim.filetype.add {
  extension = {
    ejs = "embedded_template",
    squirrelly = "squirrel"
  }
}

return {
  -- treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "nushell/tree-sitter-nu"
    },
    event = "VeryLazy",
    build = ":TSUpdate",
    config = function()
      require "nvim-treesitter.configs".setup {
        modules = {},
        ensure_installed = {},
        ignore_install = {},
        sync_install = false,
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
          disable = { "yaml" }
        },
      }
      require "nvim-treesitter.install".update()
    end
  },
}
