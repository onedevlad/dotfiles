" Airline
let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#bufferline#enabled = 0
let g:airline_powerline_fonts = 1
let g:airline#extensions#coc#enabled = 1
let g:airline#extensions#branch#enabled = 0



" Buffergator
let g:buffergator_viewport_split_policy = "B"
let g:buffergator_sort_regime = "mru"
nnoremap <C-n> :BuffergatorMruCyclePrev<CR>
nnoremap <C-p> :BuffergatorMruCycleNext<CR>
nnoremap <C-b> :BuffergatorOpen<CR>



" NERDTree
" autocmd vimenter * NERDTree
let NERDTreeMinimalUI = 1
nmap <C-/> :NERDTreeFind<CR>
nmap <silent> <leader><leader> :NERDTreeToggle<CR>
let g:NERDTreeChDirMode = 2
" let NERDTreeIgnore = ['\.js$', '\.map$']

" Startify
autocmd VimEnter *
  \   if !argc()
  \ |   Startify
  \ |   NERDTree
  \ |   wincmd w
  \ | endif



" CamelCaseMotion
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
map <silent> ge <Plug>CamelCaseMotion_ge
omap <silent> iw <Plug>CamelCaseMotion_iw
xmap <silent> iw <Plug>CamelCaseMotion_iw
omap <silent> ib <Plug>CamelCaseMotion_ib
xmap <silent> ib <Plug>CamelCaseMotion_ib
omap <silent> ie <Plug>CamelCaseMotion_ie
xmap <silent> ie <Plug>CamelCaseMotion_ie



" VIM-commentary
autocmd FileType vue setlocal commentstring=//\ %s



" COC
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

function! FindCursorPopUp()
  let radius = get(a:000, 0, 2)
  let srow = screenrow()
  let scol = screencol()
  " it's necessary to test entire rect, as some popup might be quite small
  for r in range(srow - radius, srow + radius)
    for c in range(scol - radius, scol + radius)
      let winid = popup_locate(r, c)
      if winid != 0
        return winid
      endif
    endfor
  endfor

  return 0
endfunction

function! ScrollPopUp(down)
  let winid = FindCursorPopUp()
  if winid == 0
    return 0
  endif

  let pp = popup_getpos(winid)
  call popup_setoptions( winid,
        \ {'firstline' : pp.firstline + ( a:down ? 1 : -1 ) } )

  return 1
endfunction

nnoremap <expr> <space> ScrollPopUp(1) ? '<esc>' : '<space>'
nnoremap <expr> <C-@> ScrollPopUp(0) ? '<esc>' : '<C-@>'

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

hi Pmenu ctermfg=NONE ctermbg=236 cterm=NONE guifg=NONE guibg=#64666d gui=NONE
hi PmenuSel ctermfg=NONE ctermbg=24 cterm=NONE guifg=NONE guibg=#204a87 gui=NONE

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt :call CocAction('jumpDefinition', 'vsplit')<CR>
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gj <Plug>(coc-diagnostic-next)
nmap <silent> gk <Plug>(coc-diagnostic-prev)
nmap <silent> gf :CocCommand eslint.executeAutofix<CR>


" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif


" coc extensions
let g:coc_global_extensions = [
  \ 'coc-tslint-plugin',
  \ 'coc-eslint',
  \ 'coc-tsserver',
  \ 'coc-emmet',
  \ 'coc-css',
  \ 'coc-html',
  \ 'coc-json',
  \ 'coc-yank',
  \ 'coc-prettier',
  \ ]



" EasyMotion
let g:EasyMotion_do_mapping = 0 " Disable default mappings
let g:EasyMotion_smartcase = 1
nmap s <Plug>(easymotion-s)
" nmap a <Plug>(easymotion-s2)
nmap t <Plug>(easymotion-bd-tl)

map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

let g:EasyMotion_startofline = 0 " keep cursor column when JK motion
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
" These `n` & `N` mappings are optional. You do not have to map `n` & `N` to EasyMotion.
" Without these mappings, `n` & `N` works fine. (These mappings just provide
" different highlight method and have some other features )
map n <Plug>(easymotion-next)
map N <Plug>(easymotion-prev)



" SexyScroller
let g:SexyScroller_ScrollTime = 10
let g:SexyScroller_CursorTime = 5
let g:SexyScroller_MaxTime = 300
let g:SexyScroller_EasingStyle = 3
let g:SexyScroller_DetectPendingKeys = 1



" Maximizer
set winminwidth=0
set winminheight=0
noremap <silent> <Leader>m :MaximizerToggle!<CR>



" ALE
" let g:ale_enabled = 0
" let b:ale_linter_aliases = ['javascript', 'vue']
" let g:airline#extensions#ale#enabled = 1
" let g:ale_lint_on_insert_leave = 0
" let g:ale_lint_on_text_change = 'never'
" let g:ale_lint_on_filetype_changed = 0
" let g:ale_lint_on_enter = 0
" let g:ale_lint_on_save = 0
" let g:ale_sign_error = '✖'
" let g:ale_sign_warning = '!'
" let g:ale_sign_column_always = 0
" nnoremap <leader>ll :ALEToggle<CR>:ALELint<CR>
" nmap <leader>lj :ALENext<cr>
" nmap <leader>lk :ALEPrevious<cr>



" FZF
" An action can be a reference to a function that processes selected lines
function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

let g:fzf_action = {
  \ 'ctrl-a': 'vsplit',
  \ 'ctrl-z': 'split',
  \ 'ctrl-q': function('s:build_quickfix_list') }
nmap <leader><tab> <plug>(fzf-maps-n)
nnoremap <silent> <leader>f :Files<CR>
nnoremap <leader>a :execute 'Ag ' . input('Ag/')<CR>
let $FZF_DEFAULT_OPTS = '--bind ctrl-a:select-all'
" let g:fzf_layout = { 'down': '~41%' }
let g:fzf_preview_window = [ 'right:50%', 'ctrl-/' ]



" Easy Align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
