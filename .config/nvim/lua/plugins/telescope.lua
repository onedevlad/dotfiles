return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "vijaymarupudi/nvim-fzf",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local map = require("utils.keymap")

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
        prompt_prefix = " ",
        selection_caret = " ",
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

    telescope.load_extension('fzf')

    -- Live multigrep: `rg` with an optional second term (after a double space)
    -- used as either a filetype (-t) or a glob (-g).
    local pickers = require("telescope.pickers")
    local finders = require("telescope.finders")
    local make_entry = require("telescope.make_entry")
    local conf = require("telescope.config").values

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
        sorter = require("telescope.sorters").empty(),
      }):find()
    end

    map("n", "<Leader>f", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
    map("n", "<Leader>b", "<cmd>Telescope buffers<cr>", { desc = "List buffers" })
    map("n", "<Leader>a", live_multigrep, { desc = "Live grep" })
  end,
}
