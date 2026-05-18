{ pkgs-unstable, ... }:
{
  home.packages = with pkgs-unstable; [ tilt ];
}
