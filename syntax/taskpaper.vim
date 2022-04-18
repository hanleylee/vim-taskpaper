" Vim syntax file
" Language:	Taskpaper (http://hogbaysoftware.com/projects/taskpaper)
" Maintainer:	David O'Callaghan <david.ocallaghan@cs.tcd.ie>
" URL:		https://github.com/davidoc/taskpaper.vim
" Last Change:  2012-03-07

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

if version < 508
  command! -nargs=+ HiLink hi link <args>
else
  command! -nargs=+ HiLink hi def link <args>
endif

" Define tag styles
if !exists('g:task_paper_styles')
    let g:task_paper_styles = {'FAIL': 'guibg=Red guifg=White'}
endif

syn case ignore

syn match TaskPaperNote         /^.*$/ contains=TaskPaperURL
syn match TaskPaperProject      /^.\+:\(\s\+@[^ \t(]\+\(([^)]*)\)\?\)*$/ contains=taskpaperContext
syn match TaskPaperListItem     /^\t*-\s\+/ contains=TaskPaperURL
syn match TaskPaperContext      /\s\zs@[^ \t(]\+\(([^)]*)\)\?/
syn match TaskPaperToday        /@due(today)/
syn match TaskPaperUrgent       /@urgent/
syn match TaskPaperDone         /^.*\s@done\(\(\s\|([^)]*)\).*\)\?$/
syn match TaskPaperCancelled    /^.*\s@cancelled\(\(\s\|([^)]*)\).*\)\?$/
syn match TaskPaperURL          /https\?:\/\/\(\w\+\(:\w\+\)\?@\)\?\([A-Za-z0-9][-_0-9A-Za-z]*\.\)\{1,}\(\w\{2,}\.\?\)\{1,}\(:[0-9]\{1,5}\)\?[^] \t]*/

syn sync fromstart

"highlighting for Taskpaper groups
HiLink TaskPaperProject         Keyword
HiLink TaskPaperListItem        Identifier
HiLink TaskPaperNote            Comment
HiLink TaskPaperToday           Todo
HiLink TaskPaperUrgent          Error
HiLink TaskPaperDone            Comment
HiLink TaskPaperCancelled       Comment
HiLink TaskPaperContext         Operator
HiLink TaskPaperURL             mkdLink

call taskpaper#tag_style_dict(g:task_paper_styles)

let b:current_syntax = 'taskpaper'

delcommand HiLink
" vim: ts=8
