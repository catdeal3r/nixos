{ pkgs, ... }:

{
  imports = [
    ./swayfx.nix
    ./gnome.nix
    ./labwc.nix
    ./wayfire.nix
  ];
}
