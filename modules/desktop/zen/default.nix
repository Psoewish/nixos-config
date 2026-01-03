{
  username,
  inputs,
  pkgs,
  ...
}:
{
  home-manager.users.${username} = {
    programs.zen-browser = {
      enable = true;
      profiles."default" = {
        extensions.packages =
          with inputs.zen-browser-extensions.packages.${pkgs.stdenv.hostPlatform.system}; [
            clearurls
            indie-wiki-buddy
            lovely-forks
            no-pdf-download
            pronoundb
            proton-pass
            protondb-for-steam
            privacy-badger
            return-youtube-dislikes
            dearrow
            augmented-steam
            sponsorblock
            istilldontcareaboutcookies
            refined-github
            sonarr-radarr-lidarr-search
            unpaywall
          ];
      };
    };
  };
}
