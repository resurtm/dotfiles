{ pkgs-unstable, ... }:
{
  home.packages = with pkgs-unstable; [ kubernetes-helm ];
}
