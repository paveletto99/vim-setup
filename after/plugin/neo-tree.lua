vim.keymap.set({ "n", "t" }, "<leader>t", "<cmd>Neotree position=current<CR>")

require("neo-tree").setup({
  close_if_last_window = false,
  enable_git_status = true,
  enable_diagnostics = true,
  filesystem = {
    follow_current_file = true,
    use_libuv_file_watcher = true,
    filtered_items = {
      hide_dotfiles = false,
      hide_gitignored = false,
      never_show = { ".DS_Store", "thumbs.db" },
    },
  },
  window = {
    mappings = {
      ["<space>"] = false,
      ["<bs>"] = "navigate_up",
      ["."] = "toggle_hidden",
      ["h"] = "navigate_up",
      ["l"] = "open",
      ["P"] = {
        "toggle_preview",
        config = {
          use_float = false,
          -- use_image_nvim = true,
          -- title = 'Neo-tree Preview',
        },
      },
    },
  },
})
vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<CR>")
vim.keymap.set("n", "<leader>f", "<cmd>Neotree reveal<CR>")
vim.keymap.set("n", "<leader>g", "<cmd>Neotree git_status<CR>")