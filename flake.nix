{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/release-22.05";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
        purescriptHaskellPackages = pkgs.haskell.packages.ghc8107.override {
          overrides = self: super: {
            bower-json = self.callPackage ./packages/bower-json.nix {};
          };
        };
      in
      {
        devShell = pkgs.mkShell {
          buildInputs = [
            pkgs.nixpkgs-fmt
            pkgs.cabal2nix
          ];
        };

        packages = {
          nomad-driver-nspawn = pkgs.callPackage ./packages/nomad-driver-nspawn.nix {};
          purescript = purescriptHaskellPackages.callPackage ./packages/purescript.nix {};
        };
      }
    );
}
