{...}: {
  plugins = {
    copilot-lua.enable = true;

    avante = {
      enable = true;
      settings = {
        provider = "copilot";
        auto_suggestions_provider = "copilot";
        suggestion.debounce = 500;
      };
    };
  };
}
