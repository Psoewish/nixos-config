{ flakeRoot, ... }:
{
  programs.nh = {
    enable = true;
    flake = flakeRoot;
  };
}
