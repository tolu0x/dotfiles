return {
  "epwalsh/obsidian.nvim",
  lazy = true,
  event = {
    "BufReadPre " .. vim.fn.expand("~") .. "/vaults/**.md",
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "hrsh7th/nvim-cmp",
  },
  config = function()
    local obsidian = require("obsidian")
    obsidian.setup({
      dir = "~/vaults/brain",
      daily_notes = {
        folder = "notes/dailies",
        date_format = "%Y-%m-%d",
        alias_format = "%B %-d, %Y",
      },
      completion = {
        nvim_cmp = true,
        min_chars = 2,
        new_notes_location = "current_dir",
        prepend_note_id = true,
        prepend_note_path = false,
      },
      follow_url_func = function(url)
        vim.fn.jobstart({ "xdg-open", "--new-tab", url })
      end,
    })
  end,
}
