return {
  'NickvanDyke/opencode.nvim',
  dependencies = {
    -- Recommended for `ask()` and `select()`.
    -- Required for `snacks` provider.
    ---@module 'snacks' <- Loads `snacks.nvim` types for configuration intellisense.
    { 'folke/snacks.nvim', opts = { input = {}, picker = {}, terminal = {} } },
  },
  config = function()
    ---@type opencode.Opts
    vim.g.opencode_opts = {
      -- Your configuration, if any — see `lua/opencode/config.lua`, or "goto definition".
    }

    -- Required for `opts.events.reload`.
    vim.o.autoread = true

    local oc = function()
      return require 'opencode'
    end

    -- ✅ Simple, memorable keymaps under <leader>o
    vim.keymap.set({ 'n', 'x' }, '<leader>oa', function()
      oc().ask('@this: ', { submit = true })
    end, { desc = 'opencode: ask (@this)' })

    vim.keymap.set({ 'n', 'x' }, '<leader>op', function()
      oc().select()
    end, { desc = 'opencode: pick/execute action' })

    vim.keymap.set({ 'n', 'x' }, '<leader>oA', function()
      oc().prompt '@this'
    end, { desc = 'opencode: add context (@this)' })

    vim.keymap.set({ 'n', 't' }, '<leader>oo', function()
      oc().toggle()
    end, { desc = 'opencode: toggle' })

    vim.keymap.set('n', '<leader>ou', function()
      oc().command 'session.half.page.up'
    end, { desc = 'opencode: half page up' })

    vim.keymap.set('n', '<leader>od', function()
      oc().command 'session.half.page.down'
    end, { desc = 'opencode: half page down' })
  end,
}
