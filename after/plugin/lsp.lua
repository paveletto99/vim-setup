local lsp = require("lsp-zero")
local lspconfig = require("lspconfig")

lsp.preset("recommended")

lsp.ensure_installed({
  -- 'tsserver',
  'rust_analyzer',
  'gopls',
  'yamlls',
  'zls',
  'jsonnet_ls',
  'terraformls',
})



-- Fix Undefined global 'vim'
lsp.configure('lua-language-server', {
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      }
    }
  }
})

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  ["<C-Space>"] = cmp.mapping.complete(),
})

cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

lsp.set_preferences({
  suggest_lsp_servers = false,
  sign_icons = {
    -- error = 'E',
    -- warn = 'W',
    -- hint = 'H',
    -- info = 'I'
    error = "✘",
    warn = "▲",
    hint = "⚑",
    info = "»"
  }
})




lsp.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-i>", function() vim.lsp.buf.signature_help() end, opts)
  -- vim.keymap.set("i", "<leader>h", function() vim.lsp.buf.signature_help() end, opts)
end)

lsp.setup()

vim.diagnostic.config({
  virtual_text = true
})

-- golang

lspconfig.gopls.setup({
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
      gofumpt = true,
    },
  },
})

-- ZIG
lspconfig.zls.setup({
  -- Server-specific settings. See `:help lspconfig-setup`

  -- omit the following line if `zls` is in your PATH
  cmd = { '/home/pobo/myspace/zig/zls/zig-out/bin/zls' },
  -- There are two ways to set config options:
  --   - edit your `zls.json` that applies to any editor that uses ZLS
  --   - set in-editor config options with the `settings` field below.
  --
  -- Further information on how to configure ZLS:
  -- https://zigtools.org/zls/configure/
  settings = {
    zls = {
      -- Whether to enable build-on-save diagnostics
      --
      -- Further information about build-on save:
      -- https://zigtools.org/zls/guides/build-on-save/
      -- enable_build_on_save = true,

      -- omit the following line if `zig` is in your PATH
      zig_exe_path = '/usr/bin/zig'
    }
  }
})

lspconfig.yamlls.setup {
  settings = {
    yaml = {
      schemas = {
        kubernetes = "globPattern",
        --["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.22.0-standalone-strict/all.json"] = "/*.yaml",
      },
    },
  },
}

lspconfig.terraformls.setup {
  vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    pattern = { "*.tf", "*.tfvars" },
    callback = function()
      vim.lsp.buf.format()
    end,
  })
}
-- https://github.com/grafana/jsonnet-language-server/tree/main/editor/vim

lspconfig.jsonnet_ls.setup {
  settings = {
    ext_vars = {
      foo = 'bar',
    },
    formatting = {
      -- default values
      Indent              = 2,
      MaxBlankLines       = 2,
      StringStyle         = 'single',
      CommentStyle        = 'slash',
      PrettyFieldNames    = true,
      PadArrays           = false,
      PadObjects          = true,
      SortImports         = true,
      UseImplicitPlus     = true,
      StripEverything     = false,
      StripComments       = false,
      StripAllButComments = false,
    },
  },
}
