" Dark Vim color scheme using Open Color v1.1.0
" (https://yeun.github.io/open-color/)
" Maintainer: Chayoung You <yousbe@gmail.com>
" URL: https://github.com/yous/vim-open-color
" Version: 1.0.0
" License: The MIT License (MIT)

let s:save_cpo = &cpo
set cpo&vim

" Returns an approximate gray index for the given gray level
function! s:GrayNumber(x)
  if &t_Co == 88
    if a:x < 23
      return 0
    elseif a:x < 69
      return 1
    elseif a:x < 103
      return 2
    elseif a:x < 127
      return 3
    elseif a:x < 150
      return 4
    elseif a:x < 173
      return 5
    elseif a:x < 196
      return 6
    elseif a:x < 219
      return 7
    elseif a:x < 243
      return 8
    else
      return 9
    endif
  else
    if a:x < 14
      return 0
    else
      let l:n = (a:x - 8) / 10
      let l:m = (a:x - 8) % 10
      if l:m < 5
        return l:n
      else
        return l:n + 1
      endif
    endif
  endif
endfunction

" Returns the actual gray level represented by the gray index
function! s:GrayLevel(n)
  if &t_Co == 88
    return [0, 46, 92, 115, 139, 162, 185, 208, 231, 235][a:n]
  else
    if a:n == 0
      return 0
    else
      return a:n * 10 + 8
    endif
  endif
endfunction

" Returns the palette index for the given gray index
function! s:GrayColor(n)
  if &t_Co == 88
    if a:n == 0
      return 16
    elseif a:n == 9
      return 79
    else
      return 79 + a:n
    endif
  else
    if a:n == 0
      return 16
    elseif a:n == 25
      return 231
    else
      return 231 + a:n
    endif
  endif
endfunction

" Returns an approximate color index for the given color level
function! s:RgbNumber(x)
  if &t_Co == 88
    if a:x < 69
      return 0
    elseif a:x < 172
      return 1
    elseif a:x < 230
      return 2
    else
      return 3
    endif
  else
    if a:x < 75
      return 0
    else
      let l:n = (a:x - 55) / 40
      let l:m = (a:x - 55) % 40
      if l:m < 20
        return l:n
      else
        return l:n + 1
      endif
    endif
  endif
endfunction

" Returns the actual color level for the given color index
function! s:RgbLevel(n)
  if &t_Co == 88
    return [0, 139, 205, 255][a:n]
  else
    if a:n == 0
      return 0
    else
      return a:n * 40 + 55
    endif
  endif
endfunction

" Returns the palette index for the given R, G, B color indices
function! s:RgbColor(x, y, z)
  if &t_Co == 88
    return 16 + a:x * 16 + a:y * 4 + a:z
  else
    return 16 + a:x * 36 + a:y * 6 + a:z
  endif
endfunction

" Returns the palette index to approximate the 'rrggbb' hex string
function! s:RgbTo256(rgb)
  let l:r = str2nr(strpart(a:rgb, 0, 2), 16)
  let l:g = str2nr(strpart(a:rgb, 2, 2), 16)
  let l:b = str2nr(strpart(a:rgb, 4, 2), 16)

  " Get the closest gray
  let l:gx = s:GrayNumber(l:r)
  let l:gy = s:GrayNumber(l:g)
  let l:gz = s:GrayNumber(l:b)

  " Get the closest color
  let l:x = s:RgbNumber(l:r)
  let l:y = s:RgbNumber(l:g)
  let l:z = s:RgbNumber(l:b)

  if l:gx == l:gy && l:gy == l:gz
    " There are two possibilities
    let l:dgr = s:GrayLevel(l:gx) - l:r
    let l:dgg = s:GrayLevel(l:gy) - l:g
    let l:dgb = s:GrayLevel(l:gz) - l:b
    let l:dgrey = l:dgr * l:dgr + l:dgg * l:dgg + l:dgb * l:dgb
    let l:dr = s:RgbLevel(l:gx) - l:r
    let l:dg = s:RgbLevel(l:gy) - l:g
    let l:db = s:RgbLevel(l:gz) - l:b
    let l:drgb = l:dr * l:dr + l:dg * l:dg + l:db * l:db
    if l:dgrey < l:drgb
      " Use the gray
      return s:GrayColor(l:gx)
    else
      " Use the color
      return s:RgbColor(l:x, l:y, l:z)
    endif
  else
    " Only one possibility
    return s:RgbColor(l:x, l:y, l:z)
  endif
endfunction

function! s:Hi(item, fg, bg)
  if !empty(a:fg)
    if a:fg !=# 'NONE'
      let l:fg_256 = s:RgbTo256(a:fg)
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
      let l:bg_256 = s:RgbTo256(a:bg)
      let l:bg_gui = printf('#%s', a:bg)
    else
      let l:bg_256 = a:bg
      let l:bg_gui = a:bg
    endif
    execute printf('highlight %s ctermbg=%s guibg=%s',
          \ a:item, l:bg_256, l:bg_gui)
  endif
endfunction

if !exists('s:oc')
  let s:oc = {}
  let s:oc['white'] = 'ffffff'
  let s:oc['black'] = '000000'
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
endif

highlight clear
if exists('g:syntax_on')
  syntax reset
endif

