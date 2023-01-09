local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

configs.setup({
  -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ensure_installed = {
    "css",
    "scss",
    "regex",
    "go",
    "rst",
    "typescript",
    "json",
    "solidity",
    "scala",
    "lua",
    "http",
    "toml",
    "comment",
    "vim",
    "godot_resource",
    "jsdoc",
    "dockerfile",
    "turtle",
    "jsonc",
    "yaml",
    "python",
    "r",
    "cpp",
    "gomod",
    "bash",
    "cmake",
    "html",
    "help",
    "java",
    "make",
    "kotlin",
    "markdown",
    "hcl",
    -- seldom use
    --
  },
  sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
  ignore_install = { "scala", "hjson", "cuda", "tsx", "query", "json5", "fish", "latex", "llvm", "swift" }, -- List of parsers to ignore installing
  autopairs = {
    enable = true,
  },
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { "" }, -- list of language that will be disabled
    additional_vim_regex_highlighting = true,
  },
  indent = { enable = true, disable = { "yaml" } },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
})
