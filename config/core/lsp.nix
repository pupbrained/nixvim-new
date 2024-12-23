{...}: {
  plugins = {
    lsp = {
      enable = true;
      inlayHints = true;
    };

    lsp-lines = {
      enable = true;
      lazyLoad.settings.event = "LspAttach";
    };
  };
}
