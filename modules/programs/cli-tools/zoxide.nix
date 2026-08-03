{
  flake.modules.homeManager.razer = {config, ...}: {
    hardware.openrazer.enable = true;
    hardware.openrazer.users = ["${config.constants.primaryUser}"];
  };
}
