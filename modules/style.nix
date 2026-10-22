{pkgs, ...}: {
  fonts.packages = with pkgs; [
    maple-mono.NF-CN
    inter
  ];

  environment.systemPackages = with pkgs; [
    bibata-cursors
  ];
}
