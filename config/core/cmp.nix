_: {
  plugins = {
    blink-copilot.enable = true;
    blink-ripgrep.enable = true;

    blink-cmp = {
      enable = true;

      settings = {
        keymap = {
          "<Enter>" = [
            "select_and_accept"
            "fallback"
          ];
          "<C-n>" = ["select_next"];
          "<C-p>" = ["select_prev"];
          "<C-u>" = ["scroll_documentation_up"];
          "<C-d>" = ["scroll_documentation_down"];
          "<C-space>" = [
            "show"
            "show_documentation"
            "hide_documentation"
          ];
        };

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
