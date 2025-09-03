{ pkgs, ... }:

{
  imports = [
    ./swayfx.nix
    ./gnome.nix
    ./labwc.nix
  ];
  
  environment.systemPackages = with pkgs; [
    alacritty
  ];
}
