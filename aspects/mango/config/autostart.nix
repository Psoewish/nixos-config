{
  den.aspects.mango.config = {
    homeManager = {
      wayland.windowManager.mango.autostart_sh = ''
        pipeweaver-daemon --background &
        streamcontroller -b &
        steam -silent &
        sone &
        discord &
      '';
    };
  };
}
