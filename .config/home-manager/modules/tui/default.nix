{ pkgs-unstable, ... }:
{
  imports = [
    ./bottom.nix
    ./htop.nix
    ./lazydocker.nix
    ./lazygit.nix
  ];
}
