return {
  'akinsho/toggleterm.nvim',
  version = '*',
  config = function()
    require('toggleterm').setup {
      size = 20,
      open_mapping = [[<C-\>]], -- Ctrl+\ toggles terminal
      shade_terminals = true,
      start_in_insert = true,
      persist_mode = false,
      direction = 'float', -- <<< key part: use floating window
      float_opts = {
        border = 'rounded',
      },
    }
  end,
}
