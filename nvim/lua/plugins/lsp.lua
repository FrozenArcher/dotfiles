-- plugins.lsp: lspconfig, mason

local lsp_ensure_installed = {
	"lua_ls",
	"pyright",
	"clangd",
	"rust_analyzer",
	"gopls",
	"bashls",
}

local lsp_specific_settings = {
	["lua_ls"] = {
		Lua = {
			completion = {
				callSnippet = "Replace",
			},
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
		},
	},
}

return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			{
				"folke/neodev.nvim",
				opts = {},
			},
			"RRethy/vim-illuminate",
			"hrsh7th/cmp-nvim-lsp",
			-- "lukas-reineke/lsp-format.nvim",
			{
				"j-hui/fidget.nvim",
				branch = "legacy",
				opts = {},
			},
		},
		config = function()
			-- Set up Mason before anything else
			require("mason").setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})
			require("mason-lspconfig").setup({
				ensure_installed = lsp_ensure_installed,
				automatic_installation = true,
			})

			-- vim-illuminate
			require("illuminate").configure({
				providers = {
					"lsp",
					"treesitter",
					"regex",
				},
				delay = 100,
			})

			-- Set up lsp-format
			-- require("lsp-format").setup({})

			-- Set up cool signs for diagnostics
			local signs = { Error = "E", Warn = "W", Hint = "H", Info = "I" }
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
			end

			-- Diagnostic config
			local config = {
				virtual_text = true,
				signs = {
					active = signs,
				},
				update_in_insert = true,
				underline = true,
				severity_sort = true,
				float = {
					focusable = true,
					style = "minimal",
					border = "rounded",
					source = "always",
					header = "",
					prefix = "",
				},
			}
			vim.diagnostic.config(config)

			-- This function gets run when an LSP connects to a particular buffer.
			-- local on_attach = function(client, bufnr)
			-- 	require("lsp-format").on_attach(client)
			-- end

			-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

			-- attach each server
			for i = 1, #lsp_ensure_installed do
				local server = lsp_ensure_installed[i]
				local server_settings = {}

				if lsp_specific_settings[server] ~= nil then
					server_settings = lsp_specific_settings[server]
				end

				require("lspconfig")[server].setup({
					on_attach = on_attach,
					capabilities = capabilities,
					settings = server_settings,
				})
			end
		end,
	},
}
