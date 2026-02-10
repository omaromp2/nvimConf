-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'numToStr/Comment.nvim',
    event = 'VeryLazy',
    opts = {
      -- Add-comment operator mappings for gcc-style commenting
      mappings = {
        basic = true,
        extra = false,
      },
    },
    keys = {
      { '<C-S-/>', function()
        require('Comment.api').toggle.linewise.current()
      end, mode = 'n', desc = 'Toggle comment line' },
      { '<C-S-/>', function()
        require('Comment.api').toggle.linewise(vim.fn.visualmode())
      end, mode = 'v', desc = 'Toggle comment selection' },
    },
  },
}
