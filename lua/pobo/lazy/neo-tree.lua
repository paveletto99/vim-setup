return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v2.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "s1n7ax/nvim-window-picker",
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("neo-tree").setup {
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
    }
    vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
    vim.cmd([[ autocmd FileType neo-tree lua require("window-picker").setup({}) ]])
    -- keymaps
    vim.keymap.set({ "n", "t" }, "<leader>t", "<cmd>Neotree position=current<CR>")
    vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<CR>")
    vim.keymap.set("n", "<leader>f", "<cmd>Neotree reveal<CR>")
    vim.keymap.set("n", "<leader>g", "<cmd>Neotree git_status<CR>")
  end,
}
