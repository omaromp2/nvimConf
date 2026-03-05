return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('bufferline').setup {
      options = {
        mode = 'buffers',
        diagnostics = 'nvim_lsp',
        diagnostics_update_in_insert = false,
        diagnostics_indicator = function(count, level)
          local icon = level:match 'error' and ' ' or ' '
          return ' ' .. icon .. count
        end,
        always_show_bufferline = true,
        separator_style = 'thin',
        indicator = {
          style = 'underline',
        },
        numbers = 'none',
        show_close_icon = false,
        show_buffer_close_icons = false,
        modified_icon = '●',
        max_name_length = 24,
        max_prefix_length = 16,
        tab_size = 20,
        truncate_names = true,
        custom_filter = function(bufnr)
          if vim.bo[bufnr].buftype ~= '' then
            return false
          end
          return vim.fn.bufname(bufnr) ~= ''
        end,
        offsets = {
          {
            filetype = 'neo-tree',
            text = 'Explorer',
            highlight = 'Directory',
            text_align = 'left',
          },
        },
      },
      highlights = {
        fill = { bg = 'NONE' },
        background = { italic = false },
        buffer_selected = { bold = true, italic = false },
        diagnostic_selected = { bold = true },
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
