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
          "application/pdf" = [ "firefox.desktop" ];
          "text/html" = [ "firefox.desktop" ];
          "image/png" = [ "org.gnome.eog.desktop" ];
          "image/jpeg" = [ "org.gnome.eog.desktop" ];
          "text/markdown" = [ "md.obsidian.Obsidian.desktop" ];
          "inode/directory" = [ "org.gnome.Nautilus.desktop" ];
          "application/x-gnome-saved-search" = [ "org.gnome.Nautilus.desktop" ]; 
          "image/gif" = [ "org.gnome.eog.desktop" ];
        };
      };

      desktopEntries.firefox = {
        name = "Firefox";
        genericName = "Web Browser";
        categories = [ "Network" "WebBrowser" ];
        icon = "Firefox";
        mimeType = [ "text/html" "text/xml" "application/xhtml+xml" "application/vnd.mozilla.xul+xml" "x-scheme-handler/http" "x-scheme-handler/https" ];
        startupNotify = true;
        terminal = false;
        type = "Application";
        actions = {
          "NewWindow" = {
            exec = "firefox --new-window %U -P";
            name = "New Window";
          };
          "ProfileManager" = {
            exec = "firefox -P";
            name = "Profile Manager";
          };
          "NewPrivateWindow" = {
            exec = "firefox --private-window %U -P";
            name = "New Private Window";
          };
        };
        exec = "firefox --name firefox %U -P";
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
  
      gtk3 = {
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
