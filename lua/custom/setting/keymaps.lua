-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
-- vim.keymap.del({ "n", "i" }, "<C-c>")

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- [[ Moving selected lines ]]
vim.keymap.set('v', '<M-k>', ":m '<-2<CR>gv=gv", { silent = true })
vim.keymap.set('v', '<M-j>', ":m '>+1<CR>gv=gv", { silent = true })

-- [[ Moving current line ]]
vim.keymap.set('n', '<M-k>', ":m -2<CR>", { silent = true })
vim.keymap.set('n', '<M-j>', ":m +1<CR>", { silent = true })

-- [[ Switching windows ]]
vim.keymap.set('n', '<C-h>', ":<C-U>TmuxNavigateLeft<cr>", { silent = true })
vim.keymap.set('n', '<C-j>', ":<C-U>TmuxNavigateDown<cr>", { silent = true })
vim.keymap.set('n', '<C-k>', ":<C-U>TmuxNavigateUp<cr>", { silent = true })
vim.keymap.set('n', '<C-l>', ":<C-U>TmuxNavigateRight<cr>", { silent = true })

-- [[ Close window ]]
vim.keymap.set('n', '<leader>c', ":close<CR>", { silent = true })

-- [[ Save file ]]
vim.keymap.set('n', '<C-s>', ':w<CR>', { silent = true })

-- [[ duplicate line ]]
vim.keymap.set('n', '<C-d>', function()
	local _, c = unpack(vim.api.nvim_win_get_cursor(0))
	local cmd = string.format('"dyy"dp')
	if (c ~= 0) then
		cmd = string.format('"dyy"dp%dl', c)
	end

	vim.cmd.normal { cmd, bang = true }
end, { silent = true, desc = '[D]uplicate line' })


-- [[ stops yanking after paste over ]]
vim.keymap.set('x', 'p', 'P', { silent = true })


-- -- [[ wraping text with parenthesis ]]
-- local function mmap(s, e)
-- 	vim.keymap.set('v', s,
-- 		-- using a the register r(eplace) so the default one doesn't get overwritten
-- 		string.format('"rc%s<C-r>"%s<esc>', s, e),
-- 		{ silent = true }
-- 	)
-- end
--
-- mmap('(', ')')
-- mmap('[', ']')
-- mmap('{', '}')
-- mmap('"', '"')
-- mmap("'", "'")
-- mmap("`", "`")

--[[ making and moving between tabs ]]

vim.keymap.set('n', '<leader>l', ':BufferLineCycleNext <CR>', { silent = true })
vim.keymap.set('n', '<leader>h', ':BufferLineCyclePrev <CR>', { silent = true })
vim.keymap.set('n', '<leader>k', ':tabnew <cr>', { silent = true })
vim.keymap.set('n', '<leader>j', '<C-w>T', { silent = true })
