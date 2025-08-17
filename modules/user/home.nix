{ inputs, pkgs, ... }:

{
  imports = [
    inputs.home-manager.nixosModules.default
  ];
  
  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;    
  };

  home-manager.users.catdealer = { pkgs, ... }: {
    # location dirs and mime types
    xdg = {
      userDirs = {
        enable = true;
        pictures = "/run/media/catdealer/Data/Pictures";
        documents = "/run/media/catdealer/Data/Documents";
        music = "/run/media/catdealer/Data/Music";
        videos = "/run/media/catdealer/Data/Videos";
      };

      mimeApps = {
        enable = true;
        defaultApplications = {
          "applications/pdf" = [ "firefox.desktop" ];
        };
      };
    };

    


    # gtk theme settings and such
    dconf.settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
      };
    };


    gtk = {
      enable = true;
      
      iconTheme = {
        name = "Adwaita";
        package = pkgs.adwaita-icon-theme;
      };

      cursorTheme = {
        name = "GoogleDot-Black";
        package = pkgs.google-cursor; 
      };

      #theme = {
      #  name = "Adwaita-dark";
      #  package = pkgs.gnome-themes-extra;
      #};
     
      gtk2 = {
        theme = {
          name = "Adwaita-dark";
          package = pkgs.gnome-themes-extra;
        };
      };

      # should fix at some point ...
      # systemd.user.sessionVariables = home-manager.users.catdealer.home.sessionVariables;
 
    };

    # same thing here
    # qt = {
    #  enable = true;
    #  platformTheme = "gnome";
    #  style = "adwaita-dark";
    #}; 
   
    home.stateVersion = "25.05";
  };
}
