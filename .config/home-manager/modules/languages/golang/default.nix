{ pkgs, pkgs-unstable, config, ... }:
let
  go-migrate-pg = pkgs-unstable.go-migrate.overrideAttrs (oldAttrs: {
    tags = [ "postgres" ];
  });
in
{
  programs.go = {
    enable = false;
    package = pkgs-unstable.go;
  };

  home.packages = (with pkgs; [
    gci
  ]) ++ (with pkgs-unstable; [
    delve
    go-task
    gofumpt
    # golangci-lint
    golines
    # oapi-codegen
  ]) ++ [
    # go-migrate-pg
  ];

  home.sessionVariables = {
    GOPATH = "${config.home.homeDirectory}/go";
    GOBIN = "${config.home.homeDirectory}/go/bin";
  };
  home.sessionPath = [
    "${config.home.homeDirectory}/go/bin"
  ];
}
