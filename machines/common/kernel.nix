{
  den.aspects.common.kernel.nixos = {
    host,
    lib,
    pkgs,
    ...
  }: {
    boot = {
      kernelPackages = pkgs.${host.kernel.package};
      kernelModules = lib.optional (host ? kernelModules) host.kernelModules;
    };
  };
}
