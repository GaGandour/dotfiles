return {
    {
        "williamboman/mason-lspconfig.nvim",
        opts = {
			-- list of servers for mason to install
			ensure_installed = {
				"lua_ls",
				"ruff",
				"basedpyright",
				"gopls",
				"buf_ls",
				"clangd",
				"clojure_lsp",
				"terraformls",
			},
        },
        dependencies = {
            {
                "williamboman/mason.nvim",
                opts = {
                    ui = {
                        icons = {
                            package_installed = "✓",
                            package_pending = "➜",
                            package_uninstalled = "✗",
                        },

                        -- ui config
                        border = "rounded",
                    },
                },
            },
            "neovim/nvim-lspconfig",
        },
    },
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        opts = {
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
        },
        dependencies = {
            "williamboman/mason.nvim",
        },
    }
}
