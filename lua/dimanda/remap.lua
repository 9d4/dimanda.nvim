vim.g.mapleader = " "
-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
-- vim.keymap.set("n", "<leader>nh", vim.cmd.nohl)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
-- vim.keymap.set("n", "<leader>wf", ":lua vim.lsp.buf.format()<CR>:w<CR>")

-- enter visual mode then yank the line
vim.keymap.set("n", "<leader>c", "V:y<CR>")

-- MACROS
-- go json struct
-- vim.keymap.set("n", "<leader>jj", 'veyA `json:"pcrsA"`')
