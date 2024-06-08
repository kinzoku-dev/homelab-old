{
  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };

  outputs = {
    self,
    flake-utils,
    nixpkgs,
  }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = (import nixpkgs) {
          inherit system;
          overlays = [];
          config = {
            allowUnfree = true;
          };
        };

        nativeBuildInputs = with pkgs; [
          packer
        ];

        buildInputs = with pkgs; [];
      in {
        devShell = pkgs.mkShell {
          inherit nativeBuildInputs buildInputs;
        };
      }
    );
}
