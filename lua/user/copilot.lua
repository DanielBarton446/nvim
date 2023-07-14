local status_ok, copilot = pcall(require, "copilot")
if not status_ok then
  return
end

local status, copilot_cmp = pcall(require, "copilot")
if not status then
  return
end


copilot.setup({
    suggestion = {
      enabled = true,
      auto_trigger = true,
      debounce = 75,
      keymap = {
        accept = "<C-a>",
        accept_word = false,
        accept_line = false,
        next = "<C-n>",
        prev = "<C-p>",
        dismiss = "<C-l>",
      },
    },
    copilot_node_command = "node", -- Node.js version must be > 16.x
    server_opts_overrides = {},
})
copilot_cmp.setup()
