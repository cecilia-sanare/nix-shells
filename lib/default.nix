{ nixpkgs }:
let
  inherit (nixpkgs) lib legacyPackages;
  forAllSystems = lib.genAttrs lib.systems.flakeExposed;
in {
  mkShell = name: { ... } @ input: forAllSystems(system:
    let
      pkgs = legacyPackages.${system};
      devShell = pkgs.callPackage ../shells/${name}.nix input;
    in
    {
      default = devShell;
      ${name} = devShell;
    });
}