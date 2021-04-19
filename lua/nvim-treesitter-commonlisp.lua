local query = require"vim.treesitter.query"

query.add_predicate("cl-standard-function?", function(match, pattern, bufnr, predicate)
  local lisp_symbols = require'nvim-treesitter-commonlisp.standard-functions'
  local node = match[predicate[2]]
  local node_text = query.get_node_text(node, bufnr)
  return lisp_symbols[node_text:lower()] ~= nil
end)

query.add_predicate("cl-standard-macro?", function(match, pattern, bufnr, predicate)
  local lisp_symbols = require'nvim-treesitter-commonlisp.standard-macros'
  local node = match[predicate[2]]
  local node_text = query.get_node_text(node, bufnr)
  return lisp_symbols[node_text:lower()] ~= nil
end)

--query.add_predicate("alexandria-standard-function?", function(match, pattern, bufnr, predicate)
  --local lisp_symbols = require'nvim-treesitter-commonlisp.alexandria-functions'
  --local node = match[predicate[2]]
  --local node_text = query.get_node_text(node, bufnr)
  --return lisp_symbols[node_text:lower()] ~= nil
--end)

--query.add_predicate("alexandria-standard-macro?", function(match, pattern, bufnr, predicate)
  --local lisp_symbols = require'nvim-treesitter-commonlisp.alexandria-macros'
  --local node = match[predicate[2]]
  --local node_text = query.get_node_text(node, bufnr)
  --return lisp_symbols[node_text:lower()] ~= nil
--end)
