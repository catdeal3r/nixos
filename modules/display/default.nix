{ ... }:

{
  imports = [
    ./swayfx.nix
    ./gnome.nix
  ];

  programs.labwc.enable = true;
}
