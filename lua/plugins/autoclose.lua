return {
    {
    -- autoclose brackets
    'm4xshen/autoclose.nvim',
    opts = {
      options = {
        disabled_filetypes = {},
      },
      -- commenting this out because it was breaking html autoclose tag plugins
      -- keys = {
      --   ['<'] = {
      --     -- autoclose < > setup
      --     escape = false,
      --     close = true,
      --     pair = '<>',
      --     disabled_filetypes = {},
      --   },
      -- },
    },
    },
  { --auto close html tags
    'windwp/nvim-ts-autotag',
    opts = {},
  }
}