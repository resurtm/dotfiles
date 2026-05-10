{ config, pkgs, ... }:

{
  home.username = "resurtm";
  home.homeDirectory = "/home/resurtm";
  home.stateVersion = "25.11";
  home.file = { };
  home.sessionVariables = { };
  programs.home-manager.enable = true;
  fonts.fontconfig.enable = true;
  home.packages = [
    # zsh/shell
    pkgs.starship

    # languages/platforms
    pkgs.go
    pkgs.nodejs

    # editors/neovim
    pkgs.neovim
    pkgs.lazygit
    pkgs.fzf
    pkgs.ripgrep
    pkgs.fd
    pkgs.bottom
    pkgs.gdu
    pkgs.lua5_1
    pkgs.lua51Packages.luarocks

    # fonts
    pkgs.nerd-fonts.jetbrains-mono
  ];
}
