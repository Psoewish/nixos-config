{
  home.config = {
    wayland.windowManager.mango.autostart_sh = ''
      pipeweaver-daemon --background &
      streamcontroller -b &
      steam -silent &
      sone &
      discord &
    '';
  };
}
