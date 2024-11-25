" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

    " Gruvbox theme that works with 5.0
    Plug 'sainnhe/gruvbox-material'
    " Telescope (fzf)
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'airblade/vim-rooter'
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
    Plug 'kyazdani42/nvim-web-devicons'
    " Stratify
    Plug 'mhinz/vim-startify'
    " Haskell syntax
    Plug 'neovimhaskell/haskell-vim'
    " Autoformat
    Plug 'Chiel92/vim-autoformat'
    " 0.5 nvim
    Plug 'neovim/nvim-lspconfig'
    " Rust
    Plug 'rust-lang/rust.vim'
    " Tmux
    Plug 'christoomey/vim-tmux-navigator'
    " Autocomplete
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-cmdline'
    Plug 'hrsh7th/nvim-cmp'
    Plug 'hrsh7th/cmp-vsnip'
    Plug 'hrsh7th/vim-vsnip'
    " Lsp
    Plug 'RishabhRD/popfix'
    Plug 'RishabhRD/nvim-lsputils'
    " Markdown
    Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
    " Typescript
    Plug 'jose-elias-alvarez/nvim-lsp-ts-utils'
    " Nix
    Plug 'LnL7/vim-nix'
    " Ember
    Plug 'joukevandermaas/vim-ember-hbs'

call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
