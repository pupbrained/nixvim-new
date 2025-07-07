{...}: {
  plugins = {
    lsp.servers = {
      nixd = {
        enable = true;
        packageFallback = true;
      };

      statix = {
        enable = true;
        packageFallback = true;
      };
    };
    conform-nvim.settings.formatters_by_ft.nix = ["alejandra"];
  };
}
