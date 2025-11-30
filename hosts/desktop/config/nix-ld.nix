{ pkgs, ... }:
{
  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      stdenv.cc.cc.lib
      gcc-unwrapped
      libgcc
      glibc
      zlib
      openssl
      curl
      icu
      libxml2
      xz
      libGL
      libglvnd
      systemd
    ];
  };
}
