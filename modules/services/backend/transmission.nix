{
  flake.modules.nixos.transmission = {pkgs,...}:{
    services.transmission = {
      enable = true;
      group = "media";
      webHome = pkgs.flood-for-transmission;
      settings = {
        download-dir = "/data/downloads/torrents/complete";
        incomplete-dir = "/data/downloads/torrents/incomplete";
      };
    };
  };

  routing.services.transmission = {
    port = 9091;
  };
}
