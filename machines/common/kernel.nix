{inputs, ...}: {
  den.aspects.common.kernel.nixos = let
    system = "x86_64-linux";
    pkgs-zen2 = import inputs.zen-kernel {inherit system;};
  in
    {
      host,
      lib,
      pkgs,
      ...
    }: {
      boot = {
        # kernelPackages = pkgs.${host.kernel.package};
        kernelPackages =
          if (host == "nausicaa")
          then pkgs-zen2.linuxPackages_zen
          else pkgs.linuxPackages;
        kernelModules = lib.optionals (host.kernel ? modules) host.kernel.modules;
      };
    };
}
