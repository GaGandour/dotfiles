return {
  "editor-code-assistant/eca-nvim",
  dependencies = {
    "MunifTanjim/nui.nvim",   -- Required: UI framework
    "nvim-lua/plenary.nvim",  -- Optional: Enhanced async operations
  },
  keys = {
    { "<leader>aa", "<cmd>EcaChat<cr>", desc = "Open ECA chat" },
  },
  opts = {
    debug = false,
    server_path = "",
    behavior = {
      auto_set_keymaps = true,
      auto_focus_sidebar = true,
    },
  }
}
