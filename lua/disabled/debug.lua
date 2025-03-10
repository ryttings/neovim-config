return {
   {
      "folke/lazydev.nvim",
      config = function()
         require("lazydev").setup({
            library = { "nvim-dap-ui" },
         })
      end
   },
   {
      "rcarriga/nvim-dap-ui",
      dependencies = { "mfussenegger/nvim-dap",
         "nvim-neotest/nvim-nio" }
   },
   {
      "mfussenegger/nvim-dap",
      config = function()
         local dap = require("dap")
         dap.adapters.gdb = {
            type = "executable",
            command = "gdb",
            args = { "--interpreter=dap", "--eval-command", "set print pretty on" }
         }
         dap.adapters.lldb = {
            type = 'executable',
            command = '/usr/bin/lldb-vscode',  -- adjust as needed, must be absolute path
            name = 'lldb'
         }
         dap.configurations.cpp = {
            {
               name = 'Launch',
               type = 'gdb',
               request = 'launch',
               program = function()
                  return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
               end,
               cwd = '${workspaceFolder}',
               stopOnEntry = false,
               args = {},

               -- 💀
               -- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
               --
               --    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
               --
               -- Otherwise you might get the following error:
               --
               --    Error on launch: Failed to attach to the target process
               --
               -- But you should be aware of the implications:
               -- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
               -- runInTerminal = false,
            },
            {
               name = 'Attach to gdbserver :1234',
               type = 'gdb',
               request = 'attach',
               target = 'localhost:1234',
               program = function()
                  return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
               end,
               cwd = '${workspaceFolder}'
            },

         }
      end
   }
}
