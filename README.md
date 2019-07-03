# tabplus.vim

Enhance and extend the functionality of vim native tabs.

## Installation

[vim-plug](https://github.com/junegunn/vim-plug)
```vim
Plug 'quanhengzhuang/vim-tabplus'
```

[Vundle](https://github.com/VundleVim/Vundle.vim)
```vim
Plugin 'quanhengzhuang/vim-tabplus'
```

## Features

* Tab moves: Tab can move forward or backward.
* Tab reopen: Reopen the recently closed tab.
* Tab close: Close one tab, even the last tab. (Vim itself does not support closing the last one)

## Usage

The following shortcuts are recommended.

```vim
map <silent> <leader>u :Tabreopen<CR>
map <silent> <leader>U :Tabclosed<CR>
map <silent> Q :Tabclose<CR>

map <silent> <leader>h :tabprevious<CR>
map <silent> <leader>l :tabnext<CR>
map <silent> <leader>H :TabmovePrevious<CR>
map <silent> <leader>L :TabmoveNext<CR>
```
