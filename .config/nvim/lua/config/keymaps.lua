--
-- ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
-- ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
-- ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
-- ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
-- ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
-- ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
--
-- File: config/keymaps.lua
-- Description: Key mapping configs
-- Author: Kien Nguyen-Tuan <kiennt2609@gmail.com>
-- Close all windows and exit from Neovim with <leader> and q
vim.keymap.set("n", "<leader>q", ":qa!<CR>", {})
-- Fast saving with <leader> and s
vim.keymap.set("n", "<leader>s", ":w<CR>", {})
-- Move around splits
vim.keymap.set("n", "<leader>wh", "<C-w>h", {})
vim.keymap.set("n", "<leader>wj", "<C-w>j", {})
vim.keymap.set("n", "<leader>wk", "<C-w>k", {})
vim.keymap.set("n", "<leader>wl", "<C-w>l", {})

-- Reload configuration without restart nvim
vim.keymap.set("n", "<leader>r", ":so %<CR>", {})

-- Telescope
-- <leader> is a space now
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
vim.keymap.set("n", "<leader>fv", function()
    vim.cmd("vsplit")
    builtin.find_files()
end, {})
vim.keymap.set("n", "<leader>ft", function()
    vim.cmd("tabnew")
    builtin.find_files()
end, {})

-- NvimTree
vim.keymap.set("n", "<leader>n", ":NvimTreeToggle<CR>", {}) -- open/close
vim.keymap.set("n", "<leader>nr", ":NvimTreeRefresh<CR>", {}) -- refresh
vim.keymap.set("n", "<leader>nf", ":NvimTreeFindFile<CR>", {}) -- search file
vim.keymap.set("n", "<leader>nc", ":NvimTreeFocus<CR>", {}) -- focus
vim.keymap.set("n", "<leader>ne", ":NvimTreeFocus<CR>:wincmd p<CR>", {}) -- focus back to editor

-- Terminal
function _G.set_terminal_keymaps()
    local opts = {
        noremap = true
    }
    vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', 'jk', [[<C-\><C-n>]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
vim.keymap.set("n", "<leader>tt", ":ToggleTerm<CR>", {})
-- Move to other panel
vim.keymap.set("n", "<leader>h", "<C-w>h", {})
vim.keymap.set("n", "<leader>j", "<C-w>j", {})
vim.keymap.set("n", "<leader>k", "<C-w>k", {})
vim.keymap.set("n", "<leader>l", "<C-w>l", {})

-- Split panels
vim.keymap.set("n", "<leader>sv", ":vsplit<CR>", {}) -- vertical split
vim.keymap.set("n", "<leader>sh", ":split<CR>", {}) -- horizontal split
-- Close current split panel
vim.keymap.set("n", "<leader>sc", ":close<CR>", {})

-- Comment
vim.keymap.set("n", "<leader>c", ":CommentToggle<CR>", {})
vim.keymap.set("v", "<leader>c", ":CommentToggle<CR>", {})
-- Indent
vim.keymap.set("v", "<", "<gv", {})
vim.keymap.set("v", ">", ">gv", {})
-- Move lines
vim.keymap.set("n", "<A-Down>", ":m .+1<CR>==", {})
vim.keymap.set("n", "<A-Up>", ":m .-2<CR>==", {})
vim.keymap.set("i", "<A-Down>", "<Esc>:m .+1<CR>==gi", {})
vim.keymap.set("i", "<A-Up>", "<Esc>:m .-2<CR>==gi", {})
vim.keymap.set("x", "<A-Down>", ":m '>+1<CR>gv-gv", {})
vim.keymap.set("x", "<A-Up>", ":m '<-2<CR>gv-gv", {})
-- Move visual block
vim.keymap.set("x", "K", ":move '<-1<CR>gv-gv", {})
vim.keymap.set("x", "J", ":move '>+1<CR>gv-gv", {})
-- Resize panels
vim.keymap.set("n", "<C-Up>", ":resize -2<CR>", {})
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>", {})
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", {})
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", {})

-- undo and redo
vim.keymap.set("n", "<C-z>", ":undo<CR>", {})
vim.keymap.set("n", "<C-S-z>", ":redo<CR>", {})

-- delete line
vim.keymap.set("n", "<C-S-k>", "dd", {})

-- select all
vim.keymap.set("n", "<C-a>", "ggVG", {})

-- Copy, cut, and paste in normal and visual modes
-- Copy
vim.keymap.set("n", "<C-c>", '"+y', {})
vim.keymap.set("v", "<C-c>", '"+y', {})

-- Cut
vim.keymap.set("n", "<C-x>", '"+x', {})
vim.keymap.set("v", "<C-x>", '"+x', {})

-- Paste
vim.keymap.set("n", "<C-v>", '"+p', {})
vim.keymap.set("v", "<C-v>", '"+p', {})

-- select text
vim.keymap.set("v", "<S-Right>", [[:<C-u>execute "normal! v"<Bar>normal! \<Right>]], {noremap = true})
vim.keymap.set("v", "<S-Left>", [[:<C-u>execute "normal! v"<Bar>normal! \<Left>]], {noremap = true})
vim.keymap.set("v", "<S-Down>", [[:<C-u>execute "normal! v"<Bar>normal! \<Down>]], {noremap = true})
vim.keymap.set("v", "<S-Up>", [[:<C-u>execute "normal! v"<Bar>normal! \<Up>]], {noremap = true})