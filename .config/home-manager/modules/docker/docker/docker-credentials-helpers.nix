{ pkgs-unstable, ... }:
{
  home.packages = with pkgs-unstable; [ docker-credential-helpers ];
}
