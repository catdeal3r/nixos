{
  inputs = {
    nixpkgs.url = github:NixOs/nixpkgs/nixos-unstable;
    quickshell = {
      url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    silentSDDM = {
      url = "github:uiriansan/SilentSDDM";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flatpak-nix.url = "github:gmodena/nix-flatpak/?ref=latest";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    apple-fonts.url = "github:catdeal3r/apple-fonts-flake";
    mcmojave-cursor.url = "github:catdeal3r/mcmojave-cursor-flake";
    product-sans-font.url = "github:catdeal3r/product-sans-flake";
  };

  outputs = { nixpkgs, ... }@inputs: {
    nixosConfigurations.hpnix = nixpkgs.lib.nixosSystem {
      modules = [ ./modules ];
      specialArgs = { inherit inputs; };
    };
  };
}
