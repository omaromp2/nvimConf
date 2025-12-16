return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('bufferline').setup {
      options = {
        mode = 'buffers', -- show buffers as tabs
        diagnostics = 'nvim_lsp', -- show LSP diagnostics in tabs
        show_close_icon = false,
        show_buffer_close_icons = false,
        separator_style = 'slant', -- "slant" | "thin" | "padded_slant" | "none"
        offsets = {
          {
            filetype = 'neo-tree', -- or "NvimTree" if you use that
            text = 'Explorer',
            highlight = 'Directory',
            text_align = 'left',
          },
        },
      },
    }

    -- Keymaps for buffer navigation
    local map = vim.keymap.set
    local opts = { silent = true, noremap = true }

    -- Next / previous buffer
    map('n', '<S-l>', '<Cmd>BufferLineCycleNext<CR>', opts)
    map('n', '<S-h>', '<Cmd>BufferLineCyclePrev<CR>', opts)

    -- Re-order buffers
    map('n', '<A-l>', '<Cmd>BufferLineMoveNext<CR>', opts)
    map('n', '<A-h>', '<Cmd>BufferLineMovePrev<CR>', opts)

    -- Go to buffer 1..9 with <leader>1..9
    for i = 1, 9 do
      map('n', '<leader>' .. i, '<Cmd>BufferLineGoToBuffer ' .. i .. '<CR>', {
        silent = true,
        noremap = true,
        desc = 'Go to buffer ' .. i,
      })
    end

    -- Close current buffer
    map('n', '<leader>bd', '<Cmd>bdelete<CR>', { desc = 'Delete buffer' })
  end,
}
