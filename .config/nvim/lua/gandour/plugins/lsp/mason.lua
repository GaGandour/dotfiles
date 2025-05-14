return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = function()
        -- 	-- import mason
        local mason = require("mason")
        --
        -- 	-- import mason-lspconfig
        local mason_lspconfig = require("mason-lspconfig")
        --
        local mason_tool_installer = require("mason-tool-installer")
        --
        -- 	-- enable mason and configure icons
        mason.setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },

                -- ui config
                border = "rounded",
            },
        })
        --
        mason_lspconfig.setup({
            -- list of servers for mason to install
            ensure_installed = {
                "lua_ls",
                "ruff",
                "jedi_language_server",
                "gopls",
                "buf_ls",
                "clangd",
                "clojure_lsp",
                "terraformls",
            },
            -- auto-install configured servers with lspconfig
            automatic_installation = true, -- not the same as ensure_installed
        })
        --
        mason_tool_installer.setup({
            ensure_installed = {
                "prettier", -- prettier formatter
                "stylua", -- lua formatter
                "isort", -- python formatter
                "black", -- python formatter
                "pylint", -- python linter
                "joker", -- clojure linter and formatter
                "clang-format", -- C/C++ formatter
                "tflint", -- terraform linter
                "buf_ls", -- protobuf linter
                "debugpy", -- python debugger
            },
        })
    end,
}
