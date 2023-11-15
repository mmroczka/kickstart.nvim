return
{
  'echasnovski/mini.move',
  version = '*',
  config = {
    mappings = {
      -- Move current block in Visual mode
      left = '<M-h>',
      right = '<M-l>',
      down = '<M-j>',
      up = '<M-k>',

      -- Move current line in Normal mode
      line_left = '<M-h>',
      line_right = '<M-l>',
      line_down = '<M-j>',
      line_up = '<M-k>',

    },
    -- Options which control moving behavior
    options = {
      -- Automatically reindent selection during linewise vertical move
      reindent_linewise = true,
    },
  },
  opts = {}
}
