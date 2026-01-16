return {
  {
    'MeanderingProgrammer/render-markdown.nvim',
    ft = { 'markdown' },
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-mini/mini.nvim', -- you already use mini.nvim
      -- If you prefer devicons instead of mini:
      -- "nvim-tree/nvim-web-devicons",
    },
    opts = {
      -- default is enabled=true; keeping it explicit is nice
      enabled = true,
      file_types = { 'markdown' },

      -- optional: enables checkbox/callout completions via in-process LSP
      completions = { lsp = { enabled = true } },
    },
    config = function(_, opts)
      require('render-markdown').setup(opts)

      -- Simple keybinds (all under <leader>m)
      vim.keymap.set('n', '<leader>mt', '<cmd>RenderMarkdown toggle<CR>', { desc = 'Markdown: toggle render' })
      vim.keymap.set('n', '<leader>mb', '<cmd>RenderMarkdown buf_toggle<CR>', { desc = 'Markdown: toggle (buffer)' })
      vim.keymap.set('n', '<leader>mp', '<cmd>RenderMarkdown preview<CR>', { desc = 'Markdown: preview (side)' })
      vim.keymap.set('n', '<leader>ml', '<cmd>RenderMarkdown log<CR>', { desc = 'Markdown: open log' })
    end,
  },
}
