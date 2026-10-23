{
  perSystem = {
    inputs',
    pkgs,
    ...
  }: {
    devShells.default = pkgs.mkShell {
      packages = [inputs'.deploy-rs.packages.default];
    };
  };
}
