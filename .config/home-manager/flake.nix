{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    mac-app-util.url = "github:hraban/mac-app-util";
  };

  outputs =
    { nixpkgs
    , nixpkgs-unstable
    , home-manager
    , mac-app-util
    , ...
    }:
    let
      linux = rec {
        system = "x86_64-linux";
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };
        pkgs-unstable = import nixpkgs-unstable {
          inherit system;
          config.allowUnfree = true;
        };
      };
      darwin = rec {
        system = "aarch64-darwin";
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
          # this is OK
          config.permittedInsecurePackages = [
            "lima-full-1.2.2"
            "lima-additional-guestagents-1.2.2"
          ];
        };
        pkgs-unstable = import nixpkgs-unstable {
          inherit system;
          config.allowUnfree = true;
        };
      };
    in
    {
      formatter = {
        ${linux.system} = linux.pkgs.nixfmt-tree;
        ${darwin.system} = darwin.pkgs.nixfmt-tree;
      };
      homeConfigurations = {
        tower = home-manager.lib.homeManagerConfiguration {
          inherit (linux) pkgs;
          modules = [ ./profiles/tower ];
          extraSpecialArgs = {
            inherit (linux) system pkgs-unstable;
          };
        };
        mini = home-manager.lib.homeManagerConfiguration {
          inherit (linux) pkgs;
          modules = [ ./profiles/mini ];
          extraSpecialArgs = {
            inherit (linux) system pkgs-unstable;
          };
        };
        t14 = home-manager.lib.homeManagerConfiguration {
          inherit (linux) pkgs;
          modules = [ ./profiles/t14 ];
          extraSpecialArgs = {
            inherit (linux) system pkgs-unstable;
          };
        };
        x260 = home-manager.lib.homeManagerConfiguration {
          inherit (linux) pkgs;
          modules = [ ./profiles/x260 ];
          extraSpecialArgs = {
            inherit (linux) system pkgs-unstable;
          };
        };
        mbp = home-manager.lib.homeManagerConfiguration {
          inherit (darwin) pkgs;
          modules = [
            mac-app-util.homeManagerModules.default
            ./profiles/mbp
          ];
          extraSpecialArgs = {
            inherit (darwin) system pkgs-unstable;
          };
        };
      };
    };
}
