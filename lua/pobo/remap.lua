-- vim.g.mapleader = " "
-- -- exit from current
-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
-- -- move selected code down
-- vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
-- -- move selected code up
-- vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
-- vim.keymap.set("n", "J", "mzJ`z")
-- -- navigate fast up and down
-- vim.keymap.set("n", "<C-d>", "<C-d>zz")
-- vim.keymap.set("n", "<C-u>", "<C-u>zz")
-- -- 🤔
-- vim.keymap.set("n", "n", "nzzzv")
-- vim.keymap.set("n", "N", "Nzzzv")
-- -- greatest remap ever / new line under
-- -- show file preview
-- vim.keymap.set("x", "<leader>p", [["_dP]])
-- -- next greatest remap ever : asbjornHaland
-- -- yeld lines
-- vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
-- vim.keymap.set("n", "<leader>Y", [["+Y]])
-- -- duplicate line
-- -- vim.keymap.set('n', '<leader>dd', 'yyP', { noremap = true, silent = true })
-- -- delete line upper or lower
-- vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])
-- vim.keymap.set("n", "Q", "<nop>")
-- vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
-- -- format file
-- vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
-- vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
-- vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
-- vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
-- vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")
-- vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
-- vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.config/nvim/.config/nvim/lua/pobo/packer.lua<CR>");
-- vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");
-- vim.keymap.set("n", "<leader><leader>", function()
--     vim.cmd("so")
-- end)
-- -- DEGUB 🐛🪲🦗🪳
-- vim.keymap.set('n', '<F5>', '<Cmd>lua require("dap").continue()<CR>', { noremap = true, silent = true })
-- vim.keymap.set('n', '<F10>', '<Cmd>lua require("dap").step_over()<CR>', { noremap = true, silent = true })
-- vim.keymap.set('n', '<F11>', '<Cmd>lua require("dap").step_into()<CR>', { noremap = true, silent = true })
-- vim.keymap.set('n', '<F12>', '<Cmd>lua require("dap").step_out()<CR>', { noremap = true, silent = true })
-- vim.keymap.set('n', '<Leader>b', '<Cmd>lua require("dap").toggle_breakpoint()<CR>', { noremap = true, silent = true })
-- vim.keymap.set('n', '<Leader>dr', '<Cmd>lua require("dap").repl.open()<CR>', { noremap = true, silent = true })
-- vim.keymap.set('n', '<Leader>dl', '<Cmd>lua require("dap").run_last()<CR>', { noremap = true, silent = true })
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "=ap", "ma=ap'a")
vim.keymap.set("n", "<leader>zig", "<cmd>LspRestart<cr>")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({"n", "v"}, "<leader>d", "\"_d")

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", {
    silent = true
})

vim.keymap.set("n", "<leader>ee", "oif err != nil {<CR>}<Esc>Oreturn err<Esc>")

vim.keymap.set("n", "<leader>ea", "oassert.NoError(err, \"\")<Esc>F\";a")

vim.keymap.set("n", "<leader>ef", "oif err != nil {<CR>}<Esc>Olog.Fatalf(\"error: %s\\n\", err.Error())<Esc>jj")

vim.keymap.set("n", "<leader>el", "oif err != nil {<CR>}<Esc>O.logger.Error(\"error\", \"error\", err)<Esc>F.;i")

vim.keymap.set("n", "<leader>ca", function()
    require("cellular-automaton").start_animation("make_it_rain")
end)

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

-- -- Only if you enable copilot inline suggestions
-- vim.keymap.set("i", "<D-l>", function()
--     require("copilot.suggestion").accept()
-- end, {
--     desc = "Copilot: Accept"
-- })
-- vim.keymap.set("i", "<D-]>", function()
--     require("copilot.suggestion").next()
-- end, {
--     desc = "Copilot: Next"
-- })
-- vim.keymap.set("i", "<D-[>", function()
--     require("copilot.suggestion").prev()
-- end, {
--     desc = "Copilot: Prev"
-- })
-- vim.keymap.set("i", "<D-\\>", function()
--     require("copilot.suggestion").dismiss()
-- end, {
--     desc = "Copilot: Dismiss"
-- })
