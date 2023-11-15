-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
local k = vim.keymap -- for conciseness

-- [[==== GENERAL KEYMAPS ====]]

-- [[ Search ]]
-- after search highlights everything and you hit enter
-- the highlights are "stuck". To clear them, use leader + nh ("no highlight")
k.set("n", "<leader>nh", ":nohl<CR>")

-- when deleting a single character, don't save that character to the register
k.set("n", "x", '"_x')

-- [[ Manage Splits ]]
k.set("n", "<leader>wv", "<C-w>v", { desc = "split Window Vertically" })
k.set("n", "<leader>wh", "<C-w>s", { desc = "split Window Horitonzally" })
k.set("n", "<leader>we", "<C-w>=", { desc = "split Windows Equally" })
k.set("n", "<leader>wx", ":close<CR>", { desc = "Window Exit" })
-- we have one more command <leader>wm which is the Window Maximizer

-- [[ Manage Tabs ]]
k.set("n", "<leader>to", ":tabnew<CR>", { desc = "Open new tab" })
k.set("n", "<leader>tx", ":tabclose<CR>", { desc = "Close current tab" })
k.set("n", "<leader>tn", ":tabn<CR>", { desc = "Go to next tab" })
k.set("n", "<leader>tp", ":tabp<CR>", { desc = "Go to previous tab" })

-- [[ Annoyances in Vim ]]
-- make space be a no-opt in visual and normal mode
k.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
-- Remap for dealing with word wrap
k.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
k.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- [[ Diagnostics ]]
k.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
k.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
k.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
k.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })


-- [[==== PLUGIN KEYMAPS ====]]

-- vim-maximizer
k.set("n", "<leader>wm", ":MaximizerToggle<CR>")

-- [[ Configure Oil ]]
k.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- [[ Configure Telescope ]]
k.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files in current project
k.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find text in current project
k.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find current string cursor is on in current project
k.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- show active buffers
k.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- show help tags

-- See `:help telescope.builtin`
k.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
k.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
k.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })

k.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
k.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
k.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
k.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
k.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
k.set('n', '<leader>sG', ':LiveGrepGitRoot<cr>', { desc = '[S]earch by [G]rep on Git Root' })
k.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
k.set('n', '<leader>sr', require('telescope.builtin').resume, { desc = '[S]earch [R]esume' })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- [[ Configure Harpoon ]]
k.set("n", "mc", ':lua require("harpoon.mark").add_file()<CR>', { desc = "[M]ark w/Harpoon [C]reate mark", silent = true })
k.set("n", "mm", ':lua require("harpoon.ui").toggle_quick_menu()<CR>', { desc = "[H]arpoon [M]enu", silent = true })
k.set("n", "mn", ':lua require("harpoon.ui").nav_next()<CR>', { desc = "[H]arpoon [N]ext", silent = true })
k.set("n", "mp", ':lua require("harpoon.ui").nav_prev()<CR>', { desc = "[H]arpoon [P]revious", silent = true })
k.set("n", "ma", ':lua require("harpoon.ui").nav_file(1)<CR>', { desc = "[H]arpoon [1]", silent = true })
k.set("n", "ms", ':lua require("harpoon.ui").nav_file(2)<CR>', { desc = "[H]arpoon [2]", silent = true })
k.set("n", "md", ':lua require("harpoon.ui").nav_file(3)<CR>', { desc = "[H]arpoon [3]", silent = true })
k.set("n", "mf", ':lua require("harpoon.ui").nav_file(4)<CR>', { desc = "[H]arpoon [4]", silent = true })
k.set("n", "mg", ':lua require("harpoon.ui").nav_file(5)<CR>', { desc = "[H]arpoon [5]", silent = true })
k.set("n", "mh", ':lua require("harpoon.ui").nav_file(6)<CR>', { desc = "[H]arpoon [6]", silent = true })
k.set("n", "mj", ':lua require("harpoon.ui").nav_file(7)<CR>', { desc = "[H]arpoon [7]", silent = true })
k.set("n", "mk", ':lua require("harpoon.ui").nav_file(8)<CR>', { desc = "[H]arpoon [8]", silent = true })
k.set("n", "ml", ':lua require("harpoon.ui").nav_file(9)<CR>', { desc = "[H]arpoon [9]", silent = true })
k.set("n", "m;", ':lua require("harpoon.ui").nav_file(10)<CR>', { desc = "[H]arpoon [10]", silent = true })
k.set("n", "mt", ':lua require("harpoon.term").gotoTerminal(1)<CR>', { desc = "[H]arpoon [T]erminal 1", silent = true })
k.set("n", "my", ':lua require("harpoon.term").gotoTerminal(2)<CR>', { desc = "[H]arpoon [T]erminal 2", silent = true })
k.set("t", "<C-o>", '<C-\\><C-N><C-o><CR>', { desc = "Go back in jumplist", silent = true })
-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
