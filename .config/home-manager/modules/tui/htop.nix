{ pkgs-unstable, ... }:
{
  programs.htop = {
    enable = true;
    package = pkgs-unstable.htop;
  };
}
