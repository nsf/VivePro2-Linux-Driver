{
  description = "VIVE Pro 2 support for linux";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = import nixpkgs { inherit system; }; in
      rec {
        devShell = pkgs.mkShell {
          nativeBuildInputs = with pkgs;[
            gcc
            gnumake
            clang-tools
            wineWowPackages.full
          ];
        };
      }
    );
}
