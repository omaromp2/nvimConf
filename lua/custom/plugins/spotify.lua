return {
  'stsewd/spotify.nvim',
  build = ':UpdateRemotePlugins', -- needed for python remote plugin
  dependencies = {
    -- Optional but nice: fancy notifications
    'rcarriga/nvim-notify',
  },
  cmd = { 'Spotify' },
  keys = {
    { '<leader>ms', '<cmd>Spotify play/pause<CR>', desc = 'Spotify play/pause' },
    { '<leader>mj', '<cmd>Spotify next<CR>', desc = 'Spotify next' },
    { '<leader>mk', '<cmd>Spotify prev<CR>', desc = 'Spotify prev' },
    { '<leader>mo', '<cmd>Spotify show<CR>', desc = 'Spotify show window' },
    { '<leader>mc', '<cmd>Spotify status<CR>', desc = 'Spotify status' },
  },
  config = function()
    -- Basic setup (you can tweak this later)
    require('spotify').setup {
      notify_after_action = true,
      notification = {
        backend = 'auto', -- "builtin", "notify", "snacks", or "auto"
      },
    }
  end,
}
