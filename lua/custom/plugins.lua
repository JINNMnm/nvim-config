local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
  {
    "AckslD/swenv.nvim" ,
    dependencies = {
      'stevearc/dressing.nvim'
    },
    config = function()
      require "custom.configs.swenv"
    end,
    -- lazy = false,
  },
  {
    'stevearc/dressing.nvim',
    opts = {},
    -- lazy = false,
  },

  {
    "mfussenegger/nvim-dap",
    config = function(_, opts)
      require("core.utils").load_mappings("dap")
      require "custom.configs.nvim_dap"
    end,
    ft = {
      "python",
      "cpp",
    }
  },

  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },
    config = function(_, opts)
      local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(path)
      require "custom.configs.dap_python"
      require("core.utils").load_mappings("dap_python")
    end,
  },

  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      require "custom.configs.dap-ui"
    end
  },

  {
    "cdelledonne/vim-cmake",
    -- config = function()
    --   require "custom.configs.vim_cmake"
    -- end,
    ft = "cpp",
  },

  {
    "jay-babu/mason-nvim-dap.nvim",
    event = "VeryLazy",
    ft = "cpp",
    dependencies = {
      "mfussenegger/nvim-dap",
      "williamboman/mason.nvim",
    },
    config = function()
      require "custom.configs.mason_nvim_dap"
    end,
  },

  {
    'github/copilot.vim',
    config = function()
      require "custom.configs.copilot"
    end,
    ft = {
      "python",
      "cpp",
      "java",
    }
  },

  {
    'preservim/tagbar',
    ft = {
      "python",
      "cpp",
      "java",
    }
  }
}

return plugins
