local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
  return
end

treesitter.setup({
  highlight = {
    enable = true,
  },
  autotag = { enable = true },
  ensure_installed = {
    "rust",
    "json",
    "php",
    "yaml",
    "bash",
    "lua",
    "vim",
    "dockerfile",
    "gitignore",
  },
  auto_install = true,
})
