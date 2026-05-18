{ pkgs-unstable, ... }:
{
  programs.fastfetch = {
    enable = true;
    package = pkgs-unstable.fastfetch;
  };
}
