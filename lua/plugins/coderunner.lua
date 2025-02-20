return {
    { -- Code Runner
    'CRAG666/code_runner.nvim',
    opts = {
      filetype = {
        go = 'go run $file',

        typescript = 'ts-node $file',
        -- fixing python >> python3
        python = 'python3 -u',
        rust = {
          -- Default is rustc <file>... this creates an executable in the current dir
          'cargo run',
        },
      },
      mode = 'term',
    },
  }
}