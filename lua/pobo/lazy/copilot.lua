return {{
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
        require("copilot").setup({
            panel = {
                enabled = true,
                auto_refresh = true
            },
            -- suggestion = {
            --     enabled = false
            -- }, -- we’ll use cmp for acceptance
            filetypes = {
                ["*"] = true,
                markdown = true,
                help = false
            },
            server_opts_overrides = {},

            suggestion = {
                enabled = true,
                auto_trigger = false,
                hide_during_completion = false,
                debounce = 25,
                keymap = {
                    accept = false,
                    accept_word = false,
                    accept_line = "<Tab>",
                    next = false,
                    prev = false,
                    dismiss = false
                }
            }
        })
    end
}, -- Bridge Copilot -> nvim-cmp
{
    "zbirenbaum/copilot-cmp",
    dependencies = {"zbirenbaum/copilot.lua"},
    config = function()
        require("copilot_cmp").setup()
    end
}}

