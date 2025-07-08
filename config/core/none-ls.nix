_: {
  plugins = {
    lsp-format.enable = true;

    none-ls = {
      enable = true;
      enableLspFormat = true;
      lazyLoad.settings.event = "LspAttach";
    };
  };
}
