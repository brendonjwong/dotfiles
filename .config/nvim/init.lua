-- ========== OPTIONS ==========

vim.opt.history = 50
vim.opt.ruler = true
vim.opt.showcmd = true
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.mouse = "a"
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.backup = false
vim.opt.undofile = false
vim.opt.number = true
vim.opt.ignorecase = true

vim.cmd("syntax on")
vim.cmd("filetype plugin indent on")

-- Color settings
vim.cmd("highlight Pmenu ctermbg=white")

-- ========== COLORSCHEME ==========

vim.cmd("colorscheme slate")

-- ========== LEADERS ==========

vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- ========== KEYMAPS ==========

-- Window navigation
vim.keymap.set("n", "<C-j>", "<cmd>wincmd j<CR>", { silent = true })
vim.keymap.set("n", "<C-k>", "<cmd>wincmd k<CR>", { silent = true })
vim.keymap.set("n", "<C-h>", "<cmd>wincmd h<CR>", { silent = true })
vim.keymap.set("n", "<C-l>", "<cmd>wincmd l<CR>", { silent = true })

-- Tab jumps to matching enclosure
vim.keymap.set("n", "<tab>", "%")
vim.keymap.set("v", "<tab>", "%")

-- Clear search highlights
vim.keymap.set("n", "<leader><space>", "<cmd>noh<CR>")

-- Q formats instead of Ex mode
vim.keymap.set("n", "Q", "gq")

-- FZF
vim.keymap.set("n", "<leader>F", "<cmd>FZF<CR>")
vim.keymap.set("n", "<leader>f", "<cmd>Rg<CR>")
vim.keymap.set("n", "<leader>G", "<cmd>GFiles<CR>")

-- ========== AUTOCOMMANDS ==========

local augroup = vim.api.nvim_create_augroup

-- Restore cursor position on file open
vim.api.nvim_create_autocmd("BufReadPost", {
  group = augroup("restore_cursor", { clear = true }),
  callback = function()
    local line = vim.fn.line("'\"")
    if line >= 1 and line <= vim.fn.line("$") then
      vim.cmd("normal! g`\"")
    end
  end,
})

-- Text files: wrap at 78 chars
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("text_width", { clear = true }),
  pattern = "text",
  callback = function() vim.opt_local.textwidth = 78 end,
})

-- Python indentation
vim.api.nvim_create_autocmd("BufReadPost", {
  group = augroup("python_indent", { clear = true }),
  pattern = "*.py",
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.softtabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.expandtab = true
    vim.opt_local.autoindent = true
  end,
})

-- Rainbow parentheses for Lisp-family languages
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("rainbow_lisp", { clear = true }),
  pattern = { "lisp", "clojure", "scheme" },
  command = "RainbowParentheses",
})

-- Autoformat Clojure with cljstyle
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("autoformat_settings", { clear = true }),
  pattern = "clojure",
  command = "AutoFormatBuffer cljstyle",
})

-- Conjure test keymaps
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("conjure_settings", { clear = true }),
  pattern = "clojure",
  callback = function()
    local opts = { silent = true, buffer = true }
    vim.keymap.set("n", "<localleader>tn", "<cmd>CcaNreplRunTestsInTestNs<CR>", opts)
    vim.keymap.set("n", "<localleader>tf", "<cmd>CcaNreplJumpToFailingCljTest<CR>", opts)
    vim.keymap.set("n", "<localleader>tc", "<cmd>CcaNreplRunCurrentTest<CR>", opts)
    vim.keymap.set("n", "<localleader>tt", "<cmd>CcaNreplRunCurrentTest<CR>", opts)
  end,
})

-- ========== COMMANDS ==========

-- Cljstyle formatter command
vim.api.nvim_create_user_command("Cljstyle", function()
  local cwd = vim.fn.getcwd()
  local winsave = vim.fn.winsaveview()
  vim.cmd("cd " .. vim.fn.expand("%:p:h"))
  vim.cmd("%!cljstyle pipe")
  vim.cmd("cd " .. cwd)
  vim.fn.winrestview(winsave)
end, {})

-- ========== PLUGINS (vim-plug) ==========

local plug = vim.fn["plug#"]

vim.call("plug#begin", "~/.local/share/nvim/plugged")

plug("dense-analysis/ale")
plug("junegunn/rainbow_parentheses.vim")
plug("nvim-treesitter/nvim-treesitter", { ["do"] = ":TSUpdate" })
plug("tpope/vim-dispatch")
plug("tpope/vim-surround")
plug("tpope/vim-vinegar")

-- Code formatting
plug("google/vim-maktaba")
plug("google/vim-codefmt")

-- Git/GitHub
plug("tpope/vim-fugitive")
plug("tpope/vim-rhubarb")
plug("github/copilot.vim")

-- FZF
plug("junegunn/fzf", { ["do"] = "fzf#install()" })
plug("junegunn/fzf.vim")

-- Terraform
plug("hashivim/vim-terraform")

-- Clojure
plug("guns/vim-sexp")
plug("Olical/conjure", { ["for"] = "clojure" })
plug("https://gitlab.com/invertisment/conjure-clj-additions-cider-nrepl-mw", { ["for"] = "clojure" })

vim.call("plug#end")

-- ========== PLUGIN SETTINGS ==========

-- vim-sexp
vim.g.sexp_insert_after_wrap = false
vim.g.sexp_filetypes = "clojure"
vim.g.sexp_mappings = {
  sexp_emit_head_element    = "(",
  sexp_emit_tail_element    = "<",
  sexp_capture_prev_element = ")",
  sexp_capture_next_element = ">",
}

-- ALE
vim.g.ale_linters = { clojure = { "clj-kondo" } }

-- Conjure: disable default test mappings (replaced above)
vim.g["conjure#client#clojure#nrepl#mapping#run_alternate_ns_tests"] = false
vim.g["conjure#client#clojure#nrepl#mapping#run_current_ns_tests"] = false
vim.g["conjure#client#clojure#nrepl#mapping#run_current_test"] = false

-- ========== TREESITTER ==========

vim.opt.runtimepath:append(vim.fn.stdpath("data") .. "/site")

local ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not ok then return end

treesitter.setup({
  ensure_installed = { "clojure", "lua", "markdown", "vim" },
  sync_install = false,
  auto_install = false,
  highlight = {
    enable = true,
    disable = function(lang, buf)
      local max_filesize = 100 * 1024
      local ok2, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
      if ok2 and stats and stats.size > max_filesize then
        return true
      end
    end,
    additional_vim_regex_highlighting = false,
  },
})
