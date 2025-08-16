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
    equibop
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
  ];
  
  services.flatpak.enable = true;
  services.udisks2.enable = true;
}
