vim.opt.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
vim.opt.foldcolumn = "1"
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true

local handler = function(virtText, lnum, endLnum, width, truncate)
  local newVirtText = {}
  local suffix = (' ... %d '):format(endLnum - lnum)
  local sufWidth = vim.fn.strdisplaywidth(suffix)
  local targetWidth = width - sufWidth
  local curWidth = 0
  for _, chunk in ipairs(virtText) do
    local chunkText = chunk[1]
    local chunkWidth = vim.fn.strdisplaywidth(chunkText)
    if targetWidth > curWidth + chunkWidth then
      table.insert(newVirtText, chunk)
    else
      chunkText = truncate(chunkText, targetWidth - curWidth)
      local hlGroup = chunk[2]
      table.insert(newVirtText, { chunkText, hlGroup })
      chunkWidth = vim.fn.strdisplaywidth(chunkText)
      -- str width returned from truncate() may less than 2nd argument, need padding
      if curWidth + chunkWidth < targetWidth then
        suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
      end
      break
    end
    curWidth = curWidth + chunkWidth
  end
  table.insert(newVirtText, { suffix, 'MoreMsg' })
  return newVirtText
end

-- fix bug with ccc.nvim where colours don't show correctly
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "ccc-ui" },
  callback = function()
    require("ufo").detach()
    vim.opt_local.foldenable = false
  end
})


return {
  {
    "kevinhwang91/nvim-ufo",
    dependencies = { "kevinhwang91/promise-async" },
    event = "VeryLazy",
    keys = {
      { "zR", function() require "ufo".openAllFolds() end,                   desc = "Open all folds" },
      { "zM", function() require "ufo".closeAllFolds() end,                  desc = "Close all folds" },
      { "zr", function(level) require "ufo".openFoldsExceptKinds(level) end, desc = "Fold less" },
      { "zm", function(level) require "ufo".closeFoldsWith(level) end,       desc = "Fold more" },
      {
        "zK",
        function()
          local winid = require "ufo".peekFoldedLinesUnderCursor()
          if not winid then
            vim.lsp.buf.hover()
          end
        end,
        desc = "Preview text under fold"
      },
    },
    opts = {
      fold_virt_text_handler = handler,
      preview = {
        mappings = {
          ["scrollB"] = "<C-b>",
          ["scrollF"] = "<C-f>",
          ["scrollU"] = "<C-u>",
          ["scrollD"] = "<C-d>",
          ["scrollE"] = "<C-e>",
          ["scrollY"] = "<C-y>",
          ["jumpTop"] = "gg",
          ["jumpBot"] = "G",
          ["close"] = "<esc>",
          ["switch"] = "<tab>",
          ["trace"] = "<CR>",
        }
      }
    },
  },
}
