" Install vim-plug if we don't already have it {{{
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" }}}

" general {{{
set updatetime=250 "time to wait after stop typing before trigger plugins default:4000
set foldmethod=marker
set foldlevelstart=99 " don't fold when opening a file
" }}}

"plugins {{{
call plug#begin('~/.vim/plugged')
Plug 'tmhedberg/SimpylFold' "folding for python
Plug 'tpope/vim-fugitive' "git wrapper
Plug 'airblade/vim-gitgutter' "git show changed lines
Plug 'vim-airline/vim-airline' "status bar
Plug 'scrooloose/nerdtree' "file explorer
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' } "code-completion
Plug 'scrooloose/syntastic' "syntax checker
Plug 'tpope/vim-unimpaired' "bracket mappings
Plug 'ntpeters/vim-better-whitespace'
call plug#end()
" }}}

" python folding {{{
let g:SimpylFold_docstring_preview = 1
" }}}

" code completion {{{
map <F3> :YcmCompleter GoToDefinitionElseDeclaration<CR>
" }}}

" syntax checker {{{
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '!'
let g:syntastic_style_error_symbol = '~'
let g:syntastic_style_warning_symbol = '~'
" }}}

" Toggle spell check {{{
nmap <silent> <F7> :call ToggleSpell()<CR>

let g:myLangList=["nospell","en_us", "de_ch"]
function! ToggleSpell()
  if !exists( "b:myLang" )
    if &spell
      let b:myLang=index(g:myLangList, &spelllang)
    else
      let b:myLang=0
    endif
  endif
  let b:myLang=b:myLang+1
  if b:myLang>=len(g:myLangList) | let b:myLang=0 | endif
  if b:myLang==0
    setlocal nospell
  else
    execute "setlocal spell spelllang=".get(g:myLangList, b:myLang)
  endif
endfunction
" }}}
