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

    dconf.settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
      };
    };


    gtk = {
      enable = true;
      cursorTheme = {
        name = "GoogleDot-Black";
        package = pkgs.google-cursor; 
      };

      theme = {
        name = "Adwaita-dark";
        package = pkgs.gnome-themes-extra;
      };

      systemd.user.sessionVariables = config.home-manager.users.justinas.home.sessionVariables;
 
    };


    qt = {
      enable = true;
      platformTheme = "gnome";
      style = "adwaita-dark";
    }; 
   
    home.stateVersion = "25.05";
  };
}
