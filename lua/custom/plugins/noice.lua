return {
  "folke/noice.nvim",

  event = "VeryLazy",
  opts = {

    lsp = {
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
      },
    },

    presets = {
      long_message_to_split = true, -- long messages will be sent to a split
      lsp_doc_border = true,
    },

    cmdline = {
      format = {
        cmdline = { pattern = "^:", icon = "🮲🮳", lang = "vim" },
      },
    },

    views = {

      cmdline_popup = {

        position = {
          row = 5,
          col = "50%",
        },

        size = {
          width = 60,
          height = "auto",
        },
      },

      popupmenu = {

        relative = "editor",
        position = {
          row = 8,
          col = "50%",
        },

        size = {
          width = 60,
          height = 10,
        },

        border = {
          style = "rounded",
          padding = { 0, 1 },
        },

        win_options = {
          winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
        },
      },
    },


  },


  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    "MunifTanjim/nui.nvim",
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
    "rcarriga/nvim-notify",
  }
}