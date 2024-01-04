local configs = require("nvim-treesitter.configs")
configs.setup({
  -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ensure_installed = {
    "regex",
    "lua",
    "vim",
    "json",
    "markdown",
    "make",
    "bash",
    --[[ "css", ]]
    --[[ "scss", ]]
    --[[ "go", ]]
    --[[ "rst", ]]
    --[[ "typescript", ]]
    --[[ "solidity", ]]
    --[[ "scala", ]]
    --[[ "http", ]]
    --[[ "toml", ]]
    --[[ "comment", ]]
    --[[ "godot_resource", ]]
    --[[ "jsdoc", ]]
    --[[ "dockerfile", ]]
    --[[ "turtle", ]]
    --[[ "jsonc", ]]
    --[[ "yaml", ]]
    --[[ "python", ]]
    --[[ "r", ]]
    --[[ "cpp", ]]
    --[[ "gomod", ]]
    --[[ "cmake", ]]
    --[[ "html", ]]
    --[[ "help", ]]
    --[[ "java", ]]
    --[[ "kotlin", ]]
    --[[ "hcl", ]]
    -- seldom use
    --
  },
  auto_install = true, -- Automatically install missing parsers when entering buffer
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
