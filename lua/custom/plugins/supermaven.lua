return {
  'supermaven-inc/supermaven-nvim',
  config = function()
    require('supermaven-nvim').setup {
      keymaps = {
        accept_word = '<C-l>',
        accept_suggestion = '<M-l>',
      },
      ignore_filetypes = {},
      log_level = 'info',
    }
  end,
}
