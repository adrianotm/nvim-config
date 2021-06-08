" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

    " Better Syntax Support
    Plug 'sheerun/vim-polyglot'
    " Plug 'pangloss/vim-javascript'
    " Plug 'mxw/vim-jsx'
    " Gruvbox theme
    " Plug 'morhetz/gruvbox'
    " Themes
    Plug 'rktjmp/lush.nvim'
    Plug 'npxbr/gruvbox.nvim'
    Plug 'norcalli/nvim-colorizer.lua'
    " Plug 'christianchiarulli/nvcode-color-schemes.vim'
    " Intellisense
    Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
    " FZF
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'airblade/vim-rooter'
    " Easymotion
    " Plug 'easymotion/vim-easymotion'
    " Sneak
    Plug 'justinmk/vim-sneak'
    " Airline
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    " Which key
    Plug 'liuchengxu/vim-which-key'
    " Comments
    Plug 'tpope/vim-commentary'
    " NERDTree
    Plug 'preservim/nerdtree'
    " Buffers
    Plug 'qpkorr/vim-bufkill'
    " Git
    Plug 'airblade/vim-gitgutter'
    Plug 'tpope/vim-fugitive'
    Plug 'junegunn/gv.vim'
    " Stratify
    Plug 'mhinz/vim-startify'
    " Haskell
    Plug 'neovimhaskell/haskell-vim'
    Plug 'alx741/vim-stylishask' " Optional
    Plug 'sbdchd/neoformat'
    Plug 'ndmitchell/ghcid', { 'rtp': 'plugins/nvim' }
    " TypeScript
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
    " Plug 'pangloss/vim-javascript'
    " Plug 'leafgarland/typescript-vim'
    " Plug 'peitalin/vim-jsx-typescript'
    " Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
