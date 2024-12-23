{
  colorschemes.catppuccin = {
    enable = true;
    lazyLoad.enable = true;

    settings = {
      flavour = "mocha";
      term_colors = true;

      integrations = {
        dap.enabled = true;
        fidget = true;
        gitsigns = true;
        illuminate.enabled = true;
        mini.enabled = true;
        navic.enabled = true;
        nvimtree = true;
        telescope.enabled = true;
        treesitter_context = true;
        treesitter = true;

        indent_blankline = {
          enabled = true;
          colored_indent_levels = true;
        };

        native_lsp = {
          enabled = true;
          inlay_hints.background = false;

          virtual_text = {
            errors = ["italic"];
            hints = ["italic"];
            warnings = ["italic"];
            information = ["italic"];
          };

          underlines = {
            errors = ["undercurl"];
            hints = ["undercurl"];
            warnings = ["undercurl"];
            information = ["undercurl"];
          };
        };
      };

      styles = {
        booleans = ["bold" "italic"];
        conditionals = ["bold"];
        functions = ["bold"];
        keywords = ["italic"];
        loops = ["bold"];
        operators = ["bold"];
        properties = ["italic"];
      };
    };
  };
}
