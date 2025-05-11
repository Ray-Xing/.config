-- Set leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Disable the spacebar and 's' key's default behavior in Normal and Visual modes
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.keymap.set({ 'n', 'v' }, 's', '<Nop>', { silent = true })

-- For conciseness
local opts = { noremap = true, silent = true }
vim.keymap.set({'n', 'v'}, ';', ':')


-- Movement
vim.keymap.set({ 'n', 'v'}, 'J', '5j', opts)
vim.keymap.set({ 'n', 'v'}, 'K', '5k', opts)
vim.keymap.set({ 'n', 'v'}, 'H', '0', opts)
vim.keymap.set({ 'n', 'v'}, 'L', '$', opts)

-- save file
vim.keymap.set({ 'n'}, 'S', '<cmd> w <CR>', opts)

-- save file without auto-formatting
vim.keymap.set('n', '<leader>sn', '<cmd>noautocmd w <CR>', opts)

-- quit file
vim.keymap.set('n', 'Q', '<cmd> q <CR>', opts)

-- quit file without save
vim.keymap.set('n', '<C-q>', '<cmd> q! <CR>', opts)

-- delete single character without copying into register
vim.keymap.set('n', 'x', '"_x', opts)

-- Vertical scroll and center
vim.keymap.set('n', '<C-d>', '<C-d>zz', opts)
vim.keymap.set('n', '<C-u>', '<C-u>zz', opts)

-- Find and center
vim.keymap.set('n', 'n', 'nzzzv', opts)
vim.keymap.set('n', 'N', 'Nzzzv', opts)

-- Resize with arrows
vim.keymap.set('n', '<Up>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<Down>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<Left>', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<Right>', ':vertical resize +2<CR>', opts)

-- Buffers
vim.keymap.set('n', '<Tab>', ':bnext<CR>', opts)
vim.keymap.set('n', '<S-Tab>', ':bprevious<CR>', opts)
vim.keymap.set('n', '<leader>x', ':bdelete!<CR>', opts) -- close buffer
vim.keymap.set('n', '<leader>b', '<cmd> enew <CR>', opts) -- new buffer

-- Window spliting
vim.keymap.set('n', 'sh', '<cmd> set nosplitright<CR> <cmd>vsplit<CR>', opts)
vim.keymap.set('n', 'sl', '<cmd> set splitright<CR> <cmd>vsplit<CR>', opts)
vim.keymap.set('n', 'sj', '<cmd> set splitbelow<CR> <cmd>hsplit<CR>', opts)
vim.keymap.set('n', 'sk', '<cmd> set nosplitbelow<CR> <cmd>hsplit<CR>', opts)
-- Move the cursor
vim.keymap.set('n', '<LEADER>h', '<C-w>h', opts)
vim.keymap.set('n', '<LEADER>l', '<C-w>l', opts)
vim.keymap.set('n', '<LEADER>j', '<C-w>j', opts)
vim.keymap.set('n', '<LEADER>k', '<C-w>k', opts)

-- Tabs
vim.keymap.set('n', '<leader>to', ':tabnew<CR>', opts) -- open new tab
vim.keymap.set('n', '<leader>tx', ':tabclose<CR>', opts) -- close current tab
vim.keymap.set('n', '<leader>th', ':tabn<CR>', opts) --  go to next tab
vim.keymap.set('n', '<leader>tl', ':tabp<CR>', opts) --  go to previous tab

-- Stay in indent mode
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)

-- Keep last yanked when pasting
vim.keymap.set('v', 'p', '"_dP', opts)

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })
