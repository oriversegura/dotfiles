-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")


-- Configurar wl-copy como clipboard provider
if vim.fn.has('clipboard') then
  vim.opt.clipboard:append("unnamedplus")
  vim.g.clipboard = {
    name = 'wl-copy',
    copy = {
      ['+'] = 'wl-copy --noprogress --trim-newline',
      ['*'] = 'wl-copy --noprogress --trim-newline',
      ['x'] = 'wl-copy --noprogress --trim-newline',
    },
    paste = {
      ['+'] = 'wl-paste --no-newline',
      ['*'] = 'wl-paste --no-newline',
      ['x'] = 'wl-paste --no-newline',
    },
    cache_enabled = 0,
  }
end

