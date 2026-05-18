{ pkgs, pkgs-unstable, ... }:
{
  programs.go = {
    enable = true;
    package = pkgs-unstable.go;
  };
  home.packages = (with pkgs; [
    nodejs_24
  ]) ++ (with pkgs-unstable; [
    lua5_1
    lua51Packages.luarocks
  ]);
}
