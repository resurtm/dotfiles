{ pkgs, ... }:
{
  home.packages = with pkgs; [ yadm ];
}
