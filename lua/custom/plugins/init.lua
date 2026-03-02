-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'folke/ts-comments.nvim',
    event = 'VeryLazy',
    enabled = vim.fn.has 'nvim-0.10.0' == 1,
    opts = {},
    keys = {
      { '<C-S-/>', 'gcc', mode = 'n', remap = true, desc = 'Toggle comment line' },
      { '<C-S-/>', 'gc', mode = 'x', remap = true, desc = 'Toggle comment selection' },
    },
  },
}
