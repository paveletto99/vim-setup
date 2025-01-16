local dap = require('dap')
local dapui = require('dapui')
local dap_virtual_text = require('nvim-dap-virtual-text')
local rust_tools = require('rust-tools')
local go_tools = require('dap-go')


-- Setup dap-ui
dapui.setup()

-- Setup nvim-dap-virtual-text
dap_virtual_text.setup()

-- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation#ccrust-via-lldb-vscode
-- Configure the LLDB adapter for nvim-dap
dap.adapters.lldb = {
  type = 'executable',
  command = '/usr/bin/lldb-vscode-15', -- Adjust as needed; ensure 'lldb-vscode' is in your PATH
  name = 'lldb'
}

-- Configure the CodeLLDB adapter for nvim-dap
dap.adapters.codelldb = {
  type = 'server',
  port = "${port}",
  executable = {
    -- Adjust the following path to where you installed codelldb
    command = '/path/to/codelldb/extension/adapter/codelldb',
    args = { "--port", "${port}" },
  }
}

-- Configure debugging configurations for Zig
dap.configurations.zig = {
  {
    name = 'Launch',
    type = 'lldb',
    request = 'launch',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/zig-out/bin/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    args = {},

    -- If you encounter issues with LLDB on Windows, you might need to set the runInTerminal option to true
    -- runInTerminal = true,
  },
}

-- Configure debugging configurations for Rust
dap.configurations.rust = {
  {
    name = 'Launch',
    type = 'codelldb',
    request = 'launch',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/target/debug/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    args = {},
  },
}

-- Open dap-ui automatically when debugging starts
dap.listeners.after.event_initialized['dapui_config'] = function()
  dapui.open()
end

-- Close dap-ui automatically when debugging ends
dap.listeners.before.event_terminated['dapui_config'] = function()
  dapui.close()
end
dap.listeners.before.event_exited['dapui_config'] = function()
  dapui.close()
end


go_tools.setup()
-- require('dap-go').setup {
--   delve = {
--     build_flags = "-tags=your_build_tags",
--   },
-- }

-- Setup rust-tools with nvim-dap integration
rust_tools.setup({
  dap = {
    adapter = dap.adapters.codelldb,
  },
})

dap.set_log_level('TRACE')
