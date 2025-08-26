{ pkgs, inputs, ... }:

{

  programs.sway = {
    enable = true;
    package = pkgs.swayfx;

    extraPackages = with pkgs; [
      kitty
      swaybg
      swayidle
      slurp
      grim
      wofi
      matugen
      nautilus
      libnotify
      wl-clipboard
      glib
      lxde.lxsession
      gtk3
      gtk4
      brightnessctl
      pulseaudio
      # fonts
      material-icons
      material-symbols
      nerd-fonts.hack
      # try to fix gtk monke ass ahh file picker
      xdg-user-dirs-gtk
      xdg-desktop-portal-gtk
      gsettings-desktop-schemas
      dconf-editor
      dconf
    ];
  };


  programs.dconf.enable = true;
  
  fonts.packages = with pkgs; [
    material-symbols
    material-icons
    nerd-fonts.hack
    inputs.apple-fonts.packages.x86_64-linux.sf-pro
  ];
}
