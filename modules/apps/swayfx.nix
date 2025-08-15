{ pkgs, ... }:

{
  programs.sway = {
    enable = true;
    package = pkgs.swayfx;

    extraPackages = with pkgs; [
      kitty
      stow
      swaybg
      swayidle
      slurp
      grim
      wofi
      matugen
      nautilus
      stow
    ];  
  };
}
