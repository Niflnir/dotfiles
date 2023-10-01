return {
  'nvim-tree/nvim-tree.lua',
  dependencies = {
    "kyazdani42/nvim-web-devicons"
  },
  keys = {
    {
      '<leader>e', '<cmd>NvimTreeToggle<CR>', 
      mode = 'n',

      {
        noremap = true,
        silent = true
      }
    }
  },
  config = function() 
    require("nvim-tree").setup({
      sort_by = "case_sensitive",
      view = {
        width = 30,
      },
      renderer = {
        group_empty = true,
      },
      filters = {
        dotfiles = true,
      },
    })
  end
}
