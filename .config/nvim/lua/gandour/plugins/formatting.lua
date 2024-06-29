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
            },
            -- format_on_save = {
            --     lsp_fallback = true,
            --     async = false,
            --     timeout_ms = 1000,
            -- },
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
