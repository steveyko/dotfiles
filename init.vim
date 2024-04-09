set textwidth=100
set nohlsearch
set nocp
set shiftwidth=2
set expandtab
set smarttab
set sts=2
set ts=2
set colorcolumn=101
set number
set timeoutlen=1000 ttimeoutlen=0 "no delay when a key is pressed (mainly for escape)
set mouse=
set shortmess+=S
set ic
set autowriteall
autocmd FileType * set fo+=t
autocmd FileType latex,tex,md,markdown,text setlocal spell
syntax enable

if !exists('g:vscode')
  colorscheme solarized
  set background=dark
  set cursorline
  set noshowmode
  set showtabline=2
  set rtp+=/usr/bin/fzf
  let g:lightline#bufferline#unnamed = '[No Name]'
  let g:lightline#bufferline#enable_devicons = 1
  let g:lightline = {
        \ 'colorscheme': 'solarizedmine',
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'filename', 'modified' ] ],
        \   'right': [ [ 'lineinfo' ], [ 'percent' ], [ 'fileformat', 'fileencoding', 'filetype'],
        \              [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos',
        \                'linter_ok' ] ],
        \ },
        \ 'tabline': { 'left': [ [ 'buffers' ] ], 'right': [ ], },
        \ 'component_expand': {
        \   'buffers': 'lightline#bufferline#buffers',
        \   'linter_checking': 'lightline#ale#checking',
        \   'linter_infos': 'lightline#ale#infos',
        \   'linter_warnings': 'lightline#ale#warnings',
        \   'linter_errors': 'lightline#ale#errors',
        \   'linter_ok': 'lightline#ale#ok',
        \ },
        \ 'component_type': {
        \   'buffers': 'tabsel',
        \   'linter_checking': 'right',
        \   'linter_infos': 'right',
        \   'linter_warnings': 'warning',
        \   'linter_errors': 'error',
        \   'linter_ok': 'right',
        \ }
  \ }
  let g:ale_completion_enabled = 1
  let g:ale_linters = { 'cpp': ['clangtidy', 'clang'], 'c': ['clangtidy', 'clang'],
        \ 'cmake': ['cmake_lint', 'cmake'], 'python': ['flake8'], 'sh': ['shellcheck'],
        \ 'rust': ['analyzer'], 'tex': ['lacheck'] }
  let g:ale_fixers = { 'cpp': ['clang-format'], 'c': ['clang-format'], 'cmake': ['cmakeformat'],
        \ 'rust': ['rustfmt'], 'python': ['autopep8'],
        \ '*': ['remove_trailing_lines', 'trim_whitespace'] }
  let g:ale_rust_cargo_use_clippy = 1
  let g:ale_fix_on_save = 1
  let g:rainbow_active = 1
  let g:sneak#label = 1
  let g:highlightedyank_highlight_duration = 300
  let g:vim_json_conceal = 0
  let g:markdown_syntax_conceal = 0

  function! CleanEmptyBuffers()
    let buffers = filter(range(1, bufnr('$')), 'buflisted(v:val) && empty(bufname(v:val)) && bufwinnr(v:val)<0 && !getbufvar(v:val, "&mod")')
    if !empty(buffers)
        exe 'bw ' . join(buffers, ' ')
    endif
  endfunction
  autocmd BufEnter * call CleanEmptyBuffers()

  lua require('config')
endif
