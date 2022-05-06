" Plugin list
call plug#begin('$HOME/.config/nvim/plugged')
	" Faster startup time
	Plug 'lewis6991/impatient.nvim'
	" Glow markdown 
	Plug 'ellisonleao/glow.nvim'
	" Markdown in browser 
	Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': 'markdown' }
	" vim-surround
	Plug 'tpope/vim-surround'
	" Smooth scrolling
	Plug 'karb94/neoscroll.nvim'
	" Intelligent Python syntax highlighting
	Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }
	" repeat.vim
	Plug 'tpope/vim-repeat'
	" lualine
	Plug 'nvim-lualine/lualine.nvim'
	" lightspeed
	Plug 'ggandor/lightspeed.nvim'
	" TokyoNight color scheme
	Plug 'folke/tokyonight.nvim'
	" lspconfig
	Plug 'neovim/nvim-lspconfig'
	" fish syntax
	Plug 'khaveesh/vim-fish-syntax'
	" floating terminal
	Plug 'voldikss/vim-floaterm'
	" Markdown syntax
	Plug 'gabrielelana/vim-markdown'
call plug#end()

" Faster startup time
lua require('impatient')

" Glow config
let g:glow_style = "dark"
let g:glow_border = "rounded"

" Markdown preview config
let g:mkdp_port = '1337'
let g:mkdp_open_to_the_world = 1

" Neoscroll config
lua require('neoscroll').setup()
let g:neoscroll_easing_function = "quintic"

" Semshi config
let g:semshi#error_sign_delay = 2.5
let g:semshi#excluded_hl_groups = []

" lualine setup
lua << END
local colors = {
  blue        = '#80a0ff',
  cyan        = '#79dac8',
  black       = '#080808',
  white       = '#c6c6c6',
  red         = '#ff5189',
  violet      = '#d183e8',
  green       = '#7ed996',
  dark_violet = '#955da6',
  none = nil,
}

local bubbles_theme = {
  normal = {
    a = { fg = colors.black, bg = colors.violet },
    b = { fg = colors.violet, bg = colors.black },
    c = { fg = colors.none },
  },

  insert = { 
	a = { fg = colors.black, bg = colors.blue },
	b = { fg = colors.blue, bg = colors.black },
  },
  visual = { 
	a = { fg = colors.black, bg = colors.cyan },
	b = { fg = colors.cyan, bg = colors.black },
  },
  replace = { 
	  a = { fg = colors.black, bg = colors.red }, 
	  b = { fg = colors.red, bg = colors.black }, 
  },
  terminal = {
	  a = { fg = colors.black, bg = colors.green },
	  b = { fg = colors.green, bg = colors.black },
  },

  inactive = {
    a = { fg = colors.black, bg = colors.dark_violet },
    b = { fg = colors.dark_violet, bg = colors.black },
  },
}

require('lualine').setup {
  options = {
    theme = bubbles_theme,
    component_separators = '|',
    section_separators = { left = '', right = '' },
  },
  	globalstatus = true,
  sections = {
    lualine_a = {
      { 'mode', separator = { left = '' }, right_padding = 2 },
    },
    lualine_b = { 'filename', 'branch' },
	lualine_c = {},
    lualine_x = {},
    lualine_y = { 'filetype', 'progress' },
    lualine_z = {
      { 'location', separator = { right = '' }, left_padding = 2 },
    },
  },
  inactive_sections = {
    lualine_a = {
      { 'mode', separator = { left = '' }, right_padding = 2 },
    },
    lualine_b = { 'filename', 'branch' },
	lualine_c = {},
    lualine_x = {},
    lualine_y = { 'filetype', 'progress' },
    lualine_z = {
      { 'location', separator = { right = '' }, left_padding = 2 },
    },
  },
  tabline = {},
  extensions = {},
}
END
set laststatus=3

" Remaps
" Normal mode
let mapleader = " "
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-W>t <C-W>v:terminal<CR>i
nnoremap <silent> <leader>p :Glow<CR>
nnoremap <silent> <leader>o :silent !start <c-r>=expand("<cfile>")<CR><CR><CR>
nnoremap <leader>i :PlugInstall<CR>
nnoremap <silent> <leader>P :Glow<CR><C-w>\|<C-w>_
nnoremap <silent> <leader>m :MarkdownPreview<CR>
nnoremap <silent> <leader>t :FloatermToggle<CR>
" Terminal mode
tnoremap <Esc> <C-\><C-n>
tnoremap <M-[> <Esc>

" TokyoNight color scheme
let g:tokyonight_style = 'storm'
let g:tokyonight_transparent = 1
colorscheme tokyonight

" Highlights
set termguicolors
hi clear LightspeedShortcut
hi LightspeedShortcut guibg=#d183e8 guifg=#080808
hi clear LightspeedShortcutOverlapped
hi LightspeedShortcutOverlapped guibg=#d183e8 guifg=#080808
hi clear LightspeedLabel
hi LightspeedLabel guibg=#d183e8 guifg=#080808
hi clear Search
hi Search cterm=underline ctermfg=green
hi clear IncSearch
hi IncSearch cterm=underline,italic ctermfg=green
hi clear SignColumn
hi clear NormalFloat
hi NormalFloat ctermbg=none 
hi FloatBorder guibg=none

" More natural split opening
set splitbelow
set splitright

" Enable persistent undos
set undofile

" Fix for weird backupdir bug
set backupdir=~/.local/share/nvim/backup

" Better tabs
set tabstop=4
set shiftwidth=4
set smarttab

" Enable mouse
set mouse=a

" Set smartcase
set ignorecase smartcase

" Enable absolute numbered line at cursor, relative numbered on the rest
set number
set relativenumber

" Break on blank characters
set linebreak

" Fold based on indents
set foldmethod=indent
set nofoldenable
set foldlevel=99

" Turn on sign column always, on the same column as line numbers
set signcolumn=number

" Line on screen to see where cursor is
set cursorline
set cursorlineopt=number

" LSPs
lua require('lspconfig').pyright.setup{}
