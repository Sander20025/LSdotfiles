return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
      filesystem = {
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_gitignored = false,
          hide_by_name = {},
        },
      },
      event_handlers = {
        {
          event = "file_opened",
          handler = function()
            require("neo-tree.command").execute({ action = "close" })
          end,
        },
      },
    })

    -- Automatically open Neo-tree on startup, without stealing focus
    vim.api.nvim_create_autocmd("VimEnter", {
      callback = function()
        require("neo-tree.command").execute({ position = "right", toggle = false })
        vim.cmd("wincmd p") -- Return focus to the previous window
      end,
    })

    -- Always display numbers (including for Neo-tree)
    vim.api.nvim_create_autocmd("BufEnter", {
      callback = function()
        vim.opt_local.number = true
        vim.opt_local.relativenumber = true
      end,
    })

    -- Highlight settings for Neo-tree
    vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "NONE", fg = "#abb2bf" })
    vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = "NONE", fg = "#abb2bf" })
    vim.api.nvim_set_hl(0, "NeoTreeCursorLine", { bg = "#2a2a2a", fg = "NONE" })
    vim.api.nvim_set_hl(0, "NeoTreeVertSplit", { bg = "NONE", fg = "#444444" })
    vim.api.nvim_set_hl(0, "NeoTreeEndOfBuffer", { bg = "NONE", fg = "#444444" })

    -- Map <leader>e to toggle Neo-tree visibility
    vim.keymap.set("n", "<leader>e", function()
      require("neo-tree.command").execute({ toggle = true, position = "right" })
    end, { desc = "Toggle Neo-tree" })
  end,
}

