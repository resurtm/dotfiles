{ pkgs, ... }:
{
  home.packages = with pkgs; [
    python313
    python313Packages.pip
    black
    isort
    ruff
  ];
  programs = {
    mypy.enable = true;
    # ruff.enable = true;
    uv.enable = true;
  };
}
