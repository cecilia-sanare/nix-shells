{ pkgs ? (import <nixpkgs>) { } }: 
pkgs.mkShell {
  # Enable experimental features without having to specify the argument
  NIX_CONFIG = "experimental-features = nix-command flakes";
  buildInputs = with pkgs; [
    nixpkgs-fmt
    nixd
    bun
    nodejs_20
  ];
}