-- =========================================
--  LSP (New Native API)
-- =========================================
local lsp = vim.lsp

local servers = {
	"lua_ls",
	"clangd",
	"html",
	"gopls",
	"pyright",
	"zls",
	"c3lsp",
}

for _, server in ipairs(servers) do
	lsp.config(server, {
		capabilities = require("cmp_nvim_lsp").default_capabilities(),
		settings = {},
	})
	lsp.enable(server)
end

vim.lsp.config["zls"] = {
	cmd = { "zls" },
	filetypes = { "zig" },
	root_markers = { "build.zig" },
	settings = {
		zls = {
			zig_exe_path = "zig",
		},
	},
}
vim.lsp.enable("zls")

vim.lsp.config["gopls"] = {
	cmd = { "gopls" },
	filetypes = { "go" },
	root_markers = { "go.mod" },
}
vim.lsp.enable("gopls")

vim.lsp.config["clangd"] = {
	cmd = { "clangd" },
	filetypes = { "c", "cpp" },
}
vim.lsp.enable("clangd")

vim.lsp.config["c3lsp"] = {
	cmd = { "c3lsp" },
	filetypes = { "c3", "c3i" },
}
vim.lsp.enable("c3lsp")
