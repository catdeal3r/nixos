{ pkgs, ... }:

{

  imports = [
    ./quickshell.nix
    ./swayfx.nix
    ./silentSDDM.nix
#    ./flatpak.nix
  ];
  
  environment.systemPackages = with pkgs; [
    vim
    wget
    tmux
    git
    gh
    fastfetch
    tree
    fish
    flatpak
    krita
    gimp
    opentabletdriver
    mpv
    ffmpeg
    zoxide
    yazi
    tldr
    cbonsai
    playerctl
    firefox
    udisks
    geany
    feh
    cava
    mlocate
    gvfs
    libgcc
    gnat15
    eog
    vlc
    htop
    vscodium
    libreoffice
    ungoogled-chromium
    libinput
    gnome-text-editor
    unzip
    gnome-extension-manager
  ];
  
  services.flatpak.enable = true;
  services.udisks2.enable = true;
  services.gvfs.enable = true;
}
