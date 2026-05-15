{ ... }:
let
  local = import ../../local.nix;
in
{
  imports = [
    ../common
    ./packages.nix
    ../../modules/ai
    ../../modules/gui
  ];
  home.username = local.home.username;
  home.homeDirectory = local.home.homeDirectory;
}
