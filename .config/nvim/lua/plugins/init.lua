return {
-- Telescope
{
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
    require('telescope').setup{}
    end
},

-- FZF
{
    'junegunn/fzf',
    build = ':call fzf#install()'
},
'junegunn/fzf.vim',

-- Tmux Navigation
{
    'alexghergh/nvim-tmux-navigation',
    config = function()
    require('nvim-tmux-navigation').setup {
        disable_when_zoomed = true,
        keybindings = {
        left = "<C-h>",
        down = "<C-j>",
        up = "<C-k>",
        right = "<C-l>"
        }
    }
    end
},

-- Treesitter
{
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
    require('nvim-treesitter.configs').setup {
        ensure_installed = { "lua", "vim", "javascript", "python" },
        highlight = {
        enable = true,
        },
    }
    end
},

-- Lualine
{
    'nvim-lualine/lualine.nvim',
    config = function()
    require('lualine').setup {
        options = {
        theme = 'auto',
        component_separators = '|',
        section_separators = '',
        }
    }
    end
},

-- NvimTree
{
    'nvim-tree/nvim-tree.lua',
    dependencies = {
    'nvim-tree/nvim-web-devicons',
    },
    config = function()
    require('nvim-tree').setup {
        sort_by = "case_sensitive",
        view = {
        width = 30,
        },
        renderer = {
        group_empty = true,
        },
        filters = {
        dotfiles = true,
        },
    }
    end
}
}
