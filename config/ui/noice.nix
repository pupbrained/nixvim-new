{
  plugins.notify = {
    enable = true;
    settings.stages = "static";
  };

  plugins.noice = {
    enable = true;
    settings = {
      lsp = {
        override = {
          "vim.lsp.util.convert_input_to_markdown_lines" = true;
          "vim.lsp.util.stylize_markdown" = true;
          "cmp.entry.get_documentation" = true;
        };
        notify.enabled = true;
        hover.enabled = true;
        message.enabled = true;
        signature.enabled = true;
        progress.enabled = true;
      };
    };
  };
}
