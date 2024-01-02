---@type MappingsTable
local M = {}

M.general = {
  n = {
    -- [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<C-d>"] = { "<C-d>zz", "page down and zz", opts = { nowait = true } },
    ["<C-u>"] = { "<C-u>zz", "page up and zz", opts = { nowait = true } },
  },
  v = {
    [">"] = { ">gv", "indent" },
    ["<Leader>y"] = { '"+y' },
    ["J"] = {":m '>+1<CR>gv=gv"},
    ["K"] = {":m '<-2<CR>gv=gv"},
    -- ["H"] = {":normal! 1Xgv=gv"},
    -- ["L"] = {":normal! 1<Space><BS>gv=gv"},
  },
}

-- more keybinds!

-- null-ls
M.null_ls = {
  n = {
    ["<Leader>luf"] = { "<Cmd>lua vim.lsp.buf.format()<CR>", "Format" },
  },
}

-- swenv
M.swenv = {
  n = {
    ["<Leader>cpe"] = { ':lua require("swenv.api").pick_venv()<CR>', "switch environment" },
  },
}

-- dap
M.dap = {
  -- plugin = true,
  n = {
    ["<leader>db"] = { "<cmd> DapToggleBreakpoint <CR>", "Toggle a breakpoint" },
    ["<F7>"] = {"<cmd> lua require'dap'.step_into()<CR>", "Step into"},
    ["<F8>"] = {"<cmd> lua require'dap'.step_over()<CR>", "Step_over"},
    ["<leader>dd"] = {":lua require'dap'.continue()<CR>", "Debug"}
  },
}

-- dap-python
M.dap_python = {
  plugin = true,
  n = {
    ["<leader>dpr"] = {
      ":lua require('dap-python').test_method()",
      "test method in python",
    },
  },
}

M.dap_ui = {
  -- plugin = true,
  n = {
    ["<leader>ui"] = {":lua require(\"dapui\").toggle()<CR>", "Toggle dap ui"}
  }
}

-- M.cmake = {
--   n = {
--     ["<leader>cg"] = {""}
--   }
-- }
M.copilot = {
  i = {
    ["<F1>"] = {":lua require('copilot').Accept('<CR>')", "copilot Accept"}
  }
}

M.nvterm = {
  plugin = true,

  t = {
    ["<leader>T"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
      end,
    },
  },

  n = {
    ["<leader>T"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
      end,
    },
  },
}

M.CMake = {
  n = {
    ["<leader>cg"] = {":CMakeGenerate<CR>", "CMakeGenerate"},

    ["<leader>cb"] = {":CMakeBuild<CR>", "CMakeBuild"},
  }
}

M.tagbar = {
  n = {
    ["<leader>tb"] = {":TagbarToggle<CR>", "Toggle Tagbar"}
  }
}
return M
