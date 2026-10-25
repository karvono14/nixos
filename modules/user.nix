{ inputs, ... }:
{
  flake.modules.nixos.user = { pkgs, ... }: {
    imports = [ inputs.home-manager.nixosModules.home-manager ];

    users.users."karvono14" = {
      isNormalUser = true;
      description = "karvono14";
      extraGroups = [
        "networkmanager"
        "wheel"
        "docker"
      ];
      shell = pkgs.zsh;
    };

    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      users.karvono14 = {
        home.stateVersion = "26.05";
      };
    };

    nix.settings.trusted-users = [
      "root"
      "karvono14"
    ];
  };
}
