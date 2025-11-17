{
  inputs,
  hostname,
  username,
  stateVersion,
  flakeRoot,
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
        flakeRoot
        ;
    };
    backupFileExtension = "backup";
  };
}
