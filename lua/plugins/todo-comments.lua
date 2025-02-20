return {
    {
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
      -- signs = false,
      highlight = {
        comments_only = false,
      },
    },
  }
}