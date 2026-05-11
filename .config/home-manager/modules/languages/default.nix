{ pkgs-unstable, ... }:
{
  home.packages = [
    pkgs-unstable.go
    pkgs-unstable.nodejs
    pkgs-unstable.lua5_1
    pkgs-unstable.lua51Packages.luarocks
  ];
}
