vim.g.mapleader = ","

local utils = require("utils.main")
local map = require("utils.keymap")

-- Allow jk to be used instead of Esc to switch to NORMAL mode
map("i", "jk", "<esc>")

-- Save files with `Ctrl+S`
map("n", "<c-s>", ":w<CR>")

-- Map ; to : to skip pressing Shift every time
map("n", ";", ":", { silent = false })

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

-- Prevent `d` from cutting text instead of deleting
map("n", "d", '"_d')
map("v", "d", '"_d')

-- Visual Block --
map("x", "J", ":move '>+1<CR>gv-gv", { desc = "Move down" })
map("x", "K", ":move '<-2<CR>gv-gv", { desc = "Move up" })
