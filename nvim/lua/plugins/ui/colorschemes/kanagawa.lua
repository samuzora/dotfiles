return {
  "rebelot/kanagawa.nvim",
  event = "UIEnter",
  config = function()
    require('kanagawa').setup {
      compile = false,
      undercurl = true,
      transparent = false,
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
        local Color = require("kanagawa.lib.color")
        return {
          WinSeparator = { fg = palette.springViolet1 },

          -- leap
          LeapBackdrop = { fg = palette.springViolet1, bold = false, italic = false, underline = false },
          LeapLabel = { bold = true, fg = palette.lightBlue },
          -- LeapLabelSecondary = { bold = true, fg = palette.autumnYellow },
          LeapMatch = { bold = true, fg = palette.autumnGreen },

          -- telescope
          TelescopeTitle = { fg = theme.ui.special, bold = true },
          TelescopePromptNormal = { bg = theme.ui.bg_p1 },
          TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
          TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
          TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
          TelescopePreviewNormal = { bg = theme.ui.bg_dim },
          TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },

          Pmenu = { bg = palette.sumiInk2 },

          NormalFloat = { bg = "none" },
          FloatBorder = { bg = "none" },
          FloatTitle = { bg = "none" },

          SpellBad = { undercurl = true, bg = palette.winterRed },

          -- Save an hlgroup with dark background and dimmed foreground
          -- so that you can use it where your still want darker windows.
          -- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
          NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },

          -- vim-illuminate
          IlluminatedWordText = { link = "Search" },
          IlluminatedWordRead = { link = "Search" },
          IlluminatedWordWrite = { link = "Search" },

          -- Popular plugins that open floats will link to NormalFloat by default;
          -- set their background accordingly if you wish to keep them dark and borderless
          LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
          MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },

          -- markdown
          ["@markup.heading.1.markdown"] = { fg = palette.oniViolet },
          ["@markup.heading.2.markdown"] = { fg = palette.crystalBlue },
          ["@markup.heading.3.markdown"] = { fg = palette.lightBlue },
          ["@markup.heading.4.markdown"] = { fg = palette.waveAqua2 },
          ["@markup.heading.5.markdown"] = { fg = palette.springGreen },
          ["@markup.heading.6.markdown"] = { fg = palette.carpYellow },
          RenderMarkdownH1Bg = { bg = Color(palette.oniViolet):brighten(-0.6):to_hex() },
          RenderMarkdownH2Bg = { bg = Color(palette.crystalBlue):brighten(-0.6):to_hex() },
          RenderMarkdownH3Bg = { bg = Color(palette.lightBlue):brighten(-0.6):to_hex() },
          RenderMarkdownH4Bg = { bg = Color(palette.waveAqua2):brighten(-0.6):to_hex() },
          RenderMarkdownH5Bg = { bg = Color(palette.springGreen):brighten(-0.6):to_hex() },
          RenderMarkdownH6Bg = { bg = Color(palette.carpYellow):brighten(-0.6):to_hex() },
        }
      end
    }
    vim.cmd 'colorscheme kanagawa'
  end
}
