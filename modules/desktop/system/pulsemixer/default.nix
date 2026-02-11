{ pkgs, ... }:
{
  environment.systemPackages = [ pkgs.pulsemixer ];
}
