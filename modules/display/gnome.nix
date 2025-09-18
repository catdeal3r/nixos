{ inputs, pkgs, lib, ... }:

{
  imports = [
    inputs.home-manager.nixosModules.default
  ];
  
  environment.systemPackages = with pkgs; [
    dconf2nix
    kitty
    nautilus
    xdg-user-dirs-gtk
    gtk3
    gtk4
    brightnessctl
    pulseaudio
    dconf
    dconf-editor
    xdg-desktop-portal-gtk
    libnotify
    orchis-theme
    gnome-terminal
  ];
  
  programs.dconf.enable = true;

  # add gnome and remove useless packages
  services.desktopManager.gnome.enable = true;
  services.displayManager.gdm.enable = true;

  environment.gnome.excludePackages = with pkgs; [
    gedit
    gnome-software
    gnome-music
    eog
    simple-scan
    totem
    epiphany
    geary
    gnome-tour
    tali
    yelp
    gnome-maps
    gnome-contacts
    gnome-terminal
  ];

  home-manager.users.catdealer = { pkgs, lib, ... }: with lib.hm.gvariant; {
    
    # extensions
    home.packages = with pkgs; [
      gnomeExtensions.appindicator
      gnomeExtensions.media-controls
      gnomeExtensions.rounded-window-corners-reborn
      gnomeExtensions.search-light
      gnomeExtensions.logo-menu
      gnomeExtensions.blur-my-shell
      gnomeExtensions.dash-to-dock
      gnomeExtensions.window-title-is-back
      gnomeExtensions.macpeek
    ];

    programs.gnome-shell = {
      enable = true;
      
      theme = {
        name = "Orchis-Dark";
        package = pkgs.orchis-theme.override { tweaks = [ "solid" "black" "macos" ]; };
      };
    };

    # gnome settings and such
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
        switch-input-source = [ ];
        switch-input-source-backward = [ ];
        unmaximize = [ ];
        toggle-maximized = [ "<Super>Up" ];
        maximize = [ ];
        minimize = [ "<Super>Down" ];
      };
      "org/gnome/shell/keybindings" = {
        show-screenshot-ui = [ "<Shift><Super>s" ];
        toggle-quick-settings = [ "<Super>space" ];
      };
      "org/gnome/mutter/keybindings" = {
        toggle-tiled-left = [ ];
        toggle-tiled-right = [ ];
      };
      "org/gnome/shell" = {
        disabled-extensions = [
          "vertical-workspaces@G-dH.github.com"
          "dynamic-panel@velhlkj.com"
          "compact-quick-settings@gnome-shell-extensions.mariospr.org"
        ];
        enabled-extensions = [
          "user-theme@gnome-shell-extensions.gcampax.github.com"
          "appindicatorsupport@rgcjonas.gmail.com"
          "mediacontrols@cliffniff.github.com"
          "rounded-window-corners@fxgn"
          "search-light@icedman.github.com"
          "dash-to-dock@micxgx.gmail.com"
          "blur-my-shell@aunetx"
          "logomenu@aryan_k"
          "kiwi@kemma"
          "window-title-is-back@fthx"
          "MacPeek@gamalsherif1.github.io"
        ];
      };
      "org/gnome/settings-daemon/plugins/media-keys" = {
        custom-keybindings = [
          "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
          "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/"
        ];
      };
      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
        binding = "<Super>e";
        command = "nautilus";
        name = "Nautilus";
      };
      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1" = {
        binding = "<Super>Return";
        command = "gnome-terminal";
        name = "Terminal";
      };
      # extensions settings
      "org/gnome/shell/extensions/appindicator" = {
        icon-brightness = 0;
        icon-contrast = 0;
        icon-opacity = 255;
        icon-saturation = 1;
        icon-size = 0;
      };
      "org/gnome/shell/extensions/just-perfection" = {
        accessibility-menu = true;
        activites-button = true;
        clock-menu = true;
        clock-menu-positition = 1;
        clock-menu-position-offset = 0;
        clock-menu-position = 1;
        dash = true;
        dash-app-running = true;
        dash-icon-size = 0;
        dash-separator = true;
        max-displayed-search-results = 0;
        panel = true;
        panel-in-overview = true;
        ripple-box = false;
        search = false;
        show-apps-button = false;
        startup-status = 0;
        support-notifier-showed-version = 34;
        support-notifier-type = 0;
        theme = false;
        top-panel-position = 0;
        window-demands-attentions-focus = false;
        window-picker-icon = false;
        window-preview-caption = false;
        window-preview-close-button = true;
        workspace = false;
        workspace-popup = false;
        workspaces-in-app-grid = false;
        workspace-switcher-size = 5;
        workspace-wrap-around = true;
      };
      "org/gnome/shell/extensions/mediacontrols" = {
        cache-art = true;
        colored-player-icon = false;
        extension-index = mkUint32 2;
        extension-position = "Right";
        extensions-index = 1;
        label-width = 220;
        labels-order = [ "ARTIST" "-" "TITLE" ];
        mouse-action-left = "SHOW_POPUP_MENU";
        mouse-action-middle = "PLAY_PAUSE";
        mouse-action-right = "NEXT_TRACK";
        scroll-labels = true;
        show-control-icons = true;
        show-control-icons-seek-backward = false;
        show-control-icons-seek-forward = false;
        show-player-icon = false;
        show-track-slider = false; 
      };
      "org/gnome/shell/extensions/rounded-window-corners-reborn" = {
        border-width = 0;
        settings-version = 7;
        skip-libadwaita-app = false;
      };
      "org/gnome/shell/extensions/search-light" = {
        animation-speed = 162.0;
        background-color = mkTuple [ 0.0 0.0 0.0 1.0 ];
        blur-brightness = 0.6;
        blur-sigma = 30.0;
        border-radius = 1.1782178217821784;
        entry-font-size = 1;
        font-size = 1;
        monitor-count = 1;
        preferred-monitor = 0;
        scale-height = 0.1;
        scale-width = 0.0;
        shortcut-search = [ "<Alt>space" ];
      };
      "org/gnome/shell/extensions/blur-my-shell" = {
        settings-version = 2;
      };

      "org/gnome/shell/extensions/blur-my-shell/appfolder" = {
	brightness = 0.6;
	sigma = 30;
      };

      "org/gnome/shell/extensions/blur-my-shell/coverflow-alt-tab" = {
	pipeline = "pipeline_default";
      };

      "org/gnome/shell/extensions/blur-my-shell/dash-to-dock" = {
        blur = true;
        brightness = 0.6;
        override-background = false;
        pipeline = "pipeline_default_rounded";
        sigma = 30;
        static-blur = true;
        style-dash-to-dock = 0;
      };

      "org/gnome/shell/extensions/blur-my-shell/lockscreen" = {
	pipeline = "pipeline_default";
      };
      "org/gnome/shell/extensions/blur-my-shell/overview" = {
	pipeline = "pipeline_default";
      };

      "org/gnome/shell/extensions/blur-my-shell/panel" = {
        brightness = 0.6;
        pipeline = "pipeline_default";
        sigma = 30;
      };

      "org/gnome/shell/extensions/blur-my-shell/screenshot" = {
        pipeline = "pipeline_default";
      };
      "org/gnome/shell/extensions/blur-my-shell/window-list" = {
        brightness = 0.6;
        sigma = 30;
      };
      "org/gnome/shell/extensions/dash-to-dock" = {
        apply-custom-theme = false;
        autohide-in-fullscreen = true;
        background-opacity = 0.1;
        custom-background-color = false;
        dash-max-icon-size = 43;
        dock-position = "BOTTOM";
        extend-height = false;
        height-fraction = 0.9;
        icon-size-fixed = true;
        intellihide = true;
        intellihide-mode = "FOCUS_APPLICATION_WINDOWS";
        multi-monitor = true;
        preferred-monitor = -2;
        preferred-monitor-by-connector = "eDP-1";
        preview-size-scale = 0.0;
        require-pressure-to-show = false;
        running-indicator-style = "DOTS";
        show-show-apps-button = false;
        transparency-mode = "FIXED";
      };
      "org/gnome/shell/extensions/Logo-menu" = {
        menu-button-icon-size = 25;
      };
      "org/gnome/shell/extensions/kiwi" = {
        add-username-to-quick-menu = false;
        hide-activities-button = true;
        move-calendar-right = true;
        panel-transparency = true;
        panel-transparency-level = 5;
        show-window-controls = false;
        show-window-title = false;
      };
      "org/gnome/shell/extensions/window-title-is-back" = {
        ease-time = 0;
        show-app = true;
        show-icon = false;
        show-title = true;
      };
    };
  };
}
