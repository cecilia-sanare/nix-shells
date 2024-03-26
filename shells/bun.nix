{ lib, pkgs ? (import <nixpkgs>) { }, version ? 20 }: 
let
  # Adds support for formats like 20.11.1
  version_resolved = if builtins.isPath(version) then builtins.readFile(version) else version;
  version_short = builtins.elemAt (builtins.split "\\." (toString version_resolved)) 0;
  nodejs = pkgs.${"nodejs_" + version_short};
in
pkgs.mkShell {
  # Enable experimental features without having to specify the argument
  NIX_CONFIG = "experimental-features = nix-command flakes";
  buildInputs = with pkgs; [
    nixpkgs-fmt
    nixd
    bun
    nodejs
  ];
}