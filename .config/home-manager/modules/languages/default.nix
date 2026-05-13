{ pkgs, pkgs-unstable, ... }:
{
  programs = {
    go = {
      enable = true;
      package = pkgs-unstable.go;
    };
  };
  home.packages = [
    pkgs.nodejs_24
    pkgs-unstable.lua5_1
    pkgs-unstable.lua51Packages.luarocks
  ];
}
