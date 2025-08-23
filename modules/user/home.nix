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
        icon = "firefox";
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


    programs.gnome-shell = {
      enable = true;
      
      theme = {
        name = "Orchis-Grey-Dark";
        package = pkgs.orchis-theme.override { tweaks = [ "black" "solid" ]; };
      };
    };


    # gtk theme settings and such
    dconf.settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
      };
      "org/gnome/desktop/wm/preferences" = {
        resize-with-right-button = true;
        num-workspaces = 8;
      };
      "org/gnome/desktop/wm/keybindings" = {
        activate-window-menu = [ ];
        close = [ "<Super>w" ];
        move-to-workspace-1 = [ "<Shift><Super>1" ];
        move-to-workspace-2 = [ "<Shift><Super>2" ];
        move-to-workspace-3 = [ "<Shift><Super>3" ];
        move-to-workspace-4 = [ "<Shift><Super>4" ];
        move-to-workspace-5 = [ "<Shift><Super>5" ];
        move-to-workspace-6 = [ "<Shift><Super>6" ];
        move-to-workspace-7 = [ "<Shift><Super>7" ];
        move-to-workspace-8 = [ "<Shift><Super>8" ];
        switch-to-workspace-left = [ "<Super>Left" ];
        switch-to-workspace-right = [ "<Super>Right" ];
      };
      "org/gnome/shell/keybindings" = {
        screenshot = [ "<Shift><Super>s" ];
      };
      "org/gnome/mutter/keybindings" = {
        toggle-tiled-left = [ ];
        toggle-tiled-right = [ ];
      };
    };


    gtk = {
      enable = true;
      
      iconTheme = {
        name = "Adwaita";
        package = pkgs.adwaita-icon-theme;
      };
      
      font = {
        name = "CommitMono-Nerd-Font";
        package = pkgs.nerd-fonts.commit-mono;
      };

      cursorTheme = {
        name = "GoogleDot-Black";
        package = pkgs.google-cursor; 
      };

      theme = {
        name = "Orchis-Grey-Dark";
        package = pkgs.orchis-theme.override { tweaks = [ "black" "solid" ]; };
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
