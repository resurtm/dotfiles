{ ... }:
{
  imports = [
    ../../modules/cli
    ../../modules/editors
    ../../modules/fonts
    ../../modules/languages
    ../../modules/nix
    ../../modules/shell
    ../../modules/tui
  ];
  home.stateVersion = "25.11";
  home.username = "resurtm";
  home.homeDirectory = "/home/resurtm";
}
