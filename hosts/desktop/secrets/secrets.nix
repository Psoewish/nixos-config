{
  flake.modules.nixos.desktop = {
    age.secrets = {
      listenbrainz_token.rekeyFile = ./listenbrainz_token.age;
    };
  };
}
