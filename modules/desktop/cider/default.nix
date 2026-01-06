{ pkgs, ... }:
{
  environment.systemPackages = with pkgs.unstable; [ cider-2 ];
}
