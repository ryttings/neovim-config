return {
   'echasnovski/mini.nvim',
   version = false,
   config = function()
      local gen_spec = require('mini.ai').gen_spec
      require('mini.ai').setup({
         -- Table with textobject id as fields, textobject specification as values.
         -- Also use this to disable builtin textobjects. See |MiniAi.config|.
         custom_textobjects = {
            c = gen_spec.treesitter({ a = '@class.outer', i = '@class.inner' }),
            F = gen_spec.treesitter({ a = '@funtion.outer', i = '@function.inner' })
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
      require('mini.surround').setup()
--       require('mini.comment').setup(
--          {
--             -- Options which control module behavior
--             options = {
--                -- Function to compute custom 'commentstring' (optional)
--                custom_commentstring = nil,

--                -- Whether to ignore blank lines when commenting
--                ignore_blank_line = true,

--                -- Whether to recognize as comment only lines without indent
--                start_of_line = true,

--                -- Whether to force single space inner padding for comment parts
--                pad_comment_parts = true,
--             },

--             -- Module mappings. Use `''` (empty string) to disable one.
--             mappings = {
--                -- Toggle comment (like `gcip` - comment inner paragraph) for both
--                -- Normal and Visual modes
--                comment = 'gc',

--                -- Toggle comment on current line
--                comment_line = 'gcc',

--                -- Toggle comment on visual selection
--                comment_visual = 'gc',

--                -- Define 'comment' textobject (like `dgc` - delete whole comment block)
--                -- Works also in Visual mode if mapping differs from `comment_visual`
--                textobject = 'gc',
--             },

--             -- Hook functions to be executed at certain stage of commenting
--             hooks = {
--                -- Before successful commenting. Does nothing by default.
--                pre = function() end,
--                -- After successful commenting. Does nothing by default.
--                post = function() end,
--             },
--          })
      require('mini.operators').setup()
      -- require('mini.diff').setup()
      -- require('mini.git').setup()
      -- require('mini.icons').setup()
      -- require('mini.completion').setup({
      --   -- Delay (debounce type, in ms) between certain Neovim event and action.
      --   -- This can be used to (virtually) disable certain automatic actions by
      --   -- setting very high delay time (like 10^7).
      --   delay = { completion = 100, info = 100, signature = 50 },
      --
      --   -- Configuration for action windows:
      --   -- - `height` and `width` are maximum dimensions.
      --   -- - `border` defines border (as in `nvim_open_win()`).
      --   window = {
      --     info = { height = 25, width = 80, border = 'none' },
      --     signature = { height = 25, width = 80, border = 'none' },
      --   },
      --
      --   -- Way of how module does LSP completion
      --   lsp_completion = {
      --     -- `source_func` should be one of 'completefunc' or 'omnifunc'.
      --     source_func = 'completefunc',
      --
      --     -- `auto_setup` should be boolean indicating if LSP completion is set up
      --     -- on every `BufEnter` event.
      --     auto_setup = true,
      --
      --     -- A function which takes LSP 'textDocument/completion' response items
      --     -- and word to complete. Output should be a table of the same nature as
      --     -- input items. Common use case is custom filter/sort.
      --     -- process_items = --<function: MiniCompletion.default_process_items>,
      --   },
      --
      --   -- Fallback action. It will always be run in Insert mode. To use Neovim's
      --   -- built-in completion (see `:h ins-completion`), supply its mapping as
      --   -- string. Example: to use 'whole lines' completion, supply '<C-x><C-l>'.
      --   -- fallback_action = --<function: like `<C-n>` completion>,
      --
      --   -- Module mappings. Use `''` (empty string) to disable one. Some of them
      --   -- might conflict with system mappings.
      --   mappings = {
      --     force_twostep = '<Tab>', -- Force two-step completion
      --     force_fallback = '<C-Tab>', -- Force fallback completion
      --   },
      --
      --   -- Whether to set Vim's settings for better experience (modifies
      --   -- `shortmess` and `completeopt`)
      --   set_vim_settings = true,
      --   })
      -- -- require('mini.extra').setup()
      -- require('mini.files').setup()
   end
}
