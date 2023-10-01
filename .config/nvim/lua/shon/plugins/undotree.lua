return {
  'mbbill/undotree',
  lazy = false,
  keys = {
    {
      '<leader>u', '<cmd>UndoTreeToggle<CR>',
      mode = 'n',

      {
        noremap = true,
        silent = true
      }
    }
  }
}
