_: {
  plugins = {
    blink-copilot.enable = true;
    blink-ripgrep.enable = true;

    blink-cmp = {
      enable = true;

      settings = {
        sources = {
          providers = {
            copilot = {
              async = true;
              module = "blink-copilot";
              name = "copilot";
              score_offset = 101;
            };

            ripgrep = {
              async = true;
              module = "blink-ripgrep";
              name = "Ripgrep";
              score_offset = 100;
            };
          };

          default = [
            "lsp"
            "copilot"
            "ripgrep"
            "snippets"
            "path"
            "buffer"
          ];
        };
      };
    };
  };
}
