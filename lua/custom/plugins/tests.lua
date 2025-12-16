return {
  'nvim-neotest/neotest',
  dependencies = {
    'nvim-neotest/nvim-nio',
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
    'antoinemadec/FixCursorHold.nvim',
    -- 'thenbe/neotest-playwright',
    'marilari88/neotest-vitest',
  },
  config = function()
    -- local binary_path = '/Users/omar/dev/ranamono'
    local neotest = require 'neotest'

    neotest.setup {
      adapters = {
        -- Playwright
        -- require('neotest-playwright').adapter {
        --   options = {
        --     persist_project_selection = true,
        --     enable_dynamic_test_discovery = true,
        --     get_playwright_binary = function()
        --       return binary_path .. '/node_modules/.bin/playwright'
        --     end,
        --   },
        -- },

        -- Vitest
        require 'neotest-vitest' {
          vitestCommand = 'pnpm vitest',
          vitestConfigFile = 'vitest.config.ts',
        },
      },
    }

    -- Keymaps (same as before)
    vim.keymap.set('n', '<leader>tn', function()
      neotest.run.run()
    end, { desc = 'Neotest: run nearest' })

    vim.keymap.set('n', '<leader>tf', function()
      neotest.run.run(vim.fn.expand '%')
    end, { desc = 'Neotest: run file' })

    vim.keymap.set('n', '<leader>ts', function()
      neotest.summary.toggle()
    end, { desc = 'Neotest: toggle summary' })

    vim.keymap.set('n', '<leader>to', function()
      neotest.output.open { enter = true }
    end, { desc = 'Neotest: open output' })
  end,
}
