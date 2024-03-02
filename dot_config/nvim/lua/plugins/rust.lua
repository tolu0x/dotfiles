return {

  {
    "saecki/crates.nvim",
    version = "v0.3.0",
    lazy = true,
    ft = { "rust", "toml" },
    event = { "bufread", "bufreadpre", "bufnewfile" },
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("crates").setup({
        popup = {
          border = "rounded",
        },
      })
    end,
  },

  -- rust tools --
  {

    "mrcjkb/rustaceanvim",
    version = "^3", -- recommended
    ft = { "rust" },
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "lvimuser/lsp-inlayhints.nvim",
        opts = {},
      },
    },
    config = function()
      vim.g.rustaceanvim = {
        inlay_hints = {
          highlight = "NonText",
        },
        tools = {
          hover_actions = {
            auto_focus = true,
          },
        },
        server = {
          on_attach = function(client, bufnr)
            require("lsp-inlayhints").on_attach(client, bufnr)
          end,
          standalone = false,
        },
        settings = {
          -- rust-analyzer language server configuration
          ["rust-analyzer"] = {},
        },
      }
    end,
  },
}
