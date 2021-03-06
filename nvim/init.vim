" Plugin list
packadd vim-jetpack
call jetpack#begin()
	" bootstrap
	Jetpack 'tani/vim-jetpack', {'opt': 1} 
	" performance-related
	Jetpack 'lewis6991/impatient.nvim'
	Jetpack 'nathom/filetype.nvim'

	" editing helpers
	Jetpack 'kylechui/nvim-surround'
	Jetpack 'tpope/vim-repeat'
	" Jetpack 'ggandor/lightspeed.nvim'
	Jetpack 'ggandor/leap.nvim'
	Jetpack 'chrisbra/unicode.vim'
	Jetpack 'kshenoy/vim-signature'
	Jetpack 'tmhedberg/SimpylFold'
	Jetpack 'echasnovski/mini.nvim', { 'branch' : 'stable' }
	Jetpack 'ziontee113/color-picker.nvim'
	
	" floating terminal
	Jetpack 'voldikss/vim-floaterm'

	" tabular (alignment of various stuff)
	Jetpack 'godlygeek/tabular'

	" markdown/latex stuff
	Jetpack 'ellisonleao/glow.nvim'
	Jetpack 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': 'markdown' }
	Jetpack 'lervag/vimtex'
	
	" syntax/lsp plugins
	Jetpack 'neovim/nvim-lspconfig'
	Jetpack 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
	Jetpack 'neoclide/vim-jsx-improve'

	" pytest plugins
	Jetpack 'nvim-lua/plenary.nvim'
	Jetpack 'nvim-treesitter/nvim-treesitter'
	Jetpack 'antoinemadec/FixCursorHold.nvim'
	Jetpack 'rcarriga/nvim-dap-ui'
	Jetpack 'rcarriga/neotest'
	Jetpack 'rcarriga/neotest-python'
	
	" appearance-related
	Jetpack 'karb94/neoscroll.nvim'
	Jetpack 'folke/tokyonight.nvim'
	Jetpack 'nvim-lualine/lualine.nvim'

	" system-related
	Jetpack 'lambdalisue/suda.vim'
call jetpack#end()

" Faster startup time
lua require('impatient')

" Glow config
let g:glow_style = "dark"
let g:glow_border = "rounded"

" Markdown preview config
let g:mkdp_port = '1337'
let g:mkdp_open_to_the_world = 1
" let g:mkdp_markdown_css = '/home/samuzora/.config/nvim/markdown.css'

" Neoscroll config
lua require('neoscroll').setup()
let g:neoscroll_easing_function = "linear"

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
  none        = nil,
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
}

require('lualine').setup {
  options = {
    theme = bubbles_theme,
    component_separators = '|',
    section_separators = { left = '???', right = '???' },
  },
  	globalstatus = true,
  sections = {
    lualine_a = {
      { 'mode', separator = { left = '???' }, right_padding = 2 },
    },
    lualine_b = { 'filename', 'branch' },
	lualine_c = {},
    lualine_x = {},
    lualine_y = { 'filetype', 'progress' },
    lualine_z = {
      { 'location', separator = { right = '???' }, left_padding = 2 },
    },
  },
  tabline = {},
  extensions = {},
}
END

" nvim-surround setup
lua << END
require("nvim-surround").setup({
})
END

" neotest
lua << END
require("neotest").setup({
  adapters = {
	  require("neotest-python")({
		  dap = { justMyCode = false },
		}),
  },
})
END

" mini.nvim setup (collection of useful plugins)
lua << END
require('mini.indentscope').setup {
  draw = {
    delay = 200,
  },

  -- Module mappings. Use `''` (empty string) to disable one.
  mappings = {
    -- Textobjects
    object_scope = 'ii',
    object_scope_with_border = 'ai',

    -- Motions (jump to respective border line; if not present - body line)
    goto_top = '[i',
    goto_bottom = ']i',
  },

  -- Options which control computation of scope. Buffer local values can be
  -- supplied in buffer variable `vim.b.miniindentscope_options`.
  options = {
    -- Type of scope's border: which line(s) with smaller indent to
    -- categorize as border. Can be one of: 'both', 'top', 'bottom', 'none'.
    border = 'both',

    -- Whether to use cursor column when computing reference indent. Useful to
    -- see incremental scopes with horizontal cursor movements.
    indent_at_cursor = true,

    -- Whether to first check input line to be a border of adjacent scope.
    -- Use it if you want to place cursor on function header to get scope of
    -- its body.
    try_as_border = false,
  },

  -- Which character to use for drawing scope indicator
  symbol = '???',
}
END

" color-picker setup
lua << END
require("color-picker").setup {
	["border"] = "rounded",
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
nnoremap <silent> <leader>o :silent !start <c-r>=expand("<cfile>")<CR><CR><CR>
nnoremap <silent> <leader>p :Glow<CR>
nnoremap <silent> <leader>P :Glow<CR><C-w>\|<C-w>_
nnoremap <silent> <leader>m :MarkdownPreview<CR>
nnoremap <silent> <leader>t :FloatermToggle<CR>
nnoremap <silent> <leader>f :TableFormat<CR>
nnoremap <silent> <leader>c :PickColor<CR>
nnoremap <leader>b :ls<CR>:b

" Terminal mode
tnoremap <Esc> <C-\><C-n>
tnoremap <M-[> <Esc>

" Floaterm
let g:floaterm_position = "topright"

" Suda
let g:suda_smart_edit = 1

" TokyoNight color scheme
let g:tokyonight_style = 'storm'
let g:tokyonight_transparent = 1
let g:tokyonight_italic_functions = 1
let g:tokyonight_italic_variables = 1
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
hi clear CursorLineNr
hi CursorLineNr guifg=#d183e8

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

" Fold based on syntax
set foldmethod=syntax
set nofoldenable

" Turn on sign column always, on the same column as line numbers
set signcolumn=number

" Line on screen to see where cursor is
set cursorline
set cursorlineopt=number

" LSPs
lua << END
require('lspconfig').pyright.setup{
    handlers = {
        ["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
			signs = false,
            underline = false,
        })
    },
	settings = {
		python = {
			analysis = {
				typeCheckingMode = "off",
				diagnosticSeverityOverrides = {
					reportWildcardImportFromLibrary = "none",
				},
			},
		},
	},
}
END
lua require('lspconfig').tsserver.setup{}
