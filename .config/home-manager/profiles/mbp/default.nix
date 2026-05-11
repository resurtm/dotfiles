{ ... }:
let
  local = import ../../local.nix;
in
{
  imports = [
    ../common
    ./packages.nix
  ];
  home.username = local.username;
  home.homeDirectory = local.homeDirectory;
}
