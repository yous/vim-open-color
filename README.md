# open-color.vim

[![Build Status](https://travis-ci.org/yous/vim-open-color.svg?branch=master)](https://travis-ci.org/yous/vim-open-color)

Vim color scheme using [Open Color](https://yeun.github.io/open-color/).
Conversion from original colors to 256 colors has done according to
[CIEDE2000](https://en.wikipedia.org/wiki/Color_difference). See
[the implementation](https://gist.github.com/yous/6907d5ee01c237b9849ab005a13cf621).

## Demo

The previews are generated based on the latest master branch.

- [Dark GUI](https://yous.github.io/vim-open-color/dark_gui.html)
- [Light GUI](https://yous.github.io/vim-open-color/light_gui.html)
- [Dark 256 colors](https://yous.github.io/vim-open-color/dark_256.html)
- [Light 256 colors](https://yous.github.io/vim-open-color/light_256.html)

## Screenshots

### GUI

<img width="710" alt="open-color.vim with dark background in GUI" src="https://github.com/yous/vim-open-color/raw/master/screenshots/dark_gui.png">
<img width="710" alt="open-color.vim with light background in GUI" src="https://github.com/yous/vim-open-color/raw/master/screenshots/light_gui.png">

### 256-color

<img width="710" alt="open-color.vim with dark background in 256 colors" src="https://github.com/yous/vim-open-color/raw/master/screenshots/dark_256.png">
<img width="710" alt="open-color.vim with light background in 256 colors" src="https://github.com/yous/vim-open-color/raw/master/screenshots/light_256.png">

## Installation

- [Pathogen](https://github.com/tpope/vim-pathogen)
    1. `cd ~/.vim/bundle`
    2. `git clone https://github.com/yous/vim-open-color.git`
- [Vundle](https://github.com/VundleVim/Vundle.vim)
    1. Add `Plugin 'yous/vim-open-color'` to `.vimrc`
    2. Run `:PluginInstall`
- [NeoBundle](https://github.com/Shougo/neobundle.vim)
    1. Add `NeoBundle 'yous/vim-open-color'` to `.vimrc`
    2. Run `:NeoBundleInstall`
- [vim-plug](https://github.com/junegunn/vim-plug)
    1. Add `Plug 'yous/vim-open-color'` to `.vimrc`
    2. Run `:PlugInstall`

## Usage

1. Check your terminal.
    - If your terminal emulator [supports true colors](https://gist.github.com/XVilka/8346728),
      add the following lines to your `.vimrc`.

      ``` vim
      " Use 24-bit (true-color) mode in Vim/Neovim when outside tmux or screen.
      " If you're using tmux version 2.2 or later, you can remove the outermost $TMUX
      " check and use tmux's 24-bit color support
      " (http://sunaku.github.io/tmux-24bit-color.html#usage for more information.)
      if empty($TMUX) && empty($STY)
        " See https://gist.github.com/XVilka/8346728.
        if $COLORTERM =~# 'truecolor' || $COLORTERM =~# '24bit'
          if has('termguicolors')
            " See :help xterm-true-color
            if $TERM =~# '^screen'
              let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
              let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
            endif
            set termguicolors
          endif
        endif
      endif
      ```
    - To use 256-color mode, set your `$TERM` as `*-256color` or add
      `set t_Co=256` in your `.vimrc`.
2. Enable open-color color scheme:

   ``` vim
   colorscheme open-color
   ```

## License

Copyright © Chayoung You. See [LICENSE.txt](LICENSE.txt) for details.
