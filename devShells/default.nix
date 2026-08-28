{
  perSystem = {pkgs, ...}: {
    devShells.default = pkgs.mkShell {
      packages = [pkgs.stow pkgs.sops];
    };
  };
}
