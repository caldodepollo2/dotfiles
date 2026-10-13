-- init.lua - Minimalist config

-- Basic options
local opt = vim.opt
local o   = vim.o
local g   = vim.g

-- Leader (plugin-needed)
g.mapleader      = " "
g.maplocalleader = " "

-- Generic identation
o.expandtab    = true
o.shiftwidth   = 4
o.tabstop      = 4
o.softtabstop  = 4
o.smartindent  = true

-- Search
o.ignorecase = true
o.smartcase  = true

-- Minimal UI
o.number        = true
o.numberwidth   = 2
o.ruler         = false
o.showmode      = false
o.signcolumn    = "yes"
o.cursorline    = true
o.cursorlineopt = "number"

-- System clipboard
o.clipboard = "unnamedplus"

-- Splits
o.splitbelow = true
o.splitright = true

-- Persistent undo
o.undofile = true

-- No swap/backup
o.swapfile = false
o.backup   = false

-- Timeout for keyboard combinations
o.timeoutlen = 400

-- No initial messages
opt.shortmess:append("sI")

-- Generic diagnostics
vim.diagnostic.config({
  virtual_text    = false,
  signs           = true,
  underline       = false,
  update_in_insert = false,
  severity_sort   = true,
})

-- Plugins (native vim.pack)
vim.pack.add({
  -- File browser
  "https://github.com/nvim-tree/nvim-tree.lua",
  "https://github.com/nvim-tree/nvim-web-devicons",

  -- Fuzzy finder
  "https://github.com/nvim-telescope/telescope.nvim",
  "https://github.com/nvim-lua/plenary.nvim",

  -- Autocomplete
  { src = "https://github.com/saghen/blink.cmp", version = vim.version.range("^1") },

  -- Treesitter
  "https://github.com/nvim-treesitter/nvim-treesitter",

  -- Git
  "https://github.com/lewis6991/gitsigns.nvim",

  -- Comments
  "https://github.com/numToStr/Comment.nvim",

  -- Formatting
  "https://github.com/stevearc/conform.nvim",

  -- LSP/formatters/linters
  "https://github.com/williamboman/mason.nvim",
  "https://github.com/neovim/nvim-lspconfig",
})

-- Plugin config

-- nvim-tree
require("nvim-tree").setup()

-- telescope
require("telescope").setup()

-- blink.cmp (autocomplete)
require("blink.cmp").setup({
  keymap    = { preset = "enter" },
  sources   = { default = { "lsp", "path", "buffer" } },
  completion = {
    trigger = {
      show_on_keyword           = false,
      show_on_trigger_character = true,
    },
  },
})

-- gitsigns
require("gitsigns").setup()

-- Comment
require("Comment").setup()

-- conform
require("conform").setup({})

-- mason (LSP/formatters/linters)
require("mason").setup()

-- treesitter (detect filetype and autostart)
require("nvim-treesitter").setup()

vim.api.nvim_create_autocmd("FileType", {
  callback = function(ev)
    local ft   = vim.bo[ev.buf].filetype
    local lang = vim.treesitter.language.get_lang(ft) or ft

    if not vim.treesitter.language.add(lang) then
      if vim.tbl_contains(require("nvim-treesitter").get_available(), lang) then
        require("nvim-treesitter").install(lang):wait(300000)
      else
        return
      end
    end
    pcall(vim.treesitter.start)
  end,
})

-- Generic LSP
-- blink.cmp capabilities
local capabilities = require("blink.cmp").get_lsp_capabilities(
  vim.lsp.protocol.make_client_capabilities()
)

-- Apply capabilities to any LSP server initiated
vim.lsp.config("*", {
  capabilities = capabilities,
})

-- Enabling lsp exmaples:
-- First install with :Mason
-- vim.lsp.enable("lua_ls")
-- vim.lsp.enable("clangd")
-- vim.lsp.enable("rust_analyzer")

-- General autocmds

-- Last position at file opening
vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    if mark[1] > 1 and mark[1] <= vim.api.nvim_buf_line_count(0) then
      vim.api.nvim_win_set_cursor(0, mark)
    end
  end,
})

-- Rename terminal buffers for cleaner :ls
vim.api.nvim_create_autocmd("TermOpen", {
  callback = function()
    pcall(vim.api.nvim_buf_set_name, 0, "term: " .. vim.fn.getcwd())
  end,
})

vim.api.nvim_create_autocmd("DirChanged", {
  pattern = "global",
  callback = function()
    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
      if vim.bo[buf].buftype == "terminal" then
        pcall(vim.api.nvim_buf_set_name, buf, "term: " .. vim.fn.getcwd())
      end
    end
  end,
})

-- UI2 (modern messages)
require("vim._core.ui2").enable()
