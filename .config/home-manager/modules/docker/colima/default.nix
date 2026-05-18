{ pkgs, ... }:
{
  home.packages = with pkgs; [ colima ];
  home.file.".config/colima/default/colima.yaml".source = ./colima.yaml;

  # don't save/write config on startup
  home.sessionVariables = { COLIMA_SAVE_CONFIG = 0; };
}
