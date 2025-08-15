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
    flatpaks.url = "github:in-a-dil-emma/declarative-flatpak/stable-v3";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, ... }@inputs: {
    nixosConfigurations.hpnix = nixpkgs.lib.nixosSystem {
      modules = [ ./modules ];
      specialArgs = { inherit inputs; };
    };
  };
}
