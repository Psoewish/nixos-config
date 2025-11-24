{ inputs, ... }:
{
  flake.packages.x86_64-linux = {
    fileflows = inputs.nixpkgs.legacyPackages.x86_64-linux.callPackage ../pkgs/fileflows.nix { };
  };
}
