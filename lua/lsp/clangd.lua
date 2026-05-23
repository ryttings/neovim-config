
-- ▾▾▾ C++ ▾▾▾ --
--- @type vim.lsp.config
return {
   cmd = {
      "clangd",
      "--background-index",
      "--clang-tidy",
      "-j=8",
   },
   filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
   capabilities = vim.tbl_deep_extend('force', capabilities, {
      offsetEncoding = { "utf-16" },
   }),
   root_markers = {
      "compile_commands.json",
      ".clangd",
      ".clang-tidy",
      ".clang-format",
      "CMakeLists.txt",
      "compile_flags.txt",
      "configure.ac",
      ".git",
      vim.uv.cwd(),
   },
}
vim.lsp.enable("clangd")
-- ^^^ C++ ^^^ --


