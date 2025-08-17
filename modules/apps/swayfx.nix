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
    ];  
  };
  
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [];
  
  fonts.packages = with pkgs; [
    material-symbols
    material-icons
    nerd-fonts.hack
    inputs.apple-fonts.packages.x86_64-linux.sf-pro
  ];
}
