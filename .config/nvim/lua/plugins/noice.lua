return {
    {
      "folke/noice.nvim",
      opts = function(_, opts)
        opts.routes = opts.routes or {}
        table.insert(opts.routes, {
          filter = { event = "notify", find = "No information available" },
          opts = { skip = true },
        })
        opts.lsp = opts.lsp or {}
        opts.lsp.progress = { enabled = false }
        opts.presets = opts.presets or {}
        opts.presets.lsp_doc_border = true
      end,
    },
  }  

