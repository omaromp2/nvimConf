return {
  'mg979/vim-visual-multi',
  branch = 'master',
  init = function()
    -- Use Ctrl+d like VS Code
    vim.g.VM_maps = {
      ['Find Under'] = '<C-d>',
      ['Find Subword Under'] = '<C-d>',
    }
  end,
}
