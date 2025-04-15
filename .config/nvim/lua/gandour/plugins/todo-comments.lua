return {
	"folke/todo-comments.nvim",
	optional = true,
	event = { "BufReadPre", "BufNewFile" },
	dependencies = { "nvim-lua/plenary.nvim" },
    config = function ()
        require("todo-comments").setup()
    end,
	keys = {
		{
			"<leader>ft",
			function()
				Snacks.picker.todo_comments()
			end,
			desc = "Todo",
		},
		{
			"<leader>fT",
			function()
				Snacks.picker.todo_comments({ keywords = { "TODO", "FIX", "FIXME" } })
			end,
			desc = "Todo/Fix/Fixme",
		},
	},
}
