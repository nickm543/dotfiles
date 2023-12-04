local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    "williamboman/mason.nvim",
    "morhetz/gruvbox",
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
}

local opts = {}

require("lazy").setup(plugins, opts)
require("mason").setup()
require("lualine").setup()
require("nvim-autopairs").setup()
require("luasnip.loaders.from_vscode").lazy_load()
require("nvim-tree").setup()
require("settings")
