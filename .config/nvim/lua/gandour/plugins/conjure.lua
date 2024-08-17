-- This is to work with clojure
return {
	{
		"Olical/conjure",
		ft = { "clojure", "fennel" }, -- etc
		lazy = true,
		init = function()
			-- Set configuration options here
			-- vim.g["conjure#debug"] = true
			vim.g["conjure#mapping#prefix"] = ','
		end,

		-- Optional cmp-conjure integration
		dependencies = { "PaterJason/cmp-conjure" },
	},
	{
		"PaterJason/cmp-conjure",
		lazy = true,
		config = function()
			local cmp = require("cmp")
			local config = cmp.get_config()
			table.insert(config.sources, { name = "conjure" })
			return cmp.setup(config)
		end,
	},
	{ "Olical/aniseed" },
	{ "tpope/vim-dispatch" },
	{ "clojure-vim/vim-jack-in" },
	{ "radenling/vim-dispatch-neovim" },
}
