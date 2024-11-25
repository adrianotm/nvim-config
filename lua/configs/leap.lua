local leap = require("leap")
leap.add_default_mappings(true)
vim.keymap.del({ "x", "o" }, "x")
vim.keymap.del({ "x", "o" }, "X")

-- The below settings make Leap's highlighting closer to what you've been
-- used to in Lightspeed.

vim.api.nvim_set_hl(0, 'LeapBackdrop', { link = 'Comment' }) -- or some grey
vim.api.nvim_set_hl(0, 'LeapMatch', {
  -- For light themes, set to 'black' or similar.
  fg = 'white',
  bold = true,
  nocombine = true,
})

-- Lightspeed colors
-- primary labels: bg = "#f02077" (light theme) or "#ff2f87"  (dark theme)
-- secondary labels: bg = "#399d9f" (light theme) or "#99ddff" (dark theme)
-- shortcuts: bg = "#f00077", fg = "white"
-- You might want to use either the primary label or the shortcut colors
-- for Leap primary labels, depending on your taste.
vim.api.nvim_set_hl(0, 'LeapLabelPrimary', {
  fg = '#15A837', bold = true, nocombine = true,
})
vim.api.nvim_set_hl(0, 'LeapLabelSecondary', {
  fg = '#26DBD5', bold = false, italic = true, nocombine = true, underline = true
})
-- Try it without this setting first, you might find you don't even miss it.
require('leap').opts.highlight_unlabeled_phase_one_targets = true

-- Or just set to grey directly, e.g. { fg = '#777777' },
-- if Comment is saturated.
vim.api.nvim_set_hl(0, 'LeapBackdrop', { link = 'Comment' })

vim.api.nvim_create_autocmd('ColorScheme', {
  callback = function()
    local bg = vim.api.nvim_get_hl(0, { name = 'LeapLabelSecondary' }).bg
    vim.api.nvim_set_hl(0, 'LeapLabelSecondary', { fg = bg, bg = bg, })
  end
})

leap.opts.safe_labels = {}
