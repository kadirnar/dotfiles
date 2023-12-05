-- customize mason plugins
return {
  -- use mason-lspconfig to configure LSP installations
  {
    "williamboman/mason-lspconfig.nvim",
    -- overrides `require("mason-lspconfig").setup(...)`
    opts = function(_, opts)
      -- add more things to the ensure_installed table protecting against community packs modifying it
      opts.ensure_installed = require("astronvim.utils").list_insert_unique(opts.ensure_installed, {
        "lua_ls",
        "bashls",
        "dockerls",
        "gopls",
        "html",
        "jsonls",
        "pyright",
        "rust_analyzer",
        "tsserver",
        "vimls",
        "yamlls",
        -- c, c++
        "clangd",
        -- java
        "jdtls",
        -- "arduino-language-server",
        -- "asm-lsp",
        -- yaml
        "yamlls",
      })
    end,
  },
  -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
  {
    "jay-babu/mason-null-ls.nvim",
    -- overrides `require("mason-null-ls").setup(...)`
    opts = function(_, opts)
      -- add more things to the ensure_installed table protecting against community packs modifying it
      opts.ensure_installed = require("astronvim.utils").list_insert_unique(opts.ensure_installed, {
        "prettier",
        "stylua",
        "eslint",
        "autopep8",
        "black",
        "isort",
        "flake8",
        "shellcheck",
        "shfmt",
        -- yaml
        "yamllint",
        -- c, c++
        -- "clang-format",
      })
    end,
  },
  -- use mason-nvim-dap to configure DAP installation
  {
    "jay-babu/mason-nvim-dap.nvim",
    -- overrides `require("mason-nvim-dap").setup(...)`
    opts = function(_, opts)
      -- add more things to the ensure_installed table protecting against community packs modifying it
      opts.ensure_installed = require("astronvim.utils").list_insert_unique(opts.ensure_installed, {
        "python",
      })
    end,
  },
}
