---@param group string
---@vararg { [1]: string|string[], [2]: vim.api.keyset.create_autocmd }
---@return nil
local function au(group, ...)
  local groupid = vim.api.nvim_create_augroup(group, {})
  for _, autocmd in ipairs({ ... }) do
    autocmd[2].group = groupid
    vim.api.nvim_create_autocmd(unpack(autocmd))
  end
end

au('LargeFileSettings', {
  'BufReadPre',
  {
    desc = 'Set settings for large files.',
    callback = function(info)
      if vim.b.large_file ~= nil then
        return
      end
      vim.b.large_file = false
      local stat = vim.uv.fs_stat(info.match)
      if stat and stat.size > 1000000 then
        vim.b.large_file = true
        vim.opt_local.spell = false
        vim.opt_local.swapfile = false
        vim.opt_local.undofile = false
        vim.opt_local.breakindent = false
        vim.opt_local.colorcolumn = ''
        vim.opt_local.statuscolumn = ''
        vim.opt_local.signcolumn = 'no'
        vim.opt_local.foldcolumn = '0'
        vim.opt_local.winbar = ''
        vim.api.nvim_create_autocmd('BufReadPost', {
          buffer = info.buf,
          once = true,
          callback = function()
            vim.opt_local.syntax = ''
            return true
          end,
        })
      end
    end,
  },
})

au('YankHighlight', {
  'TextYankPost',
  {
    desc = 'Highlight the selection on yank.',
    callback = function()
      vim.highlight.on_yank({ higroup = 'Visual', timeout = 400 })
    end,
  },
})

au('EqualWinSize', {
  'VimResized',
  {
    desc = 'Make window equal size on VimResized.',
    command = 'wincmd =',
  },
})

au('DeferSetSpell', {
  { 'BufReadPre', 'BufModifiedSet' },
  {
    desc = 'Defer setting spell options to improve startup time.',
    callback = function(info)
      local buf = info.buf
      local win = vim.api.nvim_get_current_win()
      if
          not vim.b[buf].spell_checked
          and not vim.b[buf].large_file
          and not vim.wo[win].spell
          and vim.bo[buf].bt == ''
          and vim.bo[buf].ma
      then
        vim.opt_local.spell = true
      end
      vim.b[buf].spell_checked = true
    end,
  },
})

-- adapted from https://github.com/ethanholz/nvim-lastplace/blob/main/lua/nvim-lastplace/init.lua
local ignore_buftype = { "quickfix", "nofile", "help" }
local ignore_filetype = { "gitcommit", "gitrebase", "svn", "hgcommit" }

local function run()
  if vim.tbl_contains(ignore_buftype, vim.bo.buftype) then
    return
  end

  if vim.tbl_contains(ignore_filetype, vim.bo.filetype) then
    -- reset cursor to first line
    vim.cmd[[normal! gg]]
    return
  end

  -- If a line has already been specified on the command line, we are done
  --   nvim file +num
  if vim.fn.line(".") > 1 then
    return
  end

  local last_line = vim.fn.line([['"]])
  local buff_last_line = vim.fn.line("$")

  -- If the last line is set and the less than the last line in the buffer
  if last_line > 0 and last_line <= buff_last_line then
    local win_last_line = vim.fn.line("w$")
    local win_first_line = vim.fn.line("w0")
    -- Check if the last line of the buffer is the same as the win
    if win_last_line == buff_last_line then
      -- Set line to last line edited
      vim.cmd[[normal! g`"]]
      -- Try to center
    elseif buff_last_line - last_line > ((win_last_line - win_first_line) / 2) - 1 then
      vim.cmd[[normal! g`"zz]]
    else
      vim.cmd[[normal! G'"<c-e>]]
    end
  end
end

vim.api.nvim_create_autocmd({'BufWinEnter', 'FileType'}, {
  group    = vim.api.nvim_create_augroup('nvim-lastplace', {}),
  callback = run
})
