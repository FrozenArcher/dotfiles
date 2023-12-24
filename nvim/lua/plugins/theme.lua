-- plugins.theme: colorscheme plugin
return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	lazy = false,
	config = function()
		require("catppuccin").setup({
			flavour = "macchiato",
			integrations = {
				nvimtree = false,
				hop = true,
				lsp_saga = true,
				mason = true,
				neotree = true,
				which_key = true,
			},
			styles = {
				keywords = { "bold" },
				loops = { "italic" },
				functions = { "italic" },
				types = { "bold" },
			},
		})
		vim.cmd.colorscheme("catppuccin")
	end,
}
