" Vim color scheme using Open Color
" (https://yeun.github.io/open-color/)
" Maintainer: Chayoung You <yousbe@gmail.com>
" URL: https://github.com/yous/vim-open-color
" Version: 2.3.0
" License: The MIT License (MIT)

let s:save_cpo = &cpoptions
set cpoptions&vim

let s:background = &background

function! s:Hi(item, fg, bg)
  if !empty(a:fg)
    if a:fg !=# 'NONE'
      let l:fg_256 = s:rgb_map[a:fg]
      let l:fg_gui = printf('#%s', a:fg)
    else
      let l:fg_256 = a:fg
      let l:fg_gui = a:fg
    endif
    execute printf('highlight %s ctermfg=%s guifg=%s',
          \ a:item, l:fg_256, l:fg_gui)
  endif
  if !empty(a:bg)
    if a:bg !=# 'NONE'
      let l:bg_256 = s:rgb_map[a:bg]
      let l:bg_gui = printf('#%s', a:bg)
    else
      let l:bg_256 = a:bg
      let l:bg_gui = a:bg
    endif
    execute printf('highlight %s ctermbg=%s guibg=%s',
          \ a:item, l:bg_256, l:bg_gui)
  endif
endfunction

if !exists('s:rgb_map')
  let s:oc = {}
  let s:oc['gray'] = [
        \ 'f8f9fa', 'f1f3f5', 'e9ecef', 'dee2e6', 'ced4da',
        \ 'adb5bd', '868e96', '495057', '343a40', '212529']
  let s:oc['red'] = [
        \ 'fff5f5', 'ffe3e3', 'ffc9c9', 'ffa8a8', 'ff8787',
        \ 'ff6b6b', 'fa5252', 'f03e3e', 'e03131', 'c92a2a']
  let s:oc['pink'] = [
        \ 'fff0f6', 'ffdeeb', 'fcc2d7', 'faa2c1', 'f783ac',
        \ 'f06595', 'e64980', 'd6336c', 'c2255c', 'a61e4d']
  let s:oc['grape'] = [
        \ 'f8f0fc', 'f3d9fa', 'eebefa', 'e599f7', 'da77f2',
        \ 'cc5de8', 'be4bdb', 'ae3ec9', '9c36b5', '862e9c']
  let s:oc['violet'] = [
        \ 'f3f0ff', 'e5dbff', 'd0bfff', 'b197fc', '9775fa',
        \ '845ef7', '7950f2', '7048e8', '6741d9', '5f3dc4']
  let s:oc['indigo'] = [
        \ 'edf2ff', 'dbe4ff', 'bac8ff', '91a7ff', '748ffc',
        \ '5c7cfa', '4c6ef5', '4263eb', '3b5bdb', '364fc7']
  let s:oc['blue'] = [
        \ 'e8f7ff', 'ccedff', 'a3daff', '72c3fc', '4dadf7',
        \ '329af0', '228ae6', '1c7cd6', '1b6ec2', '1862ab']
  let s:oc['cyan'] = [
        \ 'e3fafc', 'c5f6fa', '99e9f2', '66d9e8', '3bc9db',
        \ '22b8cf', '15aabf', '1098ad', '0c8599', '0b7285']
  let s:oc['teal'] = [
        \ 'e6fcf5', 'c3fae8', '96f2d7', '63e6be', '38d9a9',
        \ '20c997', '12b886', '0ca678', '099268', '087f5b']
  let s:oc['green'] = [
        \ 'ebfbee', 'd3f9d8', 'b2f2bb', '8ce99a', '69db7c',
        \ '51cf66', '40c057', '37b24d', '2f9e44', '2b8a3e']
  let s:oc['lime'] = [
        \ 'f4fce3', 'e9fac8', 'd8f5a2', 'c0eb75', 'a9e34b',
        \ '94d82d', '82c91e', '74b816', '66a80f', '5c940d']
  let s:oc['yellow'] = [
        \ 'fff9db', 'fff3bf', 'ffec99', 'ffe066', 'ffd43b',
        \ 'fcc419', 'fab005', 'f59f00', 'f08c00', 'e67700']
  let s:oc['orange'] = [
        \ 'fff4e6', 'ffe8cc', 'ffd8a8', 'ffc078', 'ffa94d',
        \ 'ff922b', 'fd7e14', 'f76707', 'e8590c', 'd9480f']

  let s:oc_256 = {
        \ 'gray': [15, 255, 255, 254, 252, 249, 245, 239, 237, 235],
        \ 'red': [15, 224, 224, 217, 210, 203, 203, 167, 160, 160],
        \ 'pink': [255, 224, 218, 218, 211, 204, 168, 161, 161, 125],
        \ 'grape': [255, 225, 219, 213, 177, 171, 134, 128, 127, 91],
        \ 'violet': [255, 189, 183, 141, 141, 99, 99, 62, 57, 56],
        \ 'indigo': [255, 189, 147, 111, 69, 69, 27, 27, 27, 26],
        \ 'blue': [255, 153, 153, 75, 75, 75, 32, 32, 25, 25],
        \ 'cyan': [195, 195, 116, 80, 45, 38, 38, 31, 31, 6],
        \ 'teal': [195, 158, 122, 79, 43, 43, 36, 36, 29, 29],
        \ 'green': [195, 194, 157, 114, 78, 77, 71, 71, 35, 28],
        \ 'lime': [230, 230, 193, 192, 149, 112, 112, 70, 70, 64],
        \ 'yellow': [230, 230, 229, 221, 220, 220, 214, 214, 208, 208],
        \ 'orange': [255, 223, 223, 215, 215, 208, 208, 202, 166, 166] }

  let s:rgb_map = {}
  for s:color in keys(s:oc)
    for s:number in range(len(s:oc[s:color]))
      let s:rgb_map[s:oc[s:color][s:number]] = s:oc_256[s:color][s:number]
    endfor
  endfor
