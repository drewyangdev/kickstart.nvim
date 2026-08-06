-- barbar.nvim: a "tabline" (a row of buffer tabs across the top of the editor).
-- In Neovim, every file you open lives in a "buffer". barbar shows one clickable
-- tab per open buffer so you can see and switch between them visually.
--
-- https://github.com/romgrk/barbar.nvim

---@module 'lazy'
---@type LazySpec
return {
  'romgrk/barbar.nvim',
  dependencies = {
    'lewis6991/gitsigns.nvim', -- optional: shows git status (added/changed) on each tab
    'nvim-tree/nvim-web-devicons', -- optional: file-type icons on each tab
  },
  init = function()
    -- barbar wants this set before it loads.
    vim.g.barbar_auto_setup = false
  end,
  opts = {
    -- Leave the defaults; barbar looks good out of the box.
    -- See :help barbar-configuration for every option.
  },
  version = '^1.0.0', -- only pull stable 1.x releases

  -- Keymaps. In these, <A-...> means "Alt/Option + key".
  -- The `desc` text shows up in which-key when you start a keybinding.
  keys = {
    -- Move between tabs
    { '<A-,>', '<Cmd>BufferPrevious<CR>', desc = 'Previous buffer tab' },
    { '<A-.>', '<Cmd>BufferNext<CR>', desc = 'Next buffer tab' },

    -- Reorder the current tab left/right
    { '<A-<>', '<Cmd>BufferMovePrevious<CR>', desc = 'Move buffer tab left' },
    { '<A->>', '<Cmd>BufferMoveNext<CR>', desc = 'Move buffer tab right' },

    -- Jump straight to tab number N
    { '<A-1>', '<Cmd>BufferGoto 1<CR>', desc = 'Go to buffer tab 1' },
    { '<A-2>', '<Cmd>BufferGoto 2<CR>', desc = 'Go to buffer tab 2' },
    { '<A-3>', '<Cmd>BufferGoto 3<CR>', desc = 'Go to buffer tab 3' },
    { '<A-4>', '<Cmd>BufferGoto 4<CR>', desc = 'Go to buffer tab 4' },
    { '<A-5>', '<Cmd>BufferGoto 5<CR>', desc = 'Go to buffer tab 5' },
    { '<A-6>', '<Cmd>BufferGoto 6<CR>', desc = 'Go to buffer tab 6' },
    { '<A-7>', '<Cmd>BufferGoto 7<CR>', desc = 'Go to buffer tab 7' },
    { '<A-8>', '<Cmd>BufferGoto 8<CR>', desc = 'Go to buffer tab 8' },
    { '<A-9>', '<Cmd>BufferGoto 9<CR>', desc = 'Go to buffer tab 9' },
    { '<A-0>', '<Cmd>BufferLast<CR>', desc = 'Go to last buffer tab' },

    -- Close the current tab (buffer)
    { '<A-c>', '<Cmd>BufferClose<CR>', desc = 'Close buffer tab' },

    -- "Pin" a tab so it stays put and won't be closed by "close all others"
    { '<A-p>', '<Cmd>BufferPin<CR>', desc = 'Pin/unpin buffer tab' },

    -- Open a picker: shows a letter on each tab, press it to jump there
    { '<C-p>', '<Cmd>BufferPick<CR>', desc = 'Pick a buffer tab' },
  },
}
