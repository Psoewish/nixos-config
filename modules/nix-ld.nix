{pkgs, ...}: {
  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      glib
      libxshmfence
      nss
      nspr
      at-spi2-atk
      dbus
      libdrm
      gdk-pixbuf
      gtk3
      pango
      cairo
      libx11
      libxcomposite
      libxdamage
      libxext
      libxfixes
      libxrandr
      expat
      libxcb
      libxkbcommon
      libgbm
      alsa-lib
      cups
    ];
  };
}
