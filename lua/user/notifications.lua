local status, notify = pcall(require, "notify")
if (not status) then
  print("notify not installed correctly")
  return
end

vim.notify = notify

