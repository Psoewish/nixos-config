{ inputs, username, ... }:
{
  fractal.tags = [ "core" ];
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs username; };
    backupFileExtension = "backup";
  };
}
