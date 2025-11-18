{ lib, ... }:
let
  mediaServices = [
    "jellyfin"
    "sonarr"
    "radarr"
    "bazarr"
    "sabnzbd"
    "fileflows"
  ];
in
{
  users.groups.media = { };

  users.users = lib.mkMerge (
    map (service: {
      ${service}.extraGroups = [ "media" ];
    }) mediaServices
  );

  systemd.services = lib.mkMerge (
    map (service: {
      ${service}.serviceConfig.UMask = lib.mkForce "0002";
    }) mediaServices
  );

  systemd.tmpfiles.rules = [
    "d /data/media 0775 root media -"
    "Z /data/media - - - - -"
    "d /var/lib/sabnzbd/Downloads 0775 root media -"
    "d /var/lib/sabnzbd/Downloads - - - - -"
  ];
}
