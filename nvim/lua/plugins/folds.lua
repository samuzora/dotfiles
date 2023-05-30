return {
  {
    "kevinhwang91/nvim-ufo",
    lazy = false, -- if lazy loaded, folds will not be enabled by default
    dependencies = {
      "kevinhwang91/promise-async"
    },
    config = function()
      vim.opt.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
      vim.opt.foldcolumn = "1"
      vim.opt.foldlevel = 99
      vim.opt.foldlevelstart = 99
      vim.opt.foldenable = true

      local handler = function(virtText, lnum, endLnum, width, truncate)
        local newVirtText = {}
        local suffix = (' ...  %d '):format(endLnum - lnum)
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

      require('ufo').setup({
        fold_virt_text_handler = handler
      })

    end,
    keys = {
      -- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
      { "zR", function() require("ufo").openAllFolds() end,         desc = "Open all folds" },
      { "zM", function() require("ufo").closeAllFolds() end,        desc = "Close all folds" },
      { "zr", function() require("ufo").openFoldsExceptKinds() end, desc = "Fold less" },
      { "zm", function() require("ufo").closeFoldsWith() end,       desc = "Fold more" },
      {
        "K",
        function()
          local winid = require("ufo").peekFoldedLinesUnderCursor()
          if not winid then
            -- choose one of coc.nvim and nvim lsp
            vim.lsp.buf.hover()
          end
        end,
        desc = "Peek folded lines under cursor"
      },
    }
  },
}
