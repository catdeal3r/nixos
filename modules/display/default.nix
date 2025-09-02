{ ... }:

{
  imports = [
    ./swayfx.nix
    ./gnome.nix
  ];

  services.xserver.windowManager.openbox.enable = true;
}
