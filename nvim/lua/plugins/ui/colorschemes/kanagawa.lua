return {
  "rebelot/kanagawa.nvim",
  config = function()
    require('kanagawa').setup {
      compile = false,
      undercurl = false,
      transparent = true,
      background = {
        dark = "wave",
        light = "lotus"
      },
      colors = {
        theme = {
          all = {
            ui = {
              bg_gutter = "none"
            }
          }
        }
      },
      overrides = function()
        local colors = require("kanagawa.colors").setup()
        local palette = colors.palette
        local theme = colors.theme
        return {
          WinSeparator = { fg = palette.springViolet1 },

          -- leap
          LeapBackdrop = { fg = palette.springViolet1 },
          LeapLabelPrimary = { bold = true, fg = palette.lightBlue },
          LeapLabelSecondary = { bold = true, fg = palette.autumnYellow },
          LeapMatch = { bold = true, fg = palette.autumnGreen },

          -- telescope
          TelescopeTitle = { fg = theme.ui.special, bold = true },
          TelescopePromptNormal = { bg = theme.ui.bg_p1 },
          TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
          TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
          TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
          TelescopePreviewNormal = { bg = theme.ui.bg_dim },
          TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },

          NormalFloat = { bg = "none" },
          FloatBorder = { bg = "none" },
          FloatTitle = { bg = "none" },

          SpellBad = { bg = palette.winterRed },

          -- Save an hlgroup with dark background and dimmed foreground
          -- so that you can use it where your still want darker windows.
          -- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
          NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },

          -- Popular plugins that open floats will link to NormalFloat by default;
          -- set their background accordingly if you wish to keep them dark and borderless
          LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
          MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },

          -- typst highlights
          ["@lsp.type.comment.typst"] = { link = "@comment" },
          ["@lsp.type.string.typst"] = { link = "@string" },
          ["@lsp.type.keyword.typst"] = { link = "@keyword" },
          ["@lsp.type.operator.typst"] = { link = "@operator" },
          ["@lsp.type.number.typst"] = { link = "@number" },
          ["@lsp.type.pol.typst"] = { link = "@parameter" }, -- variables
          ["@lsp.type.decorator.typst"] = { link = "@comment" }, -- unused
          ["@lsp.type.bool.typst"] = { link = "@boolean" },
          ["@lsp.type.punct.typst"] = { link = "@punctuation.bracket" },
          ["@lsp.type.escape.typst"] = { link = "@text" },
          ["@lsp.type.raw.typst"] = { link = "@function" }, -- ending quotes doesn't work
          ["@lsp.type.delim.typst"] = { link = "@punctuation.special" },
          ["@lsp.type.interpolated.typst"] = { link = "@constant" },
          ["@lsp.type.error.typst"] = { fg = palette.samuraiRed }, -- unused?

          ["@lsp.type.heading.typst"] = { fg = palette.lightBlue },
          ["@lsp.type.marker.typst"] = { link = "@operator" },
          ["@lsp.type.link.typst"] = { fg = palette.crystalBlue, underline = true },
          ["@lsp.type.term.typst"] = { link = "@operator" }, -- check docs
          ["@lsp.type.label.typst"] = { link = "@string.escape" },
          ["@lsp.type.ref.typst"] = { link = "@string.escape" },
          ["@lsp.mod.strong.typst"] = { link = "@text.strong" },
          ["@lsp.typemod.punct.strong.typst"] = { link = "@text.strong" },
          ["@lsp.mod.emph.typst"] = { link = "@text.emphasis" },

          ["@lsp.mod.math.typst"] = { fg = palette.boatYellow2 },
          ["@lsp.typemod.pol.math.typst"] = { link = "@parameter" }, -- math variables
          ["@lsp.typemod.text.math.typst"] = { fg = palette.fujiWhite },
          ["@lsp.typemod.string.math.typst"] = { link = "@string" },
          ["@lsp.typemod.comment.math.typst"] = { link = "@comment" },
        }
      end
    }
    vim.cmd 'colorscheme kanagawa'
  end
}
