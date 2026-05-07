-- csvview.nvim: pretty-prints CSV/TSV files with aligned columns
-- https://github.com/hat0uma/csvview.nvim

---@module 'lazy'
---@type LazySpec
return {
  'hat0uma/csvview.nvim',
  -- Only load the plugin when one of these commands is run, or when a
  -- csv/tsv/psv file is opened. This keeps Neovim startup fast.
  cmd = { 'CsvViewEnable', 'CsvViewDisable', 'CsvViewToggle' },
  ft = { 'csv', 'tsv', 'csv_semicolon', 'csv_whitespace', 'csv_pipe', 'rfc_csv', 'rfc_semicolon' },
  ---@module 'csvview'
  ---@type CsvView.Options
  opts = {
    parser = { comments = { '#', '//' } },
    keymaps = {
      -- Text objects for selecting a field (e.g. `vif` selects inside field)
      textobject_field_inner = { 'if', mode = { 'o', 'x' } },
      textobject_field_outer = { 'af', mode = { 'o', 'x' } },
      -- Jump between fields/rows while csvview is active
      jump_next_field_end = { '<Tab>', mode = { 'n', 'v' } },
      jump_prev_field_end = { '<S-Tab>', mode = { 'n', 'v' } },
      jump_next_row = { '<Enter>', mode = { 'n', 'v' } },
      jump_prev_row = { '<S-Enter>', mode = { 'n', 'v' } },
    },
    view = {
      -- 'border' draws separators between columns; 'highlight' overlays
      -- alignment in-place; 'display' shows a separate aligned view.
      display_mode = 'border',
      header_lnum = true,
      sticky_header = {
        enabled = true,
        separator = "─",  -- Separator line character
      },
    },
  },
  keys = {
    -- <space>tc → Toggle CSV view on the current buffer
    { '<leader>tc', '<cmd>CsvViewToggle<cr>', desc = '[T]oggle [C]SV view' },
  },
}
