local status, chat_gpt = pcall(require, "chatgpt")
if (not status) then return end

chat_gpt.setup({
 popup_input = {
    prompt = "  ",
    border = {
      highlight = "FloatBorder",
      style = "rounded",
      text = {
        top_align = "center",
        top = " Prompt ",
      },
    },
    win_options = {
      winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
    },
    submit = "<C-s>"
  }
})
