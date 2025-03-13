return {
  'nvim-telescope/telescope.nvim', tag = '0.1.8',
  dependencies = { 'nvim-lua/plenary.nvim' },

  config = function()
    local builtin = require('telescope.builtin')
    local km = vim.keymap
    km.set('n', '<leader>ff', builtin.find_files)
    km.set('n', '<leader>fg', builtin.live_grep)
    km.set('n', '<leader>fb', builtin.buffers)
    km.set('n', '<leader>fh', builtin.help_tags)
    km.set('n', '<leader>fw', builtin.grep_string)
    km.set('n', '<leader>fd', builtin.diagnostics)
    km.set('n', '<leader><leader>', builtin.buffers)
  end
}
