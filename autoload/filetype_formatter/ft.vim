""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" OriginalAuthor: Samuel Roeca
" Maintainer:     Samuel Roeca samuel.roeca@gmail.com
" Description:    vim-filetype-formatter: your favorite code formatters in Vim
"                 Contains default values for popular code formatters, by
"                 filetype
" License:        MIT License
" Website:        https://github.com/pappasam/vim-filetype-formatter
" License:        MIT
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Dry Helpers: helper functions to reduce repetition
function! s:get_prettier()
  return {->
        \ printf('npx prettier --stdin --stdin-filepath="%s"', expand('%:p'))}
endfunction

" Default Formatters: all pre-configured formatters live in the
" filetype_formatter#ft#formatters variable. Formatters must either be:
"   1) A String
"   2) A function(start: Integer, end: Integer) -> String
"   3) A function() -> String
let g:filetype_formatter#ft#formatters = {}
let g:filetype_formatter#ft#formatters['css']= {
      \ 'prettier': s:get_prettier(),
      \ }
let g:filetype_formatter#ft#formatters['go'] = {
      \ 'gofmt': 'gofmt',
      \ }
let g:filetype_formatter#ft#formatters['html']= {
      \ 'prettier': s:get_prettier(),
      \ }
let g:filetype_formatter#ft#formatters['javascript']= {
      \ 'prettier': s:get_prettier(),
      \ }
let g:filetype_formatter#ft#formatters['json'] = {
      \ 'python.json': 'python3 -c "import json, sys; print(json.dumps(json.load(sys.stdin), indent=2), end=\"\")"',
      \ }
let g:filetype_formatter#ft#formatters['markdown'] = {
      \ 'prettier': s:get_prettier(),
      \ }
let g:filetype_formatter#ft#formatters['python'] = {
      \ 'black': 'black -q -',
      \ 'yapf': {start, end -> printf('yapf --lines=%d-%d', start, end)},
      \ }
let g:filetype_formatter#ft#formatters['rust'] = {
      \ 'rustfmt': 'rustfmt',
      \ }
let g:filetype_formatter#ft#formatters['terraform'] = {
      \ 'terraform fmt': 'terraform fmt -',
      \ }
let g:filetype_formatter#ft#formatters['yaml'] = {
      \ 'prettier': s:get_prettier(),
      \ }

" Defaults: language defaults live in the below dictionary
let g:filetype_formatter#ft#defaults = {
      \ 'css': g:filetype_formatter#ft#formatters['css']['prettier'],
      \ 'go': g:filetype_formatter#ft#formatters['go']['gofmt'],
      \ 'html': g:filetype_formatter#ft#formatters['html']['prettier'],
      \ 'javascript': g:filetype_formatter#ft#formatters['javascript']['prettier'],
      \ 'json': g:filetype_formatter#ft#formatters['json']['python.json'],
      \ 'markdown': g:filetype_formatter#ft#formatters['markdown']['prettier'],
      \ 'python': g:filetype_formatter#ft#formatters['python']['black'],
      \ 'rust': g:filetype_formatter#ft#formatters['rust']['rustfmt'],
      \ 'terraform': g:filetype_formatter#ft#formatters['terraform']['terraform fmt'],
      \ 'yaml': g:filetype_formatter#ft#formatters['yaml']['prettier'],
      \ 'yaml.docker-compose': g:filetype_formatter#ft#formatters['yaml']['prettier'],
      \ }