{
  description = "A nixvim configuration";

  inputs = {
    codeium.url = "github:jcdickinson/codeium.nvim";
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:NixOS/nixpkgs";
    nixvim.url = "github:nix-community/nixvim";
    treefmt-nix.url = "github:numtide/treefmt-nix";

    nvim-window-picker = {
      url = "github:s1n7ax/nvim-window-picker";
      flake = false;
    };

    borderline = {
      url = "github:mikesmithgh/borderline.nvim";
      flake = false;
    };

    buffer-manager = {
      url = "github:j-morano/buffer_manager.nvim";
      flake = false;
    };

    typr = {
      url = "github:nvzone/typr";
      flake = false;
    };

    minty = {
      url = "github:nvzone/minty";
      flake = false;
    };

    volt = {
      url = "github:nvzone/volt";
      flake = false;
    };

    menu = {
      url = "github:nvzone/menu";
      flake = false;
    };
  };

  outputs = {
    codeium,
    flake-utils,
    nixpkgs,
    nixvim,
    treefmt-nix,
    self,
    ...
  } @ inputs:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
        overlays = [codeium.overlays.${system}.default];
      };

      nvim = nixvim.legacyPackages.${system}.makeNixvimWithModule {
        inherit pkgs;

        extraSpecialArgs =
          {
            inherit inputs;
          }
          // import "${self}/lib" {
            inherit pkgs;
            inherit (pkgs) lib;
          };

        module = import ./config;
      };
    in {
      formatter = treefmt-nix.lib.mkWrapper pkgs {
        projectRootFile = "flake.nix";
        programs = {
          alejandra.enable = true;
          deadnix.enable = true;
          stylua.enable = true;
        };
      };

      checks.default = nixvim.lib.${system}.check.mkTestDerivationFromNvim {
        inherit nvim;
        name = "My nixvim configuration";
      };

      packages.default = nvim;

      devShells.default = pkgs.mkShell {
        buildInputs = with pkgs; [
          alejandra
          nvfetcher
          stylua
          (writeScriptBin "up" ''
            nvfetcher
            nix flake update
          '')
        ];
      };
    });
}
