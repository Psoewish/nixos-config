{
  flake.modules.nixos.nix-ld = {pkgs, ...}: {
    programs.nix-ld = {
      enable = true;
      libraries = with pkgs; [
        stdenv.cc.cc.lib
        libgcc
        glibc
        zlib
        openssl
        curl
        libxml2
        libGL
        libglvnd
      ];
    };
  };
}
