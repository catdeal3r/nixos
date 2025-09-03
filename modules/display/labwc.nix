{ pkgs, ... }:

{
  programs.labwc.enable = true;
  environment.systemPackages = with pkgs; [
    wallust
    cherry
  ];

  fonts.packages = with pkgs; [ cherry ];
}
