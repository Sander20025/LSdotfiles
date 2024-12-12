require("core.options")
require("core.keymaps")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		error("Error cloning lazy.nvim:\n" .. out)
	end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	require("plugins.themes.sonokai"), -- Load theme
	require("plugins.lsp"),
	require("plugins.indent-blankline"),
	require("plugins.mason"),
  require("plugins.alpha"),
  require("plugins.noice"),
	require("plugins.neo-tree"), -- File explorer
	require("plugins.treesitter"), -- Syntax highlighting
	require("plugins.telescope"), -- Fuzzy finder
	require("plugins.autocompletion"), -- Autocompletion setup
	require("plugins.bufferline"), -- see wich files we are working on
	require("plugins.lualine"),
	require("plugins.gitsigns"),
})

