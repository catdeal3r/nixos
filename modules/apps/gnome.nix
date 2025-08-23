{ inputs, pkgs, ... }:

{
  imports = [
    inputs.home-manager.nixosModules.default
  ];

  # add gnome and remove useless packages
  services.desktopManager.gnome.enable = true;
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

  home-manager.users.catdealer = { pkgs, ... }: {
    # extensions
    home.packages = with pkgs; [
      gnomeExtensions.appindicator
      gnomeExtensions.forge
      gnomeExtensions.just-perfection
      gnomeExtensions.media-controls
      gnomeExtensions.open-bar
      gnomeExtensions.quick-settings-tweaker
      gnomeExtensions.rounded-window-corners-reborn
      gnomeExtensions.search-light
    ];

    programs.gnome-shell = {
      enable = true;
      
      theme = {
        name = "Orchis-Grey-Dark";
        package = pkgs.orchis-theme.override { tweaks = [ "black" "solid" ]; };
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
          "forge@jmmaranan.com"
          "just-perfection-desktop@just-perfection"
          "mediacontrols@cliffniff.github.com"
          "openbar@neuromorph"
          "quick-settings-tweaks@qwreey"
          "rounded-window-corners@fxgn"
          "search-light@icedman.github.com"
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
        command = "kitty --detach";
        name = "Kitty";
      };
      "org/gnome/shell/extensions/appindicator" = {
        icon-brightness = 0;
        icon-contrast = 0;
        icon-opacity = 255;
        icon-saturation = 1;
        icon-size = 0;
      };
    };
  };
}
