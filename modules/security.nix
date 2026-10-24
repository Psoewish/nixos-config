{pkgs, ...}: {
  services.gnome.gnome-keyring.enable = true;

  environment.systemPackages = with pkgs; [bitwarden-desktop];
  environment.sessionVariables = {SSH_AUTH_SOCK = "$HOME//.bitwarden-ssh-agent.sock";};
}
