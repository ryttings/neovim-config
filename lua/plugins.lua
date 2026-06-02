vim.pack.add({
   { src = "https://github.com/lewis6991/gitsigns.nvim" },
})

require('gitsigns').setup({ signcolumn = false })

vim.pack.add({
   { src = "https://github.com/mason-org/mason.nvim" },
})

vim.pack.add({
   { src = "https://github.com/saghen/blink.cmp", version = vim.version.range("^1") },
})

require('blink.cmp').setup({
   fuzzy = { implementation = 'prefer_rust_with_warning' },
   signature = { enabled = true },
   keymap = {
      preset = "default",
      ["<C-space>"] = {},
      ["<C-p>"] = {},
      ["<Tab>"] = {},
      ["<S-Tab>"] = {},
      ["<C-y>"] = { "show", "show_documentation", "hide_documentation" },
      ["<Right>"] = { "select_and_accept" },
      ["<C-k>"] = { "select_prev", "fallback" },
      ["<C-j>"] = { "select_next", "fallback" },
      ["<C-b>"] = { "scroll_documentation_down", "fallback" },
      ["<C-f>"] = { "scroll_documentation_up", "fallback" },
      ["<C-l>"] = { "snippet_forward", "fallback" },
      ["<C-h>"] = { "snippet_backward", "fallback" },
      -- ["<C-e>"] = { "hide" },
   },

   appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = "normal",
   },

   completion = {
      documentation = {
         auto_show = true,
         auto_show_delay_ms = 200,
      }
   },
   cmdline = {
      keymap = {
         preset = 'inherit',
         ['<CR>'] = { 'accept_and_enter', 'fallback' },
      },
   },
   sources = { default = { "lsp" } }
})

require("mason").setup({})

vim.pack.add({
   { src = "https://github.com/ibhagwan/fzf-lua" },
})

local actions = require('fzf-lua.actions')
require('fzf-lua').setup({
   winopts = { backdrop = 85 },
   keymap = {
      builtin = {
         ["<C-f>"] = "preview-page-down",
         ["<C-b>"] = "preview-page-up",
         ["<C-p>"] = "toggle-preview",
      },
      fzf = {
         ["ctrl-a"] = "toggle-all",
         ["ctrl-t"] = "first",
         ["ctrl-g"] = "last",
         ["ctrl-d"] = "half-page-down",
         ["ctrl-u"] = "half-page-up",
      }
   },
   actions = {
      files = {
         ["ctrl-q"] = actions.file_sel_to_qf,
         ["ctrl-n"] = actions.toggle_ignore,
         ["ctrl-h"] = actions.toggle_hidden,
         ["enter"]  = actions.file_edit_or_qf,
      }
   }
})

vim.pack.add({
   { src = "https://github.com/nvim-mini/mini.nvim" }
})

local gen_spec = require('mini.ai').gen_spec
require('mini.ai').setup({
   -- Table with textobject id as fields, textobject specification as values.
   -- Also use this to disable builtin textobjects. See |MiniAi.config|.
   custom_textobjects = {
      c = gen_spec.treesitter({ a = '@class.outer', i = '@class.inner' }),
      f = gen_spec.treesitter({ a = '@function.outer', i = '@function.inner' }),
      F = gen_spec.treesitter({ a = '@funtion.outer', i = '@function.inner' }),
      i = gen_spec.treesitter({ a = '@block.outer', i = '@block.inner' }),
      e = gen_spec.treesitter({ a = '@value.outer', i = '@symbol.inner' }),
      s = gen_spec.treesitter({ a = '@assignment.outer', i = '@assignment.inner' }),
   },
   -- Module mappings. Use `''` (empty string) to disable one.
   mappings = {
      -- Main textobject prefixes
      around = 'a',
      inside = 'i',
      -- Next/last textobjects
      around_next = 'an',
      inside_next = 'in',
      around_last = 'al',
      inside_last = 'il',
      -- Move cursor to corresponding edge of `a` textobject
      goto_left = 'gh',
      goto_right = 'gl',
   },
   -- Number of lines within which textobject is searched
   n_lines = 150,
   -- How to search for object (first inside current line, then inside
   -- neighborhood). One of 'cover', 'cover_or_next', 'cover_or_prev',
   -- 'cover_or_nearest', 'next', 'prev', 'nearest'.
   search_method = 'cover_or_next',
   -- Whether to disable showing non-error feedback
   -- This also affects (purely informational) helper messages shown after
   -- idle time if user input is required.
   silent = false,
})
require('mini.indentscope').setup()
require('mini.operators').setup()

local ts_input = require('mini.surround').gen_spec.input.treesitter
require('mini.surround').setup(
   {
      custom_surroundings = {
         -- Use tree-sitter to search for function call
         f = {
            input = ts_input({ outer = '@call.outer', inner = '@call.inner' })
         },
         F = {
            input = ts_input({ outer = '@function.outer', inner = '@function.inner' })
         },
         c = {
            input = ts_input({ outer = '@class.outer', inner = '@class.inner' })
         },
         i = {
            input = ts_input({ outer = '@block.outer', inner = '@block.inner' })
         },
         t = {
            input = ts_input({ outer = '@type.outer', inner = '@type.inner' })
         },
         q = {
            input = ts_input({ outer = '@qualifier.inner', inner = '@qualifier.inner' })
         },
      }
   })
require('mini.operators').setup()

require('mini.icons').setup()

require('mini.files').setup({
   mappings = {
      close       = '<ESC>',
      go_in       = 'l',
      go_in_plus  = 'L',
      go_out      = 'h',
      go_out_plus = 'H',
      mark_goto   = "'",
      mark_set    = 'm',
      reset       = '<BS>',
      reveal_cwd  = '@',
      show_help   = 'g?',
      synchronize = '=',
      trim_left   = '<',
      trim_right  = '>',
      set_cwd     = '.',
   },
})
vim.keymap.set("n", "<leader>l", "<CMD>lua MiniFiles.open()<CR>")
vim.keymap.set("n", "<leader>;", function()
   MiniFiles.open(vim.api.nvim_buf_get_name(0), false)
end
)

vim.pack.add({ src = "https://github.com/MeanderingProgrammer/render-markdown.nvim" })
vim.pack.add({ src = "https://github.com/petertriho/nvim-scrollbar" })

