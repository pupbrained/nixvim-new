{
  lib,
  helpers,
  ...
}: {
  plugins = {
    lspkind.enable = true;
    luasnip.enable = true;

    cmp_luasnip.enable = true;

    cmp = {
      enable = true;
      autoEnableSources = true;
      settings = {
        snippet.expand = ''
          function(args)
            require("luasnip").lsp_expand(args.body)
          end
        '';

        window = {
          documentation.border = "rounded";
          completion = {
            border = "rounded";
            scrollbar = false;
          };
        };

        sources = [
          {name = "copilot";}
          {name = "luasnip";}
          {name = "nvim_lsp";}
          {name = "nvim_lsp_signature_help";}
          {name = "path";}
          {name = "buffer";}
        ];

        formatting.format = lib.mkForce ''
          require('lspkind').cmp_format({
            maxwidth = 120,
            ellipsis_char = '...',
            symbol_map = { Copilot = "", }
          })
        '';

        mapping = helpers.mkRaw ''
          cmp.mapping.preset.insert({
            ['<C-b>'] = cmp.mapping.scroll_docs(-4),
            ['<C-f>'] = cmp.mapping.scroll_docs(4),
            ['<C-Space>'] = cmp.mapping.complete(),
            ['<C-e>'] = cmp.mapping.abort(),
            ['<CR>'] = cmp.mapping.confirm({ select = true }),
          })
        '';
      };
    };
  };
}
