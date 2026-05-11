{ pkgs-unstable, ... }:
{
  home.packages = [
    pkgs-unstable.lazygit
    pkgs-unstable.lazydocker
    pkgs-unstable.bottom
  ];
}
