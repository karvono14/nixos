{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
    flake-parts.url = "github:hercules-ci/flake-parts";
    import-tree.url = "github:denful/import-tree";
    dms.url = "github:AvengeMedia/DankMaterialShell/stable";
    serein.url = "github:ViceVerse-cz/Serein";
    home-manager.url = "github:nix-community/home-manager/release-26.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    yazelix.url = "github:Yazelix/nova/stable";
  };
  
  outputs = inputs:
    let 
      modulos = inputs.import-tree ./modules;
    in
      inputs.flake-parts.lib.mkFlake { inherit inputs; } modulos;




}
