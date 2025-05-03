-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Set the color of telescope window border
vim.cmd [[
  highlight TelescopeBorder guifg=#5f8787 guibg=NONE
]]

local diagnostics_virtual_text = true
function ToggleDiagnosticsVirtualText()
  diagnostics_virtual_text = not diagnostics_virtual_text
  vim.diagnostic.config { virtual_text = diagnostics_virtual_text }
end
