{ pkgs-unstable, ... }:
{
  home.packages = with pkgs-unstable; [
    lua5_1
    lua51Packages.luarocks
  ];
}
