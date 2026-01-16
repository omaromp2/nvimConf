return {
  'dmtrKovalenko/fff.nvim',
  build = function()
    require('fff.download').download_or_build_binary()
  end,
  keys = {
    {
      '<leader>fj',
      function()
        require('fff').find_files()
      end,
      desc = 'FFFind files',
    },
  },
  config = function()
    require('fff').setup({})
  end,
}
