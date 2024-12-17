return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "williamboman/mason.nvim", -- Mason to manage LSP installations
    "williamboman/mason-lspconfig.nvim", -- Integrates Mason with lspconfig
    "hrsh7th/cmp-nvim-lsp", -- LSP source for nvim-cmp
    { "antosha417/nvim-lsp-file-operations", config = true }, -- File operations like renaming
    { "folke/neodev.nvim", opts = {} }, -- Lua development enhancements
  },
  config = function()
    -- Import necessary plugins
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local lspconfig = require("lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    -- Setup Mason
    mason.setup()

    -- Setup Mason-LSPConfig with automatic installation
    mason_lspconfig.setup({
      ensure_installed = { "lua_ls", "pyright", "svelte", "graphql", "emmet_ls" },
      automatic_installation = true,
    })

    -- Define custom capabilities for LSP servers
    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- Set up diagnostic signs
    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    -- Set keymaps on LSP attach
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        local opts = { buffer = ev.buf, silent = true }
        local keymap = vim.keymap

        -- Set LSP keybindings
        keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
        keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)
        keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)
        keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
        keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)
        keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
        keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
        keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
        keymap.set("n", "K", vim.lsp.buf.hover, opts)
        keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
      end,
    })

    -- Setup handlers for specific LSP servers
    mason_lspconfig.setup_handlers({
      -- Default handler for all installed servers
      function(server_name)
        lspconfig[server_name].setup({
          capabilities = capabilities,
        })
      end,
      ["lua_ls"] = function()
        lspconfig.lua_ls.setup({
          capabilities = capabilities,
          settings = {
            Lua = {
              diagnostics = { globals = { "vim" } },
              workspace = { library = vim.api.nvim_get_runtime_file("", true), checkThirdParty = false },
              telemetry = { enable = false },
            },
          },
        })
      end,
      ["svelte"] = function()
        lspconfig.svelte.setup({
          capabilities = capabilities,
          on_attach = function(client, bufnr)
            vim.api.nvim_create_autocmd("BufWritePost", {
              pattern = { "*.js", "*.ts" },
              callback = function(ctx)
                client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.match })
              end,
            })
          end,
        })
      end,
      ["graphql"] = function()
        lspconfig.graphql.setup({
          capabilities = capabilities,
          filetypes = { "graphql", "gql", "typescriptreact", "javascriptreact", "svelte" },
        })
      end,
      ["emmet_ls"] = function()
        lspconfig.emmet_ls.setup({
          capabilities = capabilities,
          filetypes = { "html", "css", "scss", "javascriptreact", "typescriptreact", "svelte" },
        })
      end,
    })
  end,
}