if has('gui_running') || &t_Co == 88 || &t_Co == 256
  " :help group-name
  " :help highlight-groups
  call s:Hi('Normal', s:oc['gray'][2], s:oc['gray'][8])
  call s:Hi('LineNr', s:oc['gray'][6], '')
  call s:Hi('Visual', '', s:oc['gray'][6])
  call s:Hi('VisualNOS', '', s:oc['gray'][6])

  call s:Hi('Comment', s:oc['gray'][6], '')

  call s:Hi('Constant', s:oc['yellow'][4], '')
  call s:Hi('String', s:oc['lime'][4], '')
  call s:Hi('Character', s:oc['orange'][4], '')
  call s:Hi('Number', s:oc['orange'][4], '')
  call s:Hi('Boolean', s:oc['orange'][4], '')
  call s:Hi('Float', s:oc['orange'][4], '')

  call s:Hi('Identifier', s:oc['yellow'][2], '')

  call s:Hi('Statement', s:oc['violet'][2], '')
  call s:Hi('Conditional', s:oc['indigo'][5], '')
  call s:Hi('Repeat', s:oc['indigo'][5], '')
  call s:Hi('Operator', s:oc['cyan'][2], '')

  call s:Hi('PreProc', s:oc['violet'][2], '')

  call s:Hi('Type', s:oc['cyan'][2], '')

  call s:Hi('Special', s:oc['yellow'][2], '')
  call s:Hi('Delimiter', s:oc['gray'][2], '')
  call s:Hi('StringDelimiter', s:oc['gray'][2], '')

  call s:Hi('Underlined', s:oc['cyan'][2], '')

  call s:Hi('Error', s:oc['gray'][2], s:oc['red'][5])

  call s:Hi('Todo', s:oc['gray'][9], s:oc['lime'][4])

  " set textwidth=80 colorcolumn+=1
  call s:Hi('ColorColumn', '', s:oc['gray'][9])

  " set cursorline
  call s:Hi('CursorLine', '', s:oc['gray'][9])
  call s:Hi('CursorLineNr', s:oc['yellow'][2], s:oc['gray'][9])
  " set cursorcolumn
  call s:Hi('CursorColumn', '', s:oc['gray'][9])
  highlight CursorLine cterm=NONE
  highlight CursorLineNr cterm=NONE

  call s:Hi('Directory', s:oc['indigo'][5], '')

  call s:Hi('DiffAdd', 'NONE', s:oc['lime'][4])
  call s:Hi('DiffDelete', 'NONE', s:oc['red'][5])
  call s:Hi('DiffChange', 'NONE', s:oc['indigo'][5])
  call s:Hi('DiffText', 'NONE', s:oc['cyan'][2])
  call s:Hi('diffAdded', s:oc['lime'][4], '')
  call s:Hi('diffRemoved', s:oc['red'][5], '')

  call s:Hi('VertSplit', s:oc['gray'][9], s:oc['gray'][9])

  call s:Hi('Folded', s:oc['gray'][6], s:oc['gray'][8])
  " set foldcolumn=1
  call s:Hi('FoldColumn', s:oc['gray'][6], s:oc['gray'][8])
  call s:Hi('MatchParen', '', s:oc['gray'][6])

  " -- INSERT --
  call s:Hi('ModeMsg', s:oc['gray'][2], '')
  call s:Hi('MoreMsg', s:oc['lime'][4], '')
  " Search hit bottom
  call s:Hi('WarningMsg', s:oc['red'][5], '')

  " let &showbreak = '> '
  call s:Hi('NonText', s:oc['gray'][6], '')

  " Popup menu
  call s:Hi('Pmenu', s:oc['gray'][2], s:oc['gray'][9])
  call s:Hi('PmenuSel', s:oc['gray'][9], s:oc['gray'][2])
  call s:Hi('PmenuSbar', '', s:oc['gray'][6])
  call s:Hi('PmenuThumb', '', s:oc['gray'][2])

  call s:Hi('Search', s:oc['gray'][9], s:oc['yellow'][2])
  " call s:Hi('IncSearch', '', '')

  " :map, listchars
  call s:Hi('SpecialKey', s:oc['gray'][9], '')

  call s:Hi('StatusLine', s:oc['gray'][9], s:oc['lime'][4])
  call s:Hi('StatusLineNC', s:oc['gray'][9], s:oc['gray'][6])
  call s:Hi('TabLineFill', s:oc['gray'][9], '')
  call s:Hi('TabLineSel', s:oc['gray'][8], s:oc['gray'][6])
  call s:Hi('TabLine', s:oc['gray'][6], s:oc['gray'][9])
  call s:Hi('WildMenu', s:oc['gray'][9], s:oc['lime'][4])

  call s:Hi('Conceal', s:oc['gray'][6], s:oc['gray'][9])
  call s:Hi('Ignore', s:oc['gray'][6], s:oc['gray'][8])

  " vim-gitgutter
  call s:Hi('GitGutterAdd', s:oc['lime'][4], '')
  call s:Hi('GitGutterChange', s:oc['orange'][4], '')
  call s:Hi('GitGutterDelete', s:oc['red'][5], '')
  call s:Hi('GitGutterChangeDelete', s:oc['orange'][4], '')

  " vim-ruby
  call s:Hi('rubyClass', s:oc['violet'][2], '')
  call s:Hi('rubyRegexp', s:oc['lime'][4], '')
  call s:Hi('rubyRegexpDelimiter', s:oc['lime'][4], '')
  call s:Hi('rubyArrayDelimiter', s:oc['gray'][2], '')
  call s:Hi('rubyBlockParameterList', s:oc['gray'][2], '')
  call s:Hi('rubyCurlyBlockDelimiter', s:oc['gray'][2], '')
  call s:Hi('rubyInterpolationDelimiter', s:oc['orange'][4], '')
  " ARGV, $stdout
  call s:Hi('rubyPredefinedIdentifier', s:oc['red'][5], '')
endif

let g:colors_name = 'open-color'
let &background = 'dark'

let &cpo = s:save_cpo
unlet s:save_cpo