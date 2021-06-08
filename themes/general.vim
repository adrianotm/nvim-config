" configure nvcode-color-schemes
let g:nvcode_termcolors=256

syntax on
set background=dark " or light if you want light mode
colorscheme gruvbox


" checks if your terminal has 24-bit color support
if (has("termguicolors"))
    set termguicolors
    hi LineNr ctermbg=NONE guibg=NONE
endif

lua require'colorizer'.setup()
