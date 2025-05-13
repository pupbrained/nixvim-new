{...}: {
  imports = with builtins;
    map (fn: ./${fn})
    (filter (fn: fn != "default.nix") (attrNames (readDir ./.)));

  plugins.snacks = {
    enable = true;
    settings = {
      zen.enabled = false;
      zoom.enabled = false;
      indent.enabled = false;

      bigfile.enabled = true;

      quickfile.enabled = true;
      scroll.enabled = false;

      statuscolumn = {
        enabled = true;
        folds = {
          open = true;
          git_hl = true;
        };
      };

      words = {
        debounce = 100;
        enabled = true;
      };
    };
  };
}
