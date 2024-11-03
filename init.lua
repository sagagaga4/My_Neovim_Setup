-- Initialize lazy.nvim
require("sag")
vim.opt.rtp:prepend(vim.fn.stdpath("data") .. "/lazy/lazy.nvim")
-- Setup plugins
require("lazy").setup({
  {
    "nvim-lua/plenary.nvim"
  },
  {
    "sag/harpoon",
    config = function()
      local status, harpoon = pcall(require, "harpoon")
      if not status then
        print("Failed to load harpoon:", harpoon)
        return
      end
      harpoon.setup()
      -- Key mappings
      vim.keymap.set("n", "<leader>a", function() harpoon.mark.add_file() end, { noremap = true, silent = true })
      vim.keymap.set("n", "<C-e>", function() harpoon.ui.toggle_quick_menu() end, { noremap = true, silent = true })
      vim.keymap.set("n", "<C-h>", function() harpoon.ui.navigate(1) end, { noremap = true, silent = true })
      vim.keymap.set("n", "<C-t>", function() harpoon.ui.navigate(2) end, { noremap = true, silent = true })
      vim.keymap.set("n", "<C-n>", function() harpoon.ui.navigate(3) end, { noremap = true, silent = true })
      vim.keymap.set("n", "<C-s>", function() harpoon.ui.navigate(4) end, { noremap = true, silent = true })
    end
  },
  {
    "nvim-neotest/neotest",
    config = function()
      require("neotest").setup({
        -- Configuration options for neotest
      })
    end
  },
  {
    "nvim-neotest/nvim-nio"
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "vimdoc", "javascript", "typescript", "c", "lua", "rust", "jsdoc", "bash" },
        sync_install = false,
        auto_install = true,
        indent = { enable = true },
        highlight = { enable = true, additional_vim_regex_highlighting = { "markdown" } }
      })
    end
  },
  {
    "nvim-treesitter/nvim-treesitter-playground"
  }
})
-- ~/.config/nvim/init.lua

-- Load custom settings
require("sag.set")

