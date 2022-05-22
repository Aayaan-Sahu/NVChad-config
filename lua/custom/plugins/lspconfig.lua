-- local M = {}
--
-- M.setup_lsp = function(attach, capabilities)
--    local lspconfig = require "lspconfig"
--
--    local config = {
--     -- disable virtual text
--     virtual_text = false,
--     -- show signs
--     signs = {
--       active = signs,
--     },
--     update_in_insert = true,
--     underline = true,
--     severity_sort = true,
--     float = {
--     focusable = false,
--     style = "minimal",
--     border = "rounded",
--     source = "always",
--     header = "",
--     prefix = "",
--     },
--   }
--
--   vim.diagnostic.config(config)
--
--    -- lspservers with default config
--    local servers = { "html", "cssls", "clangd", "jdtls", "jsonls", "pylsp", "rust_analyzer", "sumneko_lua", "tsserver" }
--
--    for _, lsp in ipairs(servers) do
--       lspconfig[lsp].setup {
--          on_attach = attach,
--          capabilities = capabilities,
--          flags = {
--             debounce_text_changes = 150,
--          },
--       }
--    end
-- end
--
-- return M


local M = {}

M.setup_lsp = function(attach, capabilities)
  local signs = {
    { name = "DiagnosticSignError", text = "" },
    { name = "DiagnosticSignWarn", text = "" },
    { name = "DiagnosticSignHint", text = "" },
    { name = "DiagnosticSignInfo", text = "" },
  }

  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
  end

  local config = {
    -- disable virtual text
    virtual_text = false,
    -- show signs
    signs = {
      active = signs,
    },
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
      focusable = false,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    },
  }

  vim.diagnostic.config(config)

  local lsp_installer = require("nvim-lsp-installer")

  lsp_installer.on_server_ready(
    function(server)
      local opts = {
        on_attach = attach,
        capabilities = capabilities,
        flags = {
          debounce_text_changes = 150,
        },
        settings = {},
      }

      if server.name == "solargraph" then
        opts.root_dir = function() return vim.loop.cwd() end
      end

      if server.name == "ccls" then
        opts.root_dir = function() return vim.loop.cwd() end
      end

      server:setup(opts)
      vim.cmd [[ do User LspAttachBuffers ]]
    end
  )

end

return M
