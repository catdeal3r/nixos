{ pkgs, inputs, ... }:

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
      gtk3
      gtk4
      helix
      # fonts
      material-icons
      material-symbols
      nerd-fonts.hack
      # quickshell
      kdePackages.qt5compat
      kdePackages.qtmultimedia
      # try to fix gtk monke ass ahh file pick 
      xdg-user-dirs-gtk
      xdg-desktop-portal-gtk
      gsettings-desktop-schemas
      dconf-editor
      dconf
    ];  
  };


  programs.dconf.enable = true;
  
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
  # Put missing dynamic libraries in here, not in the normal package place
    libdbus-1
  ];
  
  fonts.packages = with pkgs; [
    material-symbols
    material-icons
    nerd-fonts.hack
    inputs.apple-fonts.packages.x86_64-linux.sf-pro
  ];
}
