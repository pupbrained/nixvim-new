_: {
  config.plugins.trouble = {
    enable = true;

    settings = {
      focus = true;

      modes = {
        diagnostics = {
          title = "Diagnostics";
          mode = "diagnostics";
          preview = {
            type = "split";
            relative = "win";
            position = "right";
            size = 0.4;
          };
        };
      };
    };
  };
}
