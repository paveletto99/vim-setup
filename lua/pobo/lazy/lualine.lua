-- https://github.com/nvim-lualine/lualine.nvim?tab=readme-ov-file
return {
  'nvim-lualine/lualine.nvim',
  event = 'VeryLazy',
  dependencies = { 'nvim-tree/nvim-web-devicons', opt = true },
  config = function()
    local lualine = require('lualine')
    lualine.setup({
      options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {},
        always_divide_middle = true,
        globalstatus = false,
      },
    })
    local colors = {
      bg = '#1e222a',
      fg = '#abb2bf',
      yellow = '#d19a66',
      cyan = '#56b6c2',
      darkblue = '#081633',
      green = '#98c379',
      orange = '#d19a66',
      violet = '#a626a4',
      magenta = '#c678dd',
      blue = '#61afef',
      red = '#e06c75',
    }
  end,
}