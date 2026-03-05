-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'folke/ts-comments.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    enabled = vim.fn.has 'nvim-0.10.0' == 1,
    init = function()
      vim.api.nvim_create_autocmd('FileType', {
        pattern = 'vue',
        callback = function()
          if vim.bo.commentstring == '' then
            vim.bo.commentstring = '<!-- %s -->'
          end
        end,
      })
    end,
    opts = {
      lang = {
        vue = {
          '<!-- %s -->',
          script_element = '// %s',
          style_element = '/* %s */',
        },
      },
    },
    keys = {
      { '<C-S-/>', 'gcc', mode = 'n', remap = true, desc = 'Toggle comment line' },
      { '<C-S-/>', 'gc', mode = 'x', remap = true, desc = 'Toggle comment selection' },
      { '<C-_>', 'gcc', mode = 'n', remap = true, desc = 'Toggle comment line' },
      { '<C-_>', 'gc', mode = 'x', remap = true, desc = 'Toggle comment selection' },
    },
  },
}
