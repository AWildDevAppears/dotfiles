 vim.cmd[[
    augroup NEOTREE_AUGROUP
      autocmd!
      au VimEnter * lua vim.defer_fn(function() vim.cmd("Neotree show left") end, 10)
    augroup END
  ]]
