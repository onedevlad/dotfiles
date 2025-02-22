vim.g.mapleader = ','

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- NvimTree
vim.cmd [[
  autocmd VimEnter * map <leader><leader> :NvimTreeToggle<CR>
]]

keymap('', '<Leader>g', ":NvimTreeFindFile<CR>", {});

keymap('', '/', '<Plug>(easymotion-sn)', {})

-- Allow jk to be used instead of Esc to switch to NORMAL mode
keymap('i', 'jk', '<esc>', opts)

-- Save files with `Ctrl+S`
keymap('n', '<c-s>', ':w<CR>', opts)

-- Map ; to : to skip pressing Shift every time
keymap('n', ';', ':', { noremap = true })

-- Map `,/` to clear last search highlight
keymap('n', '<Leader>/', ':nohlsearch<CR>', opts)

-- Map ctrl-movement keys to window switching
keymap('', '<C-k>', '<C-w><Up>', opts)
keymap('', '<C-j>', '<C-w><Down>', opts)
keymap('', '<C-l>', '<C-w><Right>', opts)
keymap('', '<C-h>', '<C-w><Left>', opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Move to prev/next buffer
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)
keymap('n', "<S-q>", ":Bdelete<CR>", opts)

-- Use `P` to put register content on the next line
keymap('n', 'P', ':pu<CR>', opts)

-- Use `x` to cut to clipboard
keymap('n', 'x', '"+x', opts)
keymap('v', 'x', '"+x', opts)

-- Prevent `d` and `x` from cutting text instead of deleting
keymap('n', 'd', '"_d', opts)
keymap('v', 'd', '"_d', opts)
keymap('n', 'x', '"_x', opts)
keymap('v', 'x', '"_x', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)

keymap("n", '<Leader>dfc', ":DiffviewFileHistory %<CR>", opts)
keymap("n", '<Leader>dfa', ":DiffviewFileHistory<CR>", opts)
keymap("n", '<Leader>dfo', ":DiffviewOpen<CR>", opts)
keymap("n", '<Leader>dfx', ":DiffviewClose<CR>", opts)

keymap("n", '<Leader>t', ':lua require("neotest").run.run()<CR>', opts)
keymap("n", '<Leader>ta', ':lua require("neotest").run.run(vim.fn.expand("%"))<CR>', opts)
keymap("n", '<Leader>td', ':lua require("neotest").run.run({ strategy = "dap" })<CR>', opts)
keymap("n", '<Leader>ts', ':lua require("neotest").summary.toggle()<CR>', opts)
keymap("n", '<Leader>to', ':lua require("neotest").output.open({ autoClose = true })<CR>', opts)

keymap('n', '<Leader>ev', ':e ~/.config/nvim/init.lua<CR>', opts)
keymap('n', '<Leader>sv', ':luafile ~/.config/nvim/init.lua<CR>', opts)
