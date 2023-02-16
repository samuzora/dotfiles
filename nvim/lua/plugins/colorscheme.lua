local M = {
  "sam4llis/nvim-tundra",
  dependencies = {
    "kyazdani42/nvim-web-devicons"
  }
}

function M.config()
  -- catppuccin
  -- require("catppuccin").setup({
  --   transparent_background = true,
  -- })
  -- vim.cmd.colorscheme "catppuccin"
  ---

  -- rose-pine
  -- vim.o.background = 'dark'
  --
  -- require('rose-pine').setup({
  --   dark_variant = 'main',
  --   disable_float_background = true,
  --   disable_background = true,
  -- })
  -- local p = require('rose-pine.palette')
  --
  -- vim.cmd('colorscheme rose-pine')
  --
  -- vim.api.nvim_set_hl(0, 'NormalFloat', { bg = nil })
  -- vim.api.nvim_set_hl(0, 'FloatBorder', { bg = nil })
  -- vim.api.nvim_set_hl(0, 'LeapBackdrop', { fg = p.muted })
  -- vim.api.nvim_set_hl(0, 'LeapLabelPrimary', { fg = p.love })
  -- vim.api.nvim_set_hl(0, 'LeapLabelSecondary', { fg = p.gold })
  -- vim.api.nvim_set_hl(0, 'TreesitterContextLineNumber', { fg = p.gold })
  ---

  -- oxocarbon
  -- vim.opt.background = "dark"
  -- vim.cmd.colorscheme "oxocarbon"
  ---

  -- tundra
  require('nvim-tundra').setup({
    transparent_background = true,
    syntax = {
      booleans = { bold = true, italic = true },
      comments = { bold = true, italic = true },
      conditionals = {},
      constants = { bold = true },
      fields = {},
      functions = {},
      keywords = {},
      loops = {},
      numbers = { bold = true },
      operators = { bold = true },
      punctuation = {},
      strings = {},
      types = { italic = true },
    },
    overwrite = {
      highlights = {
        ["NonText"] = { fg = "" },
        ["@text.strong"] = { bold = true },
        ["@text.emphasis"] = { italic = true },
        ["LeapBackdrop"] = { fg = "#F9FAFB" },
        SpellBad = { fg = "", bg = "", bold = false }
      }
    }
  })
  vim.opt.background = 'dark'
  vim.cmd('colorscheme tundra')
  ---
end

return M
