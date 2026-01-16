return {
  {
    'mfussenegger/nvim-lint',
    event = 'VeryLazy',
    config = function()
      local lint = require 'lint'
      lint.linters_by_ft = vim.tbl_deep_extend('force', lint.linters_by_ft or {}, {
        php = { 'phpstan', 'phpcs' },
        blade = { 'phpstan', 'phpcs' },
      })
    end,
  },
  {
    'williamboman/mason.nvim',
    opts = {
      ensure_installed = {
        'intelephense',
        'php-cs-fixer',
        'phpstan',
        'blade-formatter',
      },
    },
  },

}
