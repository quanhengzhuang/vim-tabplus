" tabplus.vim
" 2014.7.9 打开关闭的窗口
" 2014.8.9 优化代码，增加命令
" 2014.8.20 增加Tabclose

" Load once
if exists('g:loaded_tabplus')
    finish
endif

let g:loaded_tabplus = 1

" Maps
map <silent> <leader>u :Tabreopen<CR>
map <silent> <leader>U :Tabclosed<CR>
map <silent> Q :Tabclose<CR>

map <silent> <leader>H :TabmovePrevious<CR>
map <silent> <leader>L :TabmoveNext<CR>

" Commands
command! Tabclosed :call ClosedTabView()
command! Tabreopen :call ClosedTabReopen()
command! Tabclose :call Tabplus_Tabclose()
command! TabmoveNext :exe 'tabmove '.(tabpagenr() + 1)
command! TabmovePrevious :exe 'tabmove '.(tabpagenr() - 2)

" Autocmds
autocmd bufwinleave * call ClosedTabAdd()

let g:ClosedTabList = []

function! ClosedTabAdd()
    let g:ClosedTabList = add(g:ClosedTabList, expand('<afile>'))
endfunction

function! ClosedTabReopen()
    if len(g:ClosedTabList) != 0
        exec "tabnew ".remove(g:ClosedTabList, -1)
    else
        echohl WarningMsg | echo "No closed tabs" | echohl None
    endif
endfunction

function! ClosedTabView()
    if len(g:ClosedTabList) == 0
        echohl WarningMsg | echo "No closed tabs" | echohl None
        return
    endif
    let i = 1
    for file in g:ClosedTabList
        echohl Title | echo '['.i.'] '.file | echohl None
        let i = i + 1
    endfor
endfunction

function! ClosedTabDelete()
    if len(g:ClosedTabList) != 0
        call remove(g:ClosedTabList, -1)
    endif
endfunction

" Tab close (especially the last)
function! Tabplus_Tabclose()
    if tabpagenr('$') > 1
        tabclose
    else
        qall
    endif
endfunction
