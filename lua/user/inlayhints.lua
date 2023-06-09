local status, hints = pcall(require, "inlay-hints")
if (not status) then return end

hints.setup({
  -- only_current_line = true,

  eol = {
    right_align = true,
  }
})
