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
      jq
      libnotify
      wl-clipboard
      glib
      lxde.lxsession
      # quickshell
      kdePackages.qt5compat
      kdePackages.qtmultimedia
    ];  
  };
}
