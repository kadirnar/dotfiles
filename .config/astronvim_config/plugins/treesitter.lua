return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      { "andymass/vim-matchup", init = function() vim.g.matchup_matchparen_deferred = 1 end },
      {
        "HiPhish/rainbow-delimiters.nvim",
        opts = function()
          return {
            strategy = {
              [""] = function()
                if not vim.b.large_buf then return require("rainbow-delimiters").strategy.global end
              end,
            },
          }
        end,
        config = function(_, opts) require "rainbow-delimiters.setup"(opts) end,
      },
    },
    opts = {
      auto_install = vim.fn.executable "tree-sitter" == 1,
      matchup = { enable = true },
    },
  },

  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    -- add more things to the ensure_installed table protecting against community packs modifying it
    opts.ensure_installed = require("astronvim.utils").list_insert_unique(opts.ensure_installed, {
      -- "lua"
    })
  end,
}
