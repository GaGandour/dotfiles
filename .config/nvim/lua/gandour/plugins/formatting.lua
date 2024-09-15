return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				json = { "prettier" },
				yaml = { "prettier" },
				lua = { "stylua" },
				python = { "isort", "black" },
				clojure = { "joker" },
				cpp = { "my_c_formatter" },
			},
			-- format_on_save = {
			--     lsp_fallback = true,
			--     async = false,
			--     timeout_ms = 1000,
			-- },
			formatters = {
				my_c_formatter = {
					command = "clang-format",
					args = '--style="{BasedOnStyle: llvm, IndentWidth: 4, ColumnLimit: 120, AllowShortIfStatementsOnASingleLine: true, AllowShortLoopsOnASingleLine: true, AllowShortFunctionsOnASingleLine: true}"',
				},
			},
		})

		require("conform").formatters.black = {
			prepend_args = function(self, ctx)
				return { "--line-length", "120" }
			end,
		}

		vim.keymap.set({ "n", "v" }, "<leader>mp", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 3000,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
