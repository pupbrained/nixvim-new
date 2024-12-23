{
#pkgs,
#lib,
  ...
}: let
  #mkVimPlugin = sources: pkgs.vimUtils.buildVimPlugin {inherit (sources) src pname version;};

  #sources = import ../_sources/generated.nix {inherit (pkgs) fetchFromGitHub fetchgit fetchurl dockerTools;};

  #extraPlugins = lib.attrsets.mapAttrsToList (_: value: mkVimPlugin value) sources;
in {
  imports = with builtins;
    map (fn: ./${fn})
    (filter (fn: fn != "default.nix") (attrNames (readDir ./.)));
}
