{ ... }:
let
  local = import ../../local.nix;
in
{
  imports = [
    ../common
    ./packages.nix
  ];
  home.username = local.home.username;
  home.homeDirectory = local.home.homeDirectory;
}
