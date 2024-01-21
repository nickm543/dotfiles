require("lazy").setup({
    "williamboman/mason.nvim",
    { "morhetz/gruvbox", name = "gruvbox", priority = 1000 },
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    "nvim-lualine/lualine.nvim",
    "nvim-tree/nvim-web-devicons",
    "tpope/vim-surround",
    "tpope/vim-commentary",
    "rafamadriz/friendly-snippets",
    "L3MON4D3/LuaSnip",
        dependencies = { "rafamadriz/friendly-snippets" },
    "jlcrochet/vim-razor",
    "windwp/nvim-autopairs",
    "nvim-telescope/telescope-fzf-native.nvim",
        build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-tree.lua",
})
