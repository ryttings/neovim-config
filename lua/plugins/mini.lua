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
    end
}
