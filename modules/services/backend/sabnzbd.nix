{
  flake.modules.nixos.sabnzbd = {
    services.sabnzbd = {
      enable = true;
      group = "media";
      configFile = "/var/lib/sabnzbd/sabnzbd.ini"; # Add full settings later
    };
  };

  flake.routes.sabnzbd = {
    port = 8080;
  };
}
