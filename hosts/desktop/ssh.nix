{ username, ... }:
{
  services.openssh.enable = true;
  home-manager.users.${username} = {
    programs.ssh = {
      enable = true;
      enableDefaultConfig = false;
      matchBlocks = {
        "homelab" = {
          hostname = "192.168.1.100";
          user = "root";
        };
      };
    };
  };
}