endif

highlight clear
if exists('g:syntax_on')
  syntax reset
endif

if has('gui_running') || &t_Co == 88 || &t_Co == 256
  if s:background ==# 'dark'
    " :help group-name
    " :help highlight-groups
    call s:Hi('Normal', s:oc['gray'][2], s:oc['gray'][9])
    call s:Hi('LineNr', s:oc['gray'][6], '')
    call s:Hi('Visual', '', s:oc['gray'][8])
    call s:Hi('VisualNOS', '', s:oc['gray'][8])

    " Comment
    call s:Hi('Comment', s:oc['gray'][6], '')

    " Constant
    call s:Hi('Constant', s:oc['yellow'][4], '')
    call s:Hi('String', s:oc['lime'][4], '')
    call s:Hi('Character', s:oc['orange'][4], '')
    call s:Hi('Number', s:oc['orange'][4], '')
    call s:Hi('Boolean', s:oc['orange'][4], '')
    call s:Hi('Float', s:oc['orange'][4], '')

    " Identifier
    call s:Hi('Identifier', s:oc['yellow'][2], '')
    highlight Identifier gui=bold

    " Statement
    call s:Hi('Statement', s:oc['violet'][2], '')
    call s:Hi('Conditional', s:oc['indigo'][3], '')
    call s:Hi('Repeat', s:oc['indigo'][3], '')
    call s:Hi('Operator', s:oc['cyan'][2], '')

    " PreProc
    call s:Hi('PreProc', s:oc['violet'][2], '')

    " Type
    call s:Hi('Type', s:oc['cyan'][2], '')

    " Special
    call s:Hi('Special', s:oc['yellow'][2], '')

    " Underlined
    call s:Hi('Underlined', s:oc['cyan'][2], '')

    " Error
    call s:Hi('Error', s:oc['gray'][2], s:oc['red'][7])

    " Todo
    call s:Hi('Todo', s:oc['gray'][9], s:oc['lime'][4])

    " set textwidth=80 colorcolumn+=1
    call s:Hi('ColorColumn', '', s:oc['gray'][8])

    call s:Hi('Cursor', s:oc['gray'][9], s:oc['gray'][2])

    " set cursorline
    call s:Hi('CursorLine', '', s:oc['gray'][8])
    call s:Hi('CursorLineNr', s:oc['yellow'][2], s:oc['gray'][8])
    " set cursorcolumn
    call s:Hi('CursorColumn', '', s:oc['gray'][8])
    highlight CursorLine cterm=NONE
    highlight CursorLineNr cterm=NONE

    call s:Hi('Directory', s:oc['indigo'][3], '')

    call s:Hi('DiffAdd', 'NONE', s:oc['green'][9])
    call s:Hi('DiffDelete', s:oc['gray'][9], s:oc['red'][5])
    call s:Hi('DiffChange', 'NONE', s:oc['blue'][9])
    call s:Hi('DiffText', 'NONE', s:oc['violet'][9])
    call s:Hi('diffAdded', s:oc['lime'][4], '')
    call s:Hi('diffRemoved', s:oc['red'][5], '')

    call s:Hi('VertSplit', s:oc['gray'][8], s:oc['gray'][6])

    call s:Hi('Folded', s:oc['gray'][6], s:oc['gray'][9])
    " set foldcolumn=1
    call s:Hi('FoldColumn', s:oc['gray'][6], s:oc['gray'][9])
    call s:Hi('MatchParen', '', s:oc['gray'][6])

    " :help error-messages
    call s:Hi('ErrorMsg', s:oc['gray'][2], s:oc['red'][7])
    " -- INSERT --
    call s:Hi('ModeMsg', s:oc['gray'][2], '')
    " -- More --
    call s:Hi('MoreMsg', s:oc['lime'][4], '')
    " Press ENTER or type command to continue
    call s:Hi('Question', s:oc['lime'][4], '')
    " Search hit bottom
    call s:Hi('WarningMsg', s:oc['red'][5], '')

    " let &showbreak = '> '
    call s:Hi('NonText', s:oc['gray'][6], '')

    " Popup menu
    call s:Hi('Pmenu', s:oc['gray'][2], s:oc['gray'][8])
    call s:Hi('PmenuSel', s:oc['gray'][9], s:oc['gray'][2])
    call s:Hi('PmenuSbar', '', s:oc['gray'][6])
    call s:Hi('PmenuThumb', '', s:oc['gray'][2])

    call s:Hi('Search', s:oc['gray'][9], s:oc['yellow'][2])
    " call s:Hi('IncSearch', '', '')

    " :map, listchars
    call s:Hi('SpecialKey', s:oc['gray'][6], '')

    call s:Hi('StatusLine', s:oc['gray'][8], s:oc['lime'][4])
    call s:Hi('StatusLineNC', s:oc['gray'][8], s:oc['gray'][6])
    call s:Hi('TabLineFill', s:oc['gray'][7], '')
    call s:Hi('TabLineSel', s:oc['gray'][2], s:oc['gray'][6])
    call s:Hi('TabLine', s:oc['gray'][6], s:oc['gray'][8])
    call s:Hi('WildMenu', s:oc['gray'][9], s:oc['lime'][4])
    highlight TabLineSel cterm=NONE
    highlight TabLine cterm=NONE

    " :set all
    call s:Hi('Title', s:oc['indigo'][3], '')

    " :set conceallevel=1
    call s:Hi('Conceal', s:oc['gray'][2], s:oc['gray'][8])
    call s:Hi('Ignore', s:oc['gray'][6], s:oc['gray'][9])

    " syntax/ruby.vim
    " .each { |value| ... }
    call s:Hi('rubyBlockParameter', s:oc['yellow'][2], '')
    " ARGV, $stdout
    call s:Hi('rubyPredefinedIdentifier', s:oc['red'][5], '')

    " vim-gitgutter
    call s:Hi('GitGutterAdd', s:oc['lime'][4], '')
    call s:Hi('GitGutterChange', s:oc['yellow'][2], '')
    call s:Hi('GitGutterDelete', s:oc['red'][5], '')
    call s:Hi('GitGutterChangeDelete', s:oc['yellow'][2], '')
  else
    " :help group-name
    " :help highlight-groups
    call s:Hi('Normal', s:oc['gray'][8], s:oc['gray'][1])
    call s:Hi('LineNr', s:oc['gray'][6], '')
    call s:Hi('Visual', '', s:oc['gray'][4])
    call s:Hi('VisualNOS', '', s:oc['gray'][4])

    " Comment
    call s:Hi('Comment', s:oc['gray'][6], '')

    " Constant
    call s:Hi('Constant', s:oc['pink'][6], '')
    call s:Hi('String', s:oc['lime'][8], '')
    call s:Hi('Character', s:oc['orange'][8], '')
    call s:Hi('Number', s:oc['orange'][8], '')
    call s:Hi('Boolean', s:oc['orange'][8], '')
    call s:Hi('Float', s:oc['orange'][8], '')

    " Identifier
    call s:Hi('Identifier', s:oc['yellow'][7], '')
    highlight Identifier cterm=bold gui=bold

    " Statement
    call s:Hi('Statement', s:oc['violet'][6], '')
    call s:Hi('Conditional', s:oc['indigo'][5], '')
    call s:Hi('Repeat', s:oc['indigo'][5], '')
    call s:Hi('Operator', s:oc['cyan'][5], '')

    " PreProc
    call s:Hi('PreProc', s:oc['violet'][6], '')

    " Type
    call s:Hi('Type', s:oc['cyan'][5], '')

    " Special
    call s:Hi('Special', s:oc['yellow'][7], '')

    " Underlined
    call s:Hi('Underlined', s:oc['cyan'][5], '')

    " Error
    call s:Hi('Error', s:oc['gray'][8], s:oc['red'][5])

    " Todo
    call s:Hi('Todo', s:oc['gray'][9], s:oc['lime'][4])

    " set textwidth=80 colorcolumn+=1
    call s:Hi('ColorColumn', '', s:oc['gray'][0])

    call s:Hi('Cursor', s:oc['gray'][1], s:oc['gray'][5])

    " set cursorline
    call s:Hi('CursorLine', '', s:oc['gray'][0])
    call s:Hi('CursorLineNr', s:oc['yellow'][7], s:oc['gray'][0])
    " set cursorcolumn
    call s:Hi('CursorColumn', '', s:oc['gray'][0])
    highlight CursorLine cterm=NONE
    highlight CursorLineNr cterm=NONE

    call s:Hi('Directory', s:oc['indigo'][5], '')

    call s:Hi('DiffAdd', 'NONE', s:oc['lime'][3])
    call s:Hi('DiffDelete', s:oc['gray'][1], s:oc['red'][5])
    call s:Hi('DiffChange', 'NONE', s:oc['indigo'][1])
    call s:Hi('DiffText', 'NONE', s:oc['cyan'][1])
    call s:Hi('diffAdded', s:oc['lime'][8], '')
    call s:Hi('diffRemoved', s:oc['red'][5], '')

    call s:Hi('VertSplit', s:oc['gray'][3], s:oc['gray'][6])

    call s:Hi('Folded', s:oc['gray'][6], s:oc['gray'][1])
    " set foldcolumn=1
    call s:Hi('FoldColumn', s:oc['gray'][6], s:oc['gray'][1])
    call s:Hi('MatchParen', '', s:oc['gray'][3])

    " :help error-messages
    call s:Hi('ErrorMsg', s:oc['gray'][8], s:oc['red'][5])
    " -- INSERT --
    call s:Hi('ModeMsg', s:oc['gray'][8], '')
    " -- More --
    call s:Hi('MoreMsg', s:oc['lime'][8], '')
    " Press ENTER or type command to continue
    call s:Hi('Question', s:oc['lime'][8], '')
    " Search hit bottom
    call s:Hi('WarningMsg', s:oc['red'][7], '')

    " let &showbreak = '> '
    call s:Hi('NonText', s:oc['gray'][6], '')

    " Popup menu
    call s:Hi('Pmenu', s:oc['gray'][8], s:oc['gray'][3])
    call s:Hi('PmenuSel', s:oc['gray'][2], s:oc['gray'][6])
    call s:Hi('PmenuSbar', '', s:oc['gray'][4])
    call s:Hi('PmenuThumb', '', s:oc['gray'][8])

    call s:Hi('Search', s:oc['gray'][9], s:oc['yellow'][3])
    " call s:Hi('IncSearch', '', '')

    " :map, listchars
    call s:Hi('SpecialKey', s:oc['gray'][6], '')

    call s:Hi('StatusLine', s:oc['gray'][4], s:oc['lime'][8])
    call s:Hi('StatusLineNC', s:oc['gray'][4], s:oc['gray'][6])
    call s:Hi('TabLineFill', s:oc['gray'][4], '')
    call s:Hi('TabLineSel', s:oc['gray'][1], s:oc['gray'][6])
    call s:Hi('TabLine', s:oc['gray'][6], s:oc['gray'][2])
    call s:Hi('WildMenu', s:oc['gray'][1], s:oc['lime'][8])
    highlight TabLineSel cterm=NONE
    highlight TabLine cterm=NONE

    " :set all
    call s:Hi('Title', s:oc['indigo'][5], '')

    call s:Hi('Conceal', s:oc['gray'][8], s:oc['gray'][3])
    call s:Hi('Ignore', s:oc['gray'][6], s:oc['gray'][1])

    " syntax/ruby.vim
    " .each { |value| ... }
    call s:Hi('rubyBlockParameter', s:oc['yellow'][7], '')
    " ARGV, $stdout
    call s:Hi('rubyPredefinedIdentifier', s:oc['red'][7], '')

    " vim-gitgutter
    call s:Hi('GitGutterAdd', s:oc['lime'][8], '')
    call s:Hi('GitGutterChange', s:oc['yellow'][7], '')
    call s:Hi('GitGutterDelete', s:oc['red'][7], '')
    call s:Hi('GitGutterChangeDelete', s:oc['yellow'][7], '')
  endif
endif

let g:colors_name = 'open-color'
let &background = s:background

let &cpoptions = s:save_cpo
unlet s:save_cpo
