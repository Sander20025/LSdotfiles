return {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      -- DevOps & Infrastructure
      "yaml-language-server", -- YAML
      "terraform-ls",         -- Terraform
      "bash-language-server", -- Bash
      "dockerls",             -- Dockerfile
      "json-lsp",             -- JSON
      "ansible-language-server", -- Ansible
      "markdownlint",         -- Markdown linting
      "helm-ls",              -- Helm Charts
    },
  },
}
