{
  den.aspects.common.systemd-boot.nixos = {
    boot = {
      loader = {
        systemd-boot = {
          enable = true;
          configurationLimit = 10;
          consoleMode = "max";
        };
        efi.canTouchEfiVariables = true;
        timeout = 0;
      };
      consoleLogLevel = 3;
    };
  };
}
