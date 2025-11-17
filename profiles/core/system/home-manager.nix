{
  inputs,
  hostname,
  username,
  stateVersion,
  ...
}:
{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = {
      inherit
        inputs
        hostname
        username
        stateVersion
        ;
    };
    backupFileExtension = "backup";
  };
}
