local ls = require 'luasnip'
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node

ls.add_snippets('javascript', {
  s('cl', {
    t 'console.log(',
    i(1),
    t ');',
  }),
})

ls.filetype_extend('typescript', { 'javascript' })
ls.filetype_extend('javascriptreact', { 'javascript' })
ls.filetype_extend('typescriptreact', { 'javascript' })
