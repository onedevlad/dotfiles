vim.g.mapleader = ","

local opts = { noremap = true, silent = true }
local utils = require("utils.main")

local function map(mode, lhs, rhs, custom_opts)
  local merged_opts = vim.tbl_extend("force", opts, custom_opts or {})
  vim.api.nvim_set_keymap(mode, lhs, rhs, merged_opts)
end

-- NvimTree
map("n", "<Leader><Leader>", ":NvimTreeToggle<CR>", { desc = "Toggle filetree" });
map("n", "<Leader>g", ":NvimTreeFindFile<CR>", { desc = "Locate file in filetree" });

-- Allow jk to be used instead of Esc to switch to NORMAL mode
map("i", "jk", "<esc>")

-- Save files with `Ctrl+S`
map("n", "<c-s>", ":w<CR>")

-- Map ; to : to skip pressing Shift every time
map("n", ";", ":", { noremap = true })

map("n", "<Leader>/", ":nohlsearch<CR>", { desc = "Clear search" })

-- Map ctrl-movement keys to window switching
map("", "<C-k>", "<C-w><Up>")
map("", "<C-j>", "<C-w><Down>")
map("", "<C-l>", "<C-w><Right>")
map("", "<C-h>", "<C-w><Left>")

-- Resize with arrows
local resizingPrefix = utils.isMac() and "M" or "C";
map("n", string.format("<%s-Up>", resizingPrefix), ":resize -2<CR>")
map("n", string.format("<%s-Down>", resizingPrefix), ":resize +2<CR>")
map("n", string.format("<%s-Left>", resizingPrefix), ":vertical resize -2<CR>")
map("n", string.format("<%s-Right>", resizingPrefix), ":vertical resize +2<CR>")

-- Move to prev/next buffer
map("n", "<S-l>", ":bnext<CR>")
map("n", "<S-h>", ":bprevious<CR>")
map("n", "<S-q>", ":bp<bar>sp<bar>bn<bar>bd<CR>")

map("n", "P", ":pu<CR>", { desc = "Paste below" })

-- Use `x` to cut to clipboard
map("n", "x", '"+x', { desc = "Cut" })
map("v", "x", '"+x', { desc = "Cut" })

-- Prevent `d` and `x` from cutting text instead of deleting
map("n", "d", '"_d')
map("v", "d", '"_d')
map("n", "x", '"_x')
map("v", "x", '"_x')

-- Visual Block --
map("x", "J", ":move '>+1<CR>gv-gv", { desc = "Move down" })
map("x", "K", ":move '<-2<CR>gv-gv", { desc = "Move up" })

map("n", "<Leader>q", ":Ctoggle<CR>", { desc = "Toggle Quickfix" })

-- DiffView
-- map("n", "<Leader>dff", ":DiffviewFileHistory %<CR>", { desc = "File history" })
-- map("n", "<Leader>dfo", ":DiffviewOpen<CR>", { desc = "Open diff" })
-- map("n", "<Leader>dfq", ":DiffviewClose<CR>", { desc = "Close diff" })

-- Telescope
map('n', '<Leader>f', ':Telescope find_files<CR>', { desc = "Find files" })
map('n', '<Leader>a', ':Telescope live_grep<CR>', { desc = "Live grep" })
map('n', '<Leader>b', ':Telescope buffers<CR>', { desc = "List buffers" })

-- Tests
map("n", "<Leader>t", ":lua require('neotest').run.run()<CR>", { desc = "Run test" })
map("n", "<Leader>ta", ":lua require('neotest').run.run(vim.fn.expand('%'))<CR>", { desc = "Run all tests" })
map("n", "<Leader>td", ":lua require('neotest').run.run({ strategy = 'dap' })<CR>", { desc = "Debug test" })
map("n", "<Leader>ts", ":lua require('neotest').summary.toggle()<CR>", { desc = "Toggle summary" })
map("n", "<Leader>to", ":lua require('neotest').output.open({ autoClose = true })<CR>", { desc = "Open output" })

-- DAP
map("n", "<Leader>dt", ":lua require('dap').toggle_breakpoint()<CR>", { desc = "Toggle breakpoint" })
