-- Display keymaps that have descriptions which do not match
-- the standard format of the config - i.e: plugin_name: description
local function list_nonstandard_keymaps_to_buffer()
  local keymaps = vim.api.nvim_get_keymap ""
  local nonstandard = {}

  for _, km in ipairs(keymaps) do
    local desc = km.desc or ""
    -- Adjust this pattern to match your prefixes
    if not desc:match "^[%w_]+:" then
      table.insert(nonstandard, string.format("[%s] %s -> %s", km.mode, km.lhs, desc))
    end
  end

  -- Create a new scratch buffer
  vim.cmd "enew" -- Open a new buffer
  vim.bo.buftype = "nofile"
  vim.bo.bufhidden = "wipe"
  vim.bo.swapfile = false
  vim.bo.filetype = "keymaps"

  -- Set the lines in the buffer
  vim.api.nvim_buf_set_lines(0, 0, -1, false, nonstandard)

  print("Listed " .. #nonstandard .. " non-standard keymaps in new buffer")
end

-- Run it:
list_nonstandard_keymaps_to_buffer()
