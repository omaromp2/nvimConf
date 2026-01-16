return {
  'nvim-neotest/neotest',
    dependencies = {
      'marilari88/neotest-vitest',
      'nvim-lua/plenary.nvim',
      'nvim-neotest/nvim-nio',
    },
  config = function()
    require('neotest').setup {
      adapters = {
         require 'neotest-vitest' {
           vitestCommand = "npx vitest",
           vitestConfigFile = "vitest.config.ts",
           cwd = vim.fn.getcwd(),
         },
      },
    }
  end,
  keys = {
    {
      '<leader>tn',
      function()
        require('neotest').run.run()
      end,
      desc = 'Run nearest test',
    },
    {
      '<leader>tf',
      function()
        require('neotest').run.run(vim.fn.expand '%')
      end,
      desc = 'Run file tests',
    },
    {
      '<leader>ta',
      function()
        require('neotest').run.run { suite = true }
      end,
      desc = 'Run all tests',
    },
     {
       '<leader>ts',
       function()
         require('neotest').summary.toggle()
       end,
       desc = 'Toggle test summary',
     },
     {
       '<leader>to',
       function()
         require('neotest').output_panel.toggle()
       end,
       desc = 'Toggle test output',
     },
  },
}

