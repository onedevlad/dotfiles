return {
  "joeytwiddle/sexy_scroller.vim",
  init = function()
    vim.g.SexyScroller_ScrollTime = 10
    vim.g.SexyScroller_CursorTime = 5
    vim.g.SexyScroller_MaxTime = 300
    vim.g.SexyScroller_EasingStyle = 3
    vim.g.SexyScroller_DetectPendingKeys = 1
  end,
}
