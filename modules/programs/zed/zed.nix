{
  flake.modules.nixos.zed = {inputs, ...}: {
    home-manager.sharedModules = [inputs.self.modules.homeManager.zed];
  };

  flake.modules.homeManager.zed = {
    programs.zed-editor.enable = true;
  };
}
