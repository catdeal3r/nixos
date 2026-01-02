{ pkgs, ... }:

{
  imports = [
    ./silentSDDM.nix
    ./niri.nix
    ./labwc.nix
  ];
}
