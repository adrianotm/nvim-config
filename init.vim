"General
source $HOME/.config/nvim/general/settings.vim
""Mappings
source $HOME/.config/nvim/keys/mappings.vim
source $HOME/.config/nvim/keys/which-key.vim
""Plugins
source $HOME/.config/nvim/vim-plug/plugins.vim
""Plug configurations
source $HOME/.config/nvim/plug-config/coc.vim
source $HOME/.config/nvim/plug-config/fzf.vim
source $HOME/.config/nvim/plug-config/sneak.vim
source $HOME/.config/nvim/plug-config/nerdtree.vim
source $HOME/.config/nvim/plug-config/buffkill.vim
source $HOME/.config/nvim/plug-config/gitgutter.vim
source $HOME/.config/nvim/plug-config/fugitive.vim
source $HOME/.config/nvim/plug-config/start-screen.vim
source $HOME/.config/nvim/plug-config/treesitter.vim
"Themes
" source $HOME/.config/nvim/themes/onedark.vim
source $HOME/.config/nvim/themes/airline.vim
source $HOME/.config/nvim/themes/general.vim

" let g:ghcid_command = "stack exec ghcid --"


" Python path
let g:python3_host_prog = expand("~/miniconda3/bin/python3.8")
