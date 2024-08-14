return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.5",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local telescope = require('telescope')
    local builtin = require('telescope.builtin')

    -- Set up Telescope with default settings
    telescope.setup({
      defaults = {
        -- You can add default settings here if needed
      },
    })

    local search_dir = vim.fn.expand(*ADD YOUR DESIRED FOLDER*) -- Expand the path for the user's home directory

    -- Key mappings for Telescope with restricted search directory
    vim.keymap.set('n', '<leader>pf', function()
      builtin.find_files({ cwd = search_dir })
    end, { noremap = true, silent = true })

    vim.keymap.set('n', '<C-p>', function()
      builtin.git_files({ cwd = search_dir })
    end, { noremap = true, silent = true })

    vim.keymap.set('n', '<leader>pws', function()
      local word = vim.fn.expand("<cword>")
      builtin.grep_string({ search = word, cwd = search_dir })
    end, { noremap = true, silent = true })

    vim.keymap.set('n', '<leader>pWs', function()
      local word = vim.fn.expand("<cWORD>")
      builtin.grep_string({ search = word, cwd = search_dir })
    end, { noremap = true, silent = true })

    vim.keymap.set('n', '<leader>ps', function()
      builtin.grep_string({ search = vim.fn.input("Grep > "), cwd = search_dir })
    end, { noremap = true, silent = true })

    vim.keymap.set('n', '<leader>vh', function()
      builtin.help_tags({ cwd = search_dir })
    end, { noremap = true, silent = true })
  end
}

