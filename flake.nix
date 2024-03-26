{
  description = "Ceci's Nix Shells";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { nixpkgs, ... }: let 
    lib = import ./lib { inherit nixpkgs; };
    bun = lib.mkShell "bun" { } // {
      withVersion = version: lib.mkShell "bun" { inherit version; }; 
    };
    nodejs = lib.mkShell "nodejs" { } // {
      withVersion = version: lib.mkShell "nodejs" { inherit version; }; 
    };
  in {
    lib = lib;
    bevy = lib.mkShell "bevy" { };
    bun = bun;
    nodejs = nodejs;
    rust = lib.mkShell "rust" { };
    devShells = bun.withVersion 20;
  };
}
