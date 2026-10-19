{pkgs, ...}: {
  programs.nix-ld.enable = true;
  environment.systemPackages = [pkgs.zed-editor];
}
