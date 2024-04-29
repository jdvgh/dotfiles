return {
  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      -- [[ Configure Treesitter ]] See `:help nvim-treesitter`

      ---@diagnostic disable-next-line: missing-fields
      require 'nvim-treesitter.configs'.setup {
        -- A list of parser names, or "all"
        ensure_installed = { "bash", "html", "markdown", "vim", "vimdoc", "lua", "go", "json", "yaml", "dockerfile", "gotmpl", "gosum", "gomod", "gowork" },
        -- ensure_installed = "all",
        -- Install parsers synchronously (only applied to `ensure_installed`)
        sync_install = false,

        -- Automatically install missing parsers when entering buffer
        -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
        auto_install = true,

        highlight = {
          enable = true,
        },
        indent = { enable = true },

      }

      local parser_config = require 'nvim-treesitter.parsers'.get_parser_configs()
      parser_config.gotmpl.filetype = "gotmpl"
    end
  }
}
-- vim: ts=2 sts=2 sw=2 et
