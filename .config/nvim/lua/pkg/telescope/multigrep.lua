local map = require "utils.keymap"
local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local make_entry = require "telescope.make_entry"
local conf = require "telescope.config".values

local M = {}

local live_multigrep = function (opts)
  opts = opts or {}
  opts.cwd = opts.cwd or vim.uv.cwd()

  local finder = finders.new_async_job {
    command_generator = function (prompt)
      if not prompt or prompt == "" then
        return nil
      end

      local pieces = vim.split(prompt, "  ")
      local args = { "rg" }
      if pieces[1] then
        table.insert(args, "-e")
        table.insert(args, pieces[1])
      end

      if pieces[2] and pieces[2] ~= "" then
        -- A bare word (e.g. "lua") is treated as an rg filetype; anything that
        -- looks like a glob (contains *, ?, /, or .) is passed through as -g.
        local flag = pieces[2]:match("[*?/.]") and "-g" or "-t"
        table.insert(args, flag)
        table.insert(args, pieces[2])
      end

      return vim.iter {
        args,
        { "--color=never", "--no-heading", "--with-filename", "--line-number", "--column", "--smart-case" },
      }:flatten():totable()
    end,
    entry_maker = make_entry.gen_from_vimgrep(opts),
    cwd = opts.cwd
  }

  pickers.new(opts, {
    prompt_title = "Multi Grep",
    finder = finder,
    debounce = 100,
    previewer = conf.grep_previewer(opts),
    sorter = require "telescope.sorters".empty(),
  }):find()
end

M.setup = function ()
  map("n", "<Leader>a", live_multigrep, { desc = "Live grep" })
end

return M
