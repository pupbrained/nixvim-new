{icons, ...}: {
  performance.byteCompileLua = {
    enable = true;
    nvimRuntime = true;
  };

  plugins = {
    lz-n.enable = true;
    web-devicons.enable = true;
    nvim-autopairs.enable = true;
  };

  highlightOverride = {
    Pmenu.bg = "#11111b";
    NoiceCmdLinePopup.bg = "#11111b";
    NotifyBackground.bg = "#11111b";
    TelescopeNormal.bg = "#11111b";
    TelescopeBorder.bg = "#11111b";
    MsgArea.bg = "#11111b";
    NormalFloat.bg = "#11111b";
    SnacksNormal.bg = "#11111b";
    FloatBorder.bg = "#11111b";
  };

  extraConfigLua = ''
    local signs = {
      Hint = "${icons.diagnostics.BoldHint}",
      Info = "${icons.diagnostics.BoldInformation}",
      Warn = "${icons.diagnostics.BoldWarning}",
      Error = "${icons.diagnostics.BoldError}",
    }

    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end

    vim.diagnostic.config({
      virtual_text = false,
      underline = true,
      signs = true,
      severity_sort = true,
      float = {
        border = "rounded",
        source = "always",
        focusable = false,
      },
    })
  '';
}
