{ pkgs-unstable, ... }:
{
  programs = {
    fd = {
      enable = true;
      package = pkgs-unstable.fd;
    };
    fzf = {
      enable = true;
      package = pkgs-unstable.fzf;
    };
    ripgrep.enable = true;
  };
  home.packages = [
    pkgs-unstable.gdu
  ];
}
