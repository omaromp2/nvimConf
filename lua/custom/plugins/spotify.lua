return {
  'stsewd/spotify.nvim',
  build = ':UpdateRemotePlugins', -- needed for python remote plugin
  dependencies = {
    -- Optional but nice: fancy notifications
    'rcarriga/nvim-notify',
  },
  config = function()
    -- Basic setup (you can tweak this later)
    require('spotify').setup {
      notify_after_action = true,
      notification = {
        backend = 'auto', -- "builtin", "notify", "snacks", or "auto"
      },
    }

    -- Keymaps (like in the README)
    local map = vim.keymap.set
    local opts = { silent = true, noremap = true }

    map('n', '<leader>ms', ':Spotify play/pause<CR>', vim.tbl_extend('force', opts, { desc = 'Spotify play/pause' }))
    map('n', '<leader>mj', ':Spotify next<CR>', vim.tbl_extend('force', opts, { desc = 'Spotify next' }))
    map('n', '<leader>mk', ':Spotify prev<CR>', vim.tbl_extend('force', opts, { desc = 'Spotify prev' }))
    map('n', '<leader>mo', ':Spotify show<CR>', vim.tbl_extend('force', opts, { desc = 'Spotify show window' }))
    map('n', '<leader>mc', ':Spotify status<CR>', vim.tbl_extend('force', opts, { desc = 'Spotify status' }))
  end,
}
