{...}: {
  plugins = {
    clangd-extensions = {
      enable = true;
      enableOffsetEncodingWorkaround = true;

      settings = {
        inlay_hints.inline = "true";

        ast = {
          role_icons = {
            type = "";
            declaration = "";
            expression = "";
            specifier = "";
            statement = "";
            templateArgument = "";
          };

          kind_icons = {
            compound = "";
            recovery = "";
            translationUnit = "";
            packExpansion = "";
            templateTypeParm = "";
            templateTemplateParm = "";
            templateParamObject = "";
          };
        };
      };
    };

    lsp.servers.clangd = {
      enable = true;
      package = null;
    };

    conform-nvim.settings.formatters_by_ft = {
      cpp = ["clang-format"];
    };
  };
}
