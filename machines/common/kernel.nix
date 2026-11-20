{
  den.aspects.common.kernel.nixos = {
    host,
    lib,
    pkgs,
    ...
  }: {
    boot = {
      kernelPackages = pkgs.${host.kernel.package};
      kernelModules = lib.optionals (host.kernel ? modules) host.kernel.modules;
    };
  };
}
