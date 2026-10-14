{inputs, config, ... }:
{
  flake.nixosConfigurations.nixos = inputs.nixpkgs.lib.nixosSystem {

    modules = ( with config.flake.modules.nixos; [
      apps
      audio
      base
      desktop
      dev
      display-manager
      gaming
      locale
      shell
      user              
    ]) ++ [
      ../hardware-configuration.nix
      {
        networking.hostName = "nixos";
        system.stateVersion = "26.05";
      }
    ];
  };
}

