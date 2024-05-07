{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    systems.url = "github:nix-systems/default";
    flake-parts.url = "github:hercules-ci/flake-parts";
    devshell.url = "github:deemp/devshell";
  };

  outputs =
    inputs:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      systems = import inputs.systems;
      imports = [ inputs.devshell.flakeModule ];
      perSystem =
        {
          self',
          system,
          lib,
          config,
          pkgs,
          ...
        }:
        {
          packages.default = import ./nix/structurizr-lite.nix { inherit pkgs; };

          devshells.default = {
            bash.extra = ''
              export LD_LIBRARY_PATH=${lib.makeLibraryPath [ pkgs.stdenv.cc.cc.lib ]}
            '';
            commands = {
              tools = [
                pkgs.graphviz
                pkgs.poetry
              ];
            };
          };
        };
    };
}
