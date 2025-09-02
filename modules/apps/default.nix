{ pkgs, ... }:

{

  imports = [
    ./quickshell.nix
    ./flatpak.nix
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
    vlc
    htop
    vscodium
    libreoffice
    ungoogled-chromium
    libinput
    gnome-text-editor
    unzip
    gnome-extension-manager
    commit-mono
    orchis-theme
    stow
    helix  
    pkg-config
    jq
    power-profiles-daemon
    gparted
    pandoc
    texliveTeTeX
    fox
    tty-clock
  ];
  
  services.udisks2.enable = true;
  services.gvfs.enable = true;
}
