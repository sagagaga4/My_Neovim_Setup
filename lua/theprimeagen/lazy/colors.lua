-- Function to set the colorscheme and apply highlight settings
function ColorMyPencils(color)
    color = color or "rose-pine"
    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {
    -- TokyoNight theme configuration
    {
        "folke/tokyonight.nvim",
        config = function()
            require("tokyonight").setup({
                style = "storm", -- Options: 'storm', 'moon', 'night', 'day'
                transparent = true, -- Enable transparency
                terminal_colors = true, -- Set terminal colors
                styles = {
                    comments = { italic = false },
                    keywords = { italic = false },
                    sidebars = "dark",
                    floats = "dark",
                },
            })
        end,
    },

    -- Rose Pine theme configuration
    {
        "rose-pine/neovim",
        name = "rose-pine",
        config = function()
            require('rose-pine').setup({
                disable_background = true, -- Enable transparency
            })
            -- Set colorscheme and apply highlight settings
            vim.cmd("colorscheme rose-pine")
            ColorMyPencils()
        end,
    },

    -- Catppuccin theme configuration
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000, -- Load before or after other plugins
        config = function()
            require('catppuccin').setup({
                transparent_background = true, -- Enable transparency
            })
            vim.cmd("colorscheme catppuccin")
            ColorMyPencils()
        end,
    },

    -- Solarized Osaka theme configuration
    {
        "craftzdog/solarized-osaka.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            -- Apply the Solarized Osaka colorscheme
            vim.cmd("colorscheme solarized-osaka")
            ColorMyPencils()
        end,
    },
}

