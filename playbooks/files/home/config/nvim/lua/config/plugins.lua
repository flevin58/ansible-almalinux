-- Bootstrap plugins (native pack)
vim.pack.add({
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter.git", build = ":TSUpdate" },
	{ src = "https://github.com/nvim-lualine/lualine.nvim.git" },
	{ src = "https://github.com/folke/tokyonight.nvim.git" },
	{ src = "https://github.com/nvim-mini/mini.pairs.git" },
	{ src = "https://github.com/nvim-mini/mini.icons.git" },
	{ src = "https://github.com/nvim-tree/nvim-tree.lua.git" },
	{ src = "https://github.com/nvim-tree/nvim-web-devicons.git" },
	{ src = "https://github.com/folke/which-key.nvim.git" },
	{ src = "https://github.com/ibhagwan/fzf-lua.git" },
	{ src = "https://github.com/lukas-reineke/indent-blankline.nvim.git" },
	{ src = "https://github.com/akinsho/toggleterm.nvim.git" },
	{ src = "https://github.com/hrsh7th/nvim-cmp.git" },
	{ src = "https://github.com/hrsh7th/cmp-nvim-lsp.git" },
	{ src = "https://github.com/hrsh7th/cmp-buffer.git" },
	{ src = "https://github.com/saghen/blink.cmp.git" },
	{ src = "https://github.com/stevearc/conform.nvim.git" },
	{ src = "https://github.com/ziglang/zig.vim.git" },
	{ src = "https://github.com/NoahTheDuke/vim-just.git" },
})

vim.cmd.colorscheme("tokyonight")

-- https://github.com/nvim-lualine/lualine.nvim#default-configuration
require("lualine").setup({
	options = {
		theme = "tokyonight",
		disabled_filetypes = { "packer", "NvimTree" },
	},
})
require("mini.pairs").setup()
require("mini.icons").setup()
require("nvim-tree").setup()
require("nvim-web-devicons").setup()
require("which-key").setup()
--require("vim-just").setup()
require("ibl").setup()
require("toggleterm").setup({
	size = 15,
	open_mapping = [[<c-t>]], -- Default: Ctrl + t
	shade_terminals = true,
	shading_factor = 2,
	direction = "float", -- or 'horizontal' / 'vertical' / 'tab'
	float_opts = {
		border = "curved",
		winblend = 0,
	},
})

-- =========================================
--  Formatting (conform)
-- =========================================

require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		-- Conform will run multiple formatters sequentially
		python = { "black" },
		-- You can customize some of the format options for the filetype (:help conform.format)
		rust = { "rustfmt", lsp_format = "fallback" },
		-- Conform will run the first available formatter
		javascript = { "prettierd", "prettier", stop_after_first = true },
		just = { "just" },
		go = { "goimports", "gofumpt" },
		zig = { "zig" },
		c = { "clang-format" },
		cpp = { "clang-format" },
		toml = { "tombi", stop_after_first = true },
		yaml = { "yamlfmt", stop_after_first = true },
		yml = { "yamlfmt", stop_after_first = true },
		zsh = { "shfmt", stop_after_first = true },
		c3 = { "c3fmt", stop_after_first = true },
	},
	formatters = {
		zig = {
			command = "zig",
			args = { "fmt", vim.fn.expand("%") },
		},
		c3fmt = {
			command = "c3fmt",
			args = { vim.fn.expand("%") },
		},
	},
	format_on_save = {
		-- These options will be passed to conform.format()
		timeout_ms = 1000,
		lsp_format = "fallback",
	},
})

-- =========================================
--  Autocompletion (nvim-cmp + blink)
-- =========================================

local cmp = require("cmp")
cmp.setup({
	mapping = cmp.mapping.preset.insert({
		["<CR>"] = cmp.mapping.confirm({ select = true }),
		["<Tab>"] = cmp.mapping.select_next_item(),
		["<S-Tab>"] = cmp.mapping.select_prev_item(),
	}),
	sources = {
		{ name = "nvim_lsp" },
		{ name = "buffer" },
	},
	experimental = { ghost_text = true },
})

pcall(require, "blink.cmp")

-- =========================================
--  Nvim-Tree (File Explorer)
-- =========================================

local nvt_config = {
	sort = {
		sorter = "case_sensitive",
	},
	view = {
		width = 30,
	},
	renderer = {
		group_empty = true,
	},
	filters = {
		dotfiles = true,
	},
}
require("nvim-tree").setup(nvt_config)

-- =========================================
--  Treesitter (Syntax Highlight)
-- =========================================

require("nvim-treesitter").install({ "rust", "go", "javascript", "zig", "c3" })

require("nvim-treesitter").setup({
	ensure_installed = {
		"lua",
		"html",
		"javascript",
		"json",
		"rust",
		"zig",
		"go",
		"c3",
	},
	highlight = { enable = true },
})
