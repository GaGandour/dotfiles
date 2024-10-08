return {
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    config = function()
        local home = vim.fn.expand("$HOME")
        require("chatgpt").setup({
            api_key_cmd = "cat " .. home .. "/.secrets/chatgpt_key.txt",
            openai_params = {
                model = "gpt-4o"
            },
            openai_edit_params = {
                model = "gpt-4o"
            }
        })
    end,
    dependencies = {
        "MunifTanjim/nui.nvim",
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim",
    },

}
