set list listchars=tab:>-,space:·
set colorcolumn=80 " Highlight 80th row


" Enables 24-bit TrueColor
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif


colorscheme monokai

" Colorscheme overrides
hi SpecialKey  guifg=#767676 guibg=NONE
hi VertSplit   guifg=#64645e guibg=NONE    gui=NONE
hi LineNr      guifg=#90908a guibg=#272822 gui=NONE
hi SignColumn  guifg=#FEE715 guibg=#272822 gui=NONE
hi Search      guifg=#f8f8f2 guibg=#204a87 gui=NONE
hi Normal      guifg=#f8f8f2 guibg=#272822 gui=NONE
hi NonText     guifg=#49483e guibg=#272822 gui=NONE
hi CursorLine  guifg=NONE    guibg=#3c3d37 gui=NONE
hi ColorColumn guifg=NONE    guibg=#3c3d37 gui=NONE
hi Pmenu       guifg=#eaeaea guibg=#333333 gui=NONE
hi PmenuSel    guifg=NONE    guibg=#49483e gui=NONE
hi Conceal     guifg=#75715e guibg=NONE    gui=NONE
