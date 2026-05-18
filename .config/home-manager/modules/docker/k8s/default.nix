{ ... }:
{
  imports = [
    ./k9s.nix
    ./kubectl.nix
    ./kubectx.nix
    ./kubernetes-helm.nix
    ./tilt.nix
  ];
}
