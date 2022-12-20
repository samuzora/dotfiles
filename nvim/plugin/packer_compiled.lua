-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/samuzora/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/samuzora/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/samuzora/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/samuzora/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/samuzora/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  LuaSnip = {
    loaded = true,
    path = "/home/samuzora/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["aerial.nvim"] = {
    config = { "setup('aerial')" },
    loaded = true,
    path = "/home/samuzora/.local/share/nvim/site/pack/packer/start/aerial.nvim",
    url = "https://github.com/stevearc/aerial.nvim"
  },
  ["cellular-automaton.nvim"] = {
    loaded = true,
    path = "/home/samuzora/.local/share/nvim/site/pack/packer/start/cellular-automaton.nvim",
    url = "https://github.com/Eandrju/cellular-automaton.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/samuzora/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/home/samuzora/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/samuzora/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/samuzora/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["color-picker.nvim"] = {
    config = { 'setup("color-picker")' },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/samuzora/.local/share/nvim/site/pack/packer/opt/color-picker.nvim",
    url = "https://github.com/ziontee113/color-picker.nvim"
  },
  ["diffview.nvim"] = {
    loaded = true,
    path = "/home/samuzora/.local/share/nvim/site/pack/packer/start/diffview.nvim",
    url = "https://github.com/sindrets/diffview.nvim"
  },
  ["git-blame.nvim"] = {
    config = { 'setup("git-blame")' },
    loaded = true,
    path = "/home/samuzora/.local/share/nvim/site/pack/packer/start/git-blame.nvim",
    url = "https://github.com/f-person/git-blame.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { 'setup("gitsigns")' },
    loaded = true,
    path = "/home/samuzora/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["impatient.nvim"] = {
    config = { 'setup("impatient")' },
    loaded = true,
    path = "/home/samuzora/.local/share/nvim/site/pack/packer/start/impatient.nvim",
    url = "https://github.com/lewis6991/impatient.nvim"
  },
  ["inc-rename.nvim"] = {
    config = { 'setup("inc-rename")' },
    loaded = true,
    path = "/home/samuzora/.local/share/nvim/site/pack/packer/start/inc-rename.nvim",
    url = "https://github.com/smjonas/inc-rename.nvim"
  },
  ["leap-spooky.nvim"] = {
    config = { "setup('leap-spooky')" },
    loaded = true,
    path = "/home/samuzora/.local/share/nvim/site/pack/packer/start/leap-spooky.nvim",
    url = "https://github.com/ggandor/leap-spooky.nvim"
  },
  ["leap.nvim"] = {
    config = { "setup('leap')" },
    loaded = true,
    path = "/home/samuzora/.local/share/nvim/site/pack/packer/start/leap.nvim",
    url = "https://github.com/ggandor/leap.nvim"
  },
  ["lsp-format.nvim"] = {
    loaded = true,
    path = "/home/samuzora/.local/share/nvim/site/pack/packer/start/lsp-format.nvim",
    url = "https://github.com/lukas-reineke/lsp-format.nvim"
  },
  ["lualine.nvim"] = {
    config = { 'setup("lualine")' },
    loaded = true,
    path = "/home/samuzora/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["markdown-preview.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/samuzora/.local/share/nvim/site/pack/packer/opt/markdown-preview.nvim",
    url = "https://github.com/iamcco/markdown-preview.nvim"
  },
  ["marks.nvim"] = {
    config = { 'setup("marks")' },
    loaded = true,
    path = "/home/samuzora/.local/share/nvim/site/pack/packer/start/marks.nvim",
    url = "https://github.com/chentoast/marks.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/home/samuzora/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    config = { 'setup("mason")' },
    loaded = true,
    path = "/home/samuzora/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["mini.nvim"] = {
    config = { 'setup("mini")' },
    loaded = true,
    path = "/home/samuzora/.local/share/nvim/site/pack/packer/start/mini.nvim",
    url = "https://github.com/echasnovski/mini.nvim"
  },
  ["nabla.nvim"] = {
    loaded = true,
    path = "/home/samuzora/.local/share/nvim/site/pack/packer/start/nabla.nvim",
    url = "https://github.com/jbyuki/nabla.nvim"
  },
  ["neo-tree.nvim"] = {
    config = { 'setup("neo-tree")' },
    loaded = true,
    path = "/home/samuzora/.local/share/nvim/site/pack/packer/start/neo-tree.nvim",
    url = "https://github.com/nvim-neo-tree/neo-tree.nvim"
  },
  neoformat = {
    loaded = true,
    path = "/home/samuzora/.local/share/nvim/site/pack/packer/start/neoformat",
    url = "https://github.com/sbdchd/neoformat"
  },
  neorg = {
    config = { 'setup("neorg")' },
    load_after = {},
    loaded = true,
    needs_bufread = true,
    path = "/home/samuzora/.local/share/nvim/site/pack/packer/opt/neorg",
    url = "https://github.com/nvim-neorg/neorg"
  },
  ["neorg-contexts"] = {
    loaded = true,
    path = "/home/samuzora/.local/share/nvim/site/pack/packer/start/neorg-contexts",
    url = "https://github.com/max397574/neorg-contexts"
  },
  ["noice.nvim"] = {
    config = { 'setup("noice")' },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/samuzora/.local/share/nvim/site/pack/packer/opt/noice.nvim",
    url = "https://github.com/folke/noice.nvim"
  },
  ["nui.nvim"] = {
    loaded = true,
    path = "/home/samuzora/.local/share/nvim/site/pack/packer/start/nui.nvim",
    url = "https://github.com/MunifTanjim/nui.nvim"
  },
  ["nvim-autopairs"] = {
    config = { 'setup("nvim-autopairs")' },
    loaded = true,
    path = "/home/samuzora/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    config = { "setup('nvim-cmp')" },
    loaded = true,
    path = "/home/samuzora/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    config = { 'setup("lspconfig")' },
    loaded = true,
    path = "/home/samuzora/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-notify"] = {
    loaded = true,
    path = "/home/samuzora/.local/share/nvim/site/pack/packer/start/nvim-notify",
    url = "https://github.com/rcarriga/nvim-notify"
  },
  ["nvim-surround"] = {
    config = { 'setup("nvim-surround")' },
    loaded = true,
    path = "/home/samuzora/.local/share/nvim/site/pack/packer/start/nvim-surround",
    url = "https://github.com/kylechui/nvim-surround"
  },
  ["nvim-treesitter"] = {
    after = { "neorg" },
    config = { 'setup("treesitter")' },
    loaded = true,
    only_config = true,
    path = "/home/samuzora/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-context"] = {
    config = { 'setup("treesitter-context")' },
    loaded = true,
    path = "/home/samuzora/.local/share/nvim/site/pack/packer/start/nvim-treesitter-context",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-context"
  },
  ["nvim-treesitter-textobjects"] = {
    loaded = true,
    path = "/home/samuzora/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textobjects",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects"
  },
  ["nvim-trevJ.lua"] = {
    config = { 'setup("nvim-trevJ")' },
    loaded = true,
    path = "/home/samuzora/.local/share/nvim/site/pack/packer/start/nvim-trevJ.lua",
    url = "https://github.com/AckslD/nvim-trevJ.lua"
  },
  ["nvim-ts-autotag"] = {
    config = { 'setup("nvim-ts-autotag")' },
    loaded = true,
    path = "/home/samuzora/.local/share/nvim/site/pack/packer/start/nvim-ts-autotag",
    url = "https://github.com/windwp/nvim-ts-autotag"
  },
  ["nvim-ts-rainbow"] = {
    loaded = true,
    path = "/home/samuzora/.local/share/nvim/site/pack/packer/start/nvim-ts-rainbow",
    url = "https://github.com/p00f/nvim-ts-rainbow"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/samuzora/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["oxocarbon.nvim"] = {
    config = { 'setup("oxocarbon")' },
    loaded = true,
    path = "/home/samuzora/.local/share/nvim/site/pack/packer/start/oxocarbon.nvim",
    url = "https://github.com/nyoom-engineering/oxocarbon.nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/samuzora/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/samuzora/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["pretty-fold.nvim"] = {
    config = { 'setup("pretty-fold")' },
    loaded = true,
    path = "/home/samuzora/.local/share/nvim/site/pack/packer/start/pretty-fold.nvim",
    url = "https://github.com/anuvyklack/pretty-fold.nvim"
  },
  ["suda.vim"] = {
    config = { 'setup("suda")' },
    loaded = true,
    path = "/home/samuzora/.local/share/nvim/site/pack/packer/start/suda.vim",
    url = "https://github.com/lambdalisue/suda.vim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/home/samuzora/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope.nvim"] = {
    config = { 'setup("telescope")' },
    loaded = true,
    path = "/home/samuzora/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["toggleterm.nvim"] = {
    config = { 'setup("toggleterm")' },
    loaded = true,
    path = "/home/samuzora/.local/share/nvim/site/pack/packer/start/toggleterm.nvim",
    url = "https://github.com/akinsho/toggleterm.nvim"
  },
  ["trouble.nvim"] = {
    config = { 'setup("trouble")' },
    loaded = true,
    path = "/home/samuzora/.local/share/nvim/site/pack/packer/start/trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
  },
  ["true-zen.nvim"] = {
    config = { 'setup("true-zen")' },
    loaded = true,
    path = "/home/samuzora/.local/share/nvim/site/pack/packer/start/true-zen.nvim",
    url = "https://github.com/Pocco81/true-zen.nvim"
  },
  undotree = {
    loaded = true,
    path = "/home/samuzora/.local/share/nvim/site/pack/packer/start/undotree",
    url = "https://github.com/mbbill/undotree"
  },
  ["vim-doge"] = {
    config = { 'setup("vim-doge")' },
    loaded = true,
    path = "/home/samuzora/.local/share/nvim/site/pack/packer/start/vim-doge",
    url = "https://github.com/kkoomen/vim-doge"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/home/samuzora/.local/share/nvim/site/pack/packer/start/vim-repeat",
    url = "https://github.com/tpope/vim-repeat"
  },
  vimtex = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/samuzora/.local/share/nvim/site/pack/packer/opt/vimtex",
    url = "https://github.com/lervag/vimtex"
  }
}

