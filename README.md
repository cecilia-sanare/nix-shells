## Ceci's Nix Shells

### Usage

```nix
{
  description = "Nix Shells Example";

  inputs.nix-shells.url = "github:cecilia-sanare/nix-shells/main";

  outputs = { self, nix-shells, ... }: {
    devShells = nix-shells.bevy;
  };
}
```