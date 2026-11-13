{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    import-tree = {
      url = "github:denful/import-tree";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    dfiles = {
      url = "github:duxlabs-dev/dux-files";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    dsearch = {
      url = "github:duxlabs-dev/dux-search";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    serein = {
      url = "github:ViceVerse-cz/Serein";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    concat ={
      url = "github:jub0t/Concat";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    dms.url = "github:duxlabs-dev/dux-shell/stable";
    # yazelix.url = "github:Yazelix/nova/stable";
    # tfm.url = "github:karvono14/tfm-tui";
  };

  outputs =
    inputs:
    let
      modulos = inputs.import-tree ./modules;
    in
      inputs.flake-parts.lib.mkFlake { inherit inputs; } modulos;

}
