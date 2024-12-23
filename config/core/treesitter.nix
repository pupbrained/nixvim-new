{helpers, ...}: {
  plugins = {
    treesitter = {
      enable = true;
      settings = {
        highlight = {
          enable = true;
          disable = helpers.mkRaw ''
            function(lang, buf)
              if lang == 'latex' then
                return true
              end
              local max_filesize = 100 * 1024 -- 100 KB
              local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
              if ok and stats and stats.size > max_filesize then
                  return true
              end
            end
          '';
        };
        incremental_selection.enable = true;
        indent.enable = true;
      };
    };
    treesitter-textobjects = {enable = true;};
  };
}
