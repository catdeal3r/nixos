{ inputs, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ 
    inputs.quickshell.packages.x86_64-linux.default
    kdePackages.qt5compat
    kdePackages.qtmultimedia
    kdePackages.qtbase
    kdePackages.qtdeclarative
    kdePackages.qtwayland
    kdePackages.qttools
    kdePackages.qtshadertools
    kdePackages.qtsvg
  ];
}
