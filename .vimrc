highlight Statusline ctermfg=gray ctermbg=black
highlight Tabline ctermfg=black ctermbg=gray
highlight TablineSel ctermfg=gray ctermbg=black
nmap n nzz
nmap N Nzz
set background=dark
set encoding=utf-8
set fileencodings=utf-8,eucjp-ms,cp932
set hidden
set hlsearch
set laststatus=2
set list
set listchars=tab:>_,trail:_
set mouse=a
set number
set ruler
set showtabline=2
set smartindent
set statusline=%f\ %m%r%h%w%=%l/%L,%c%V\ %P\ %y\[%{&fenc!=''?&fenc:&enc}]\[%{&ff}]%{bufname('%')!=''?'['.getfperm(bufname('%')).']':''}
set ttymouse=xterm2
set tabline=%!MyTabLine()
syntax on

function MyTabLine()
  let s = '%#TabLineSel#' . $USER . '@' . hostname() . ':' . substitute(getcwd(), '^' . $HOME, '~', '') . ' '
  for i in range(tabpagenr('$'))
    if i + 1 == tabpagenr()
      if i == 0
        let s .= '|'
      else
        let s .= '%#TabLineSel#'
      endif
    else
      let s .= '%#TabLine#'
    endif
    let s .= '%' . (i + 1) . 'T %{MyTabLabel(' . (i + 1) . ')} '
    if i + 1 == tabpagenr()
      if tabpagenr('$') > 1
        let s .= '%999XX'
      endif
    elseif i + 2 != tabpagenr()
      let s .= '|'
    endif
  endfor
  let s .= '%#TabLineFill#%T'
  return s
endfunction
function MyTabLabel(n)
  let buflist = tabpagebuflist(a:n)
  let winnr = tabpagewinnr(a:n)
  return substitute(bufname(buflist[winnr - 1]), '^.*/', '', '')
endfunction
