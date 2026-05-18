{ pkgs-unstable, ... }:
{
  programs.fd = {
    enable = true;
    package = pkgs-unstable.fd;
  };
}
