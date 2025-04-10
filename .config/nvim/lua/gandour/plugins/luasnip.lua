-- Filename: ~/github/dotfiles-latest/neovim/neobean/lua/plugins/luasnip.lua
-- ~/github/dotfiles-latest/neovim/neobean/lua/plugins/luasnip.lua

-- This allows me to create my custom snippets
-- All you need to do, if using the lazyvim.org distro, is to enable the
-- coding.luasnip LazyExtra and then add this file

-- If you're a dotfiles scavenger, definitely watch this video (you're welcome)
-- https://youtu.be/FmHhonPjvvA?si=8NrcRWu4GGdmTzee

return {
	"L3MON4D3/LuaSnip",
	enabled = true,
	opts = function(_, opts)
		local ls = require("luasnip")

		vim.keymap.set({ "i", "s" }, "<C-j>", function()
			if ls.choice_active() then
				ls.change_choice(1)
			end
		end)

		vim.keymap.set({ "i", "s" }, "<C-k>", function()
			if ls.choice_active() then
				ls.change_choice(-1)
			end
		end)

		local s = ls.snippet
		local c = ls.choice_node
		local t = ls.text_node
		local i = ls.insert_node

		-- #####################################################################
		--                            Markdown
		-- #####################################################################

		-- Helper function to create code block snippets
		local function create_code_block_snippet(lang)
			return s({
				trig = lang,
				name = "Codeblock",
				desc = lang .. " codeblock",
			}, {
				t({ "```" .. lang, "" }),
				i(1),
				t({ "", "```" }),
			})
		end

		-- Define languages for code blocks
		local languages = {
			"txt",
			"lua",
			"sql",
			"go",
			"regex",
			"bash",
			"markdown",
			"markdown_inline",
			"yaml",
			"json",
			"jsonc",
			"cpp",
			"csv",
			"java",
			"javascript",
			"python",
			"dockerfile",
			"html",
			"css",
			"templ",
			"php",
		}

		-- Generate snippets for all languages
		local snippets = {}

		for _, lang in ipairs(languages) do
			table.insert(snippets, create_code_block_snippet(lang))
		end

		ls.add_snippets("markdown", snippets)

		-- #####################################################################
		--                           PYTHON
		-- #####################################################################

		ls.add_snippets("python", {
			s({
				trig = "def",
				name = "Function",
				desc = "Python function",
			}, {
				t("def "),
				i(1, "function_name"),
				t("("),
				i(2, "args"),
				t({ "):", "\t" }),
				i(0),
			}),
		})

		ls.add_snippets("python", {
			s({
				trig = "log",
				name = "Log",
				desc = "logging log",
			}, {
				t("logging."),
				c(1, {
					t("debug"),
					t("info"),
					t("warning"),
					t("error"),
					t("exception"),
					t("critical"),
				}),
				t("("),
				i(2),
				t(")"),
			}),
		})

		return opts
	end,
}
