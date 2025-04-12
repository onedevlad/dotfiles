local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

local actions = require("telescope.actions")

local focus_preview = function(prompt_bufnr)
  local action_state = require("telescope.actions.state")
  local picker = action_state.get_current_picker(prompt_bufnr)
  local prompt_win = picker.prompt_win
  local previewer = picker.previewer
  local winid = previewer.state.winid
  local bufnr = previewer.state.bufnr

  local focus_prompt = function()
    vim.cmd(string.format("noautocmd lua vim.api.nvim_set_current_win(%s)", prompt_win))
  end
  vim.keymap.set("n", "H", focus_prompt, { buffer = bufnr });
  vim.keymap.set("n", "<C-h>", focus_prompt, { buffer = bufnr });
  vim.cmd(string.format("noautocmd lua vim.api.nvim_set_current_win(%s)", winid))
end

telescope.setup({
  defaults = {
    prompt_prefix = " ",
    selection_caret = " ",
    -- path_display = { "smart" },
    file_ignore_patterns = {"node_modules", "*.lock"},

    mappings = {
      i = {
        ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
        ["<M-q>"] = actions.send_to_qflist + actions.open_qflist,
        ["<C-u>"] = actions.preview_scrolling_up,
        ["<C-d>"] = actions.preview_scrolling_down,
      },

      n = {
        ["q"] = actions.close,
        ["x"] = actions.delete_buffer,
        ["d"] = actions.delete_buffer,
        ["<C-u>"] = actions.preview_scrolling_up,
        ["<C-d>"] = actions.preview_scrolling_down,
        ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
        ["<M-q>"] = actions.send_to_qflist + actions.open_qflist,
        ["?"] = actions.which_key,
        ["L"] = focus_preview,
        ["<C-l>"] = focus_preview,
      },
    },
  },
  pickers = {
    find_files = {
      hidden = true
    },
    buffers = {
      initial_mode = 'normal',
    },
  },
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    },
  },
})

require('telescope').load_extension('fzf')
