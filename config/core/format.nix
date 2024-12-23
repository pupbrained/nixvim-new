{
  lib,
  pkgs,
  ...
}: {
  plugins.conform-nvim = {
    enable = true;

    lazyLoad.settings = {
      event = "BufWritePre";
      cmd = "ConformInfo";
    };

    settings = {
      format_on_save = {
        timeout_ms = 1000;
        lsp_fallback = true;
      };

      formatters_by_ft = {
        "_" = [
          "squeeze_blanks"
          "trim_whitespace"
          "trim_newlines"
        ];
      };

      formatters = {
        squeeze_blanks = {
          command = lib.getExe' pkgs.coreutils "cat";
        };
      };
    };
  };
}
