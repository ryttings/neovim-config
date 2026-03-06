return {
   "mfussenegger/nvim-dap",
   config = function()
      local dap = require("dap")
      dap.adapters.gdb = {
         type = "executable",
         command = "gdb",
         args = { "--interpreter=dap", "--eval-command", "set print pretty on", "--eval-command", "target extended-remote p700-9554bc76" }
      }
      require('dap.ext.vscode').load_launchjs(nil, {})

      vim.fn.sign_define('DapBreakpoint', { text = '🟥', texthl = '', linehl = '', numhl = '' })
      vim.fn.sign_define('DapStopped', { text = '▶️', texthl = '', linehl = '', numhl = '' })
      vim.keymap.set('n', '<F10>', require 'dap'.continue)
      vim.keymap.set('n', '<F3>', require 'dap'.step_over)
      vim.keymap.set('n', '<leader>di', require 'dap'.step_into)
      vim.keymap.set('n', '<leader>do', require 'dap'.step_out)
      vim.keymap.set('n', '<F8>', require 'dap'.toggle_breakpoint)
      vim.keymap.set('n', '<leader>dr', function() require('dap').repl.open() end)

      local widgets = require('dap.ui.widgets')
      vim.keymap.set('n', '<leader>dl', function()
         widgets.sidebar(widgets.scopes).open()
      end)
      vim.keymap.set('n', '<leader>dq', function()
         widgets.preview()
      end)
   end
}
