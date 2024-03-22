{
  description = "Ceci's Nix Shells";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs, ... }:
    let
      inherit (nixpkgs) lib legacyPackages;
      inherit (lib) mkMerge;
      forAllSystems = lib.genAttrs lib.systems.flakeExposed;

      mkShell = name: forAllSystems(system:
        let
          pkgs = legacyPackages.${system};
          devShell = pkgs.callPackage ./shells/${name}.nix { };
        in
        {
          default = devShell;
          ${name} = devShell;
        });
    in
    {
      rust = mkShell "rust";
      bevy = mkShell "bevy";
      devShells = mkShell "bevy";
    };
}
