{ pkgs-unstable, ... }:
{
  programs = {
    lazygit = {
      enable = true;
      package = pkgs-unstable.lazygit;
      settings = {
        disableStartupPopups = true;
        os.editPreset = "nvim-remote";
      };
    };
    lazydocker.enable = true;
    bottom.enable = true;
  };
}
