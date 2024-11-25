return {
  {
    "stevearc/conform.nvim",
    event = { 'BufWritePre', 'BufNewFile' },
    config = function()
      require "configs.conform"
    end,
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
    opts = {
      ensure_installed = {
        "ts_ls",
        "pyright",
        "ruff",
        "nil_ls",
        "rust_analyzer"
      }
    }
  },
  --
  {
    "williamboman/mason.nvim",
  },
  {
    "tpope/vim-fugitive",
    lazy = false,
  },
  { "sainnhe/gruvbox-material" },
  {
    "ggandor/leap.nvim",
    enabled = true,
    keys = {
      { "s",  mode = { "n", "x", "o" }, desc = "Leap Forward to" },
      { "S",  mode = { "n", "x", "o" }, desc = "Leap Backward to" },
      { "gs", mode = { "n", "x", "o" }, desc = "Leap from Windows" },
    },
    config = function()
      require 'configs.leap'
    end,
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({})
    end
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "javascript",
        "typescript",
        "tsx",
        "python",
        "haskell",
        "vim",
        "lua",
        "vimdoc",
        "nix",
        "rust"
      },
    },
  },
}