time([[Defining packer_plugins]], false)
-- Setup for: markdown-preview.nvim
time([[Setup for markdown-preview.nvim]], true)
try_loadstring("\27LJ\2\n=\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\2\0\0\rmarkdown\19mkdp_filetypes\6g\bvim\0", "setup", "markdown-preview.nvim")
time([[Setup for markdown-preview.nvim]], false)
-- Config for: leap.nvim
time([[Config for leap.nvim]], true)
setup('leap')
time([[Config for leap.nvim]], false)
-- Config for: oxocarbon.nvim
time([[Config for oxocarbon.nvim]], true)
setup("oxocarbon")
time([[Config for oxocarbon.nvim]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
setup("lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
setup("lualine")
time([[Config for lualine.nvim]], false)
-- Config for: pretty-fold.nvim
time([[Config for pretty-fold.nvim]], true)
setup("pretty-fold")
time([[Config for pretty-fold.nvim]], false)
-- Config for: nvim-surround
time([[Config for nvim-surround]], true)
setup("nvim-surround")
time([[Config for nvim-surround]], false)
-- Config for: neo-tree.nvim
time([[Config for neo-tree.nvim]], true)
setup("neo-tree")
time([[Config for neo-tree.nvim]], false)
-- Config for: leap-spooky.nvim
time([[Config for leap-spooky.nvim]], true)
setup('leap-spooky')
time([[Config for leap-spooky.nvim]], false)
-- Config for: suda.vim
time([[Config for suda.vim]], true)
setup("suda")
time([[Config for suda.vim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
setup("telescope")
time([[Config for telescope.nvim]], false)
-- Config for: nvim-trevJ.lua
time([[Config for nvim-trevJ.lua]], true)
setup("nvim-trevJ")
time([[Config for nvim-trevJ.lua]], false)
-- Config for: nvim-treesitter-context
time([[Config for nvim-treesitter-context]], true)
setup("treesitter-context")
time([[Config for nvim-treesitter-context]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
setup("treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: git-blame.nvim
time([[Config for git-blame.nvim]], true)
setup("git-blame")
time([[Config for git-blame.nvim]], false)
-- Config for: mason.nvim
time([[Config for mason.nvim]], true)
setup("mason")
time([[Config for mason.nvim]], false)
-- Config for: nvim-ts-autotag
time([[Config for nvim-ts-autotag]], true)
setup("nvim-ts-autotag")
time([[Config for nvim-ts-autotag]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
setup("gitsigns")
time([[Config for gitsigns.nvim]], false)
-- Config for: mini.nvim
time([[Config for mini.nvim]], true)
setup("mini")
time([[Config for mini.nvim]], false)
-- Config for: impatient.nvim
time([[Config for impatient.nvim]], true)
setup("impatient")
time([[Config for impatient.nvim]], false)
-- Config for: aerial.nvim
time([[Config for aerial.nvim]], true)
setup('aerial')
time([[Config for aerial.nvim]], false)
-- Config for: trouble.nvim
time([[Config for trouble.nvim]], true)
setup("trouble")
time([[Config for trouble.nvim]], false)
-- Config for: marks.nvim
time([[Config for marks.nvim]], true)
setup("marks")
time([[Config for marks.nvim]], false)
-- Config for: inc-rename.nvim
time([[Config for inc-rename.nvim]], true)
setup("inc-rename")
time([[Config for inc-rename.nvim]], false)
-- Config for: true-zen.nvim
time([[Config for true-zen.nvim]], true)
setup("true-zen")
time([[Config for true-zen.nvim]], false)
-- Config for: vim-doge
time([[Config for vim-doge]], true)
setup("vim-doge")
time([[Config for vim-doge]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
setup("nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
setup('nvim-cmp')
time([[Config for nvim-cmp]], false)
-- Config for: toggleterm.nvim
time([[Config for toggleterm.nvim]], true)
setup("toggleterm")
time([[Config for toggleterm.nvim]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd neorg ]]

-- Config for: neorg
setup("neorg")

time([[Sequenced loading]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType tex ++once lua require("packer.load")({'vimtex'}, { ft = "tex" }, _G.packer_plugins)]]
vim.cmd [[au FileType html ++once lua require("packer.load")({'color-picker.nvim'}, { ft = "html" }, _G.packer_plugins)]]
vim.cmd [[au FileType css ++once lua require("packer.load")({'color-picker.nvim'}, { ft = "css" }, _G.packer_plugins)]]
vim.cmd [[au FileType javascriptreact ++once lua require("packer.load")({'color-picker.nvim'}, { ft = "javascriptreact" }, _G.packer_plugins)]]
vim.cmd [[au FileType scss ++once lua require("packer.load")({'color-picker.nvim'}, { ft = "scss" }, _G.packer_plugins)]]
vim.cmd [[au FileType sass ++once lua require("packer.load")({'color-picker.nvim'}, { ft = "sass" }, _G.packer_plugins)]]
vim.cmd [[au FileType conf ++once lua require("packer.load")({'color-picker.nvim'}, { ft = "conf" }, _G.packer_plugins)]]
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'markdown-preview.nvim'}, { ft = "markdown" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au VimEnter * ++once lua require("packer.load")({'noice.nvim'}, { event = "VimEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /home/samuzora/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/cls.vim]], true)
vim.cmd [[source /home/samuzora/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/cls.vim]]
time([[Sourcing ftdetect script at: /home/samuzora/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/cls.vim]], false)
time([[Sourcing ftdetect script at: /home/samuzora/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tex.vim]], true)
vim.cmd [[source /home/samuzora/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tex.vim]]
time([[Sourcing ftdetect script at: /home/samuzora/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tex.vim]], false)
time([[Sourcing ftdetect script at: /home/samuzora/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tikz.vim]], true)
vim.cmd [[source /home/samuzora/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tikz.vim]]
time([[Sourcing ftdetect script at: /home/samuzora/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tikz.vim]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
