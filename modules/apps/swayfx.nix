{ pkgs, inputs, ... }: let
  sddm-theme = inputs.silentSDDM.packages.${pkgs.system}.default.override {
    theme = "default";
    
    theme-overrides = {
      "LoginScreen" = {
         use-background-color = true;
      };
      "LockScreen" = {
         use-background-color = true;
      }; 
    };
  };
in
{
  services.displayManager.sddm.enable = true;

  environment.systemPackages = [ sddm-theme sddm-theme.test ];
  qt.enable = true;
  services.displayManager.sddm = {
    package = pkgs.kdePackages.sddm;
    enable = true;
    theme = sddm-theme.pname;
    extraPackages = sddm-theme.propagatedBuildInputs;
    settings = {
      General = {
        GreeterEnvironment = "QML2_IMPORT_PATH=${sddm-theme}/share/sddm/theme/${sddm-theme.pname}/component/,QT_IM__MODULE=qtvirtualkeyboard";
        InputMethod = "qtvirtualkeyboard";
      };
    };
  };

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
  
  fonts.packages = with pkgs; [
    material-symbols
    material-icons
    nerd-fonts.hack
    inputs.apple-fonts.packages.x86_64-linux.sf-pro
  ];
}
