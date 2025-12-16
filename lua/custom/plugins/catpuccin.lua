return {
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000, -- load early
    config = function()
      require('catppuccin').setup {
        flavour = 'mocha', -- latte, frappe, macchiato, mocha
        auto_integrations = true, -- auto-detect integrations :contentReference[oaicite:1]{index=1}
      }

      vim.cmd.colorscheme 'catppuccin'
    end,
  },
}
