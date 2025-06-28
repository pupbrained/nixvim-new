{pkgs, ...}: let
  mkVimPlugin = sources:
    pkgs.vimUtils.buildVimPlugin {
      inherit (sources) src pname version;
      doCheck = false;
    };

  sources = import ../../_sources/generated.nix {inherit (pkgs) fetchFromGitHub fetchgit fetchurl dockerTools;};

  extraPlugins = pkgs.lib.attrsets.mapAttrsToList (_: value: mkVimPlugin value) sources;
in {
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

  extraPlugins = with pkgs.vimPlugins;
    [vim-cool]
    ++ extraPlugins;

  extraConfigLua = ''
    vim.diagnostic.config({
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = ' ',
          [vim.diagnostic.severity.WARN] = ' ',
          [vim.diagnostic.severity.HINT] = ' ',
          [vim.diagnostic.severity.INFO] = ' ',
        },
      },
      float = {
        border = 'rounded',
      },
      virtual_text = {
        prefix = function(diagnostic)
          if diagnostic.severity == vim.diagnostic.severity.ERROR then
            return ' '
          elseif diagnostic.severity == vim.diagnostic.severity.WARN then
            return ' '
          elseif diagnostic.severity == vim.diagnostic.severity.HINT then
            return ' '
          else
            return ' '
          end
        end,
      },
    })
  '';
}
