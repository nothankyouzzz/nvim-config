local M = {}

local lspconfig = require("lspconfig")
local which_key = require("which-key")
local cmd = require("core.keymap").cmd

M.servers = {
  "sumneko_lua",
  "clangd",
  "pyright",
}

M.setup = function()
  local default_keymaps = function()
    which_key.register({
      ["l"] = {
        name = "LSP",
        ["a"] = { cmd("Lspsaga code_action"), "Code Action" },
        ["r"] = { cmd("Lspsaga lsp_finder"), "Go Reference" },
        ["n"] = { cmd("Lspsaga diagnostic_jump_next"), "Next Diagnostic" },
        ["p"] = { cmd("Lspsaga diagnostic_jump_prev"), "Prev Diagnostic" },
        ["s"] = { cmd("Lspsaga show_cursor_diagnosics"), "Show Diagnostic" },
        ["f"] = { vim.lsp.buf.format, "Format" },
      },
    }, {
      prefix = "<Leader>",
      buffer = 0,
    })

    which_key.register({
      ["K"] = { cmd("Lspsaga hover_doc"), "Hover Doc" },
      ["rn"] = { cmd("Lspsaga rename"), "Rename" },
      ["gd"] = { cmd("Lspsaga peek_definition"), "Peek Definition" },
    }, { buffer = 0 })
  end

  vim.tbl_map(function(server)
    require("lsp." .. server).setup(lspconfig, require("cmp_nvim_lsp").default_capabilities(), default_keymaps)
  end, M.servers)
end

return M
