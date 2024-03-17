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

-- check for venv
-- local venv_path = vim.fn.expand("./.venv")
-- local scan_dir = require('plenary.scandir').scan_dir
-- local paths = scan_dir(venv_path.path, { depth = 3, only_dirs = true, silent = true })
-- vim.fn.setenv('PYTHONPATH', vim.fn.join(paths, ':'))
-- vim.cmd.LspRestart()
