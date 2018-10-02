# open-color.vim

Dark Vim color scheme using [Open Color](https://yeun.github.io/open-color/).

## Screenshots

### GUI

<img width="710" alt="open-color.vim in GUI" src="https://github.com/yous/vim-open-color/raw/master/screenshot_gui.png">

### 256-color

<img width="710" alt="open-color.vim in 256 colors" src="https://github.com/yous/vim-open-color/raw/master/screenshot_256.png">

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
    - If your terminal emulator supports 24-bit color, add the following lines
      to your `.vimrc`.

      ``` vim
      " Use 24-bit (true-color) mode in Vim/Neovim when outside tmux or screen.
      " If you're using tmux version 2.2 or later, you can remove the outermost $TMUX
      " check and use tmux's 24-bit color support
      " (<http://sunaku.github.io/tmux-24bit-color.html#usage> for more information.)
      if empty($TMUX) && empty($STY)
        if has('nvim')
          " For Neovim 0.1.3 and 0.1.4 <https://github.com/neovim/neovim/pull/2198>
          let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
        endif
        " For Neovim > 0.1.5 and Vim > patch 7.4.1799
        " <https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162>
        " Based on Vim patch 7.4.1770 (`guicolors` option)
        " <https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd>
        " <https://github.com/neovim/neovim/wiki/Following-HEAD#20160511>
        if has('termguicolors')
          set termguicolors
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

Copyright © 2016 Chayoung You. See [LICENSE.txt](LICENSE.txt) for details.
