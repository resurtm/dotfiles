{ pkgs, pkgs-unstable, ... }:
{
  home.packages = [
    pkgs-unstable.fd
    pkgs-unstable.fzf
    pkgs.ripgrep
    pkgs-unstable.gdu
  ];
}
