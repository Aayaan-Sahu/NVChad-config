-- This is an example chadrc file , its supposed to be placed in /lua/custom/

-- local M = {}

-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:

-- M.ui = {
--   theme = "onedark",
-- }

-- Install plugins
-- local userPlugins = require "custom.plugins"
--

--
-- M.plugins = {
--   options = {
--     lspconfig = {
--       setup_lspconf = "custom.plugins.lspconfig",
--     },
--   },
--   status = {
--     dashboard = true,
--   },
--   install = userPlugins,
-- }
--
-- return M







local M = {}

local userPlugins = require "custom.plugins"

M.plugins = {
  options = {
    lspconfig = {
      setup_lspconf = "custom.plugins.lspconfig",
    },
  },

  install = userPlugins,
}

M.ui = {
  theme = "onedark",
}

M.options = {
  shiftwidth = 4,
}

return M
