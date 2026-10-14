{ ... }:
{
  flake.modules.nixos.display-manager = {
    services.displayManager = {
      dms-greeter = {
        enable = true;
        compositor.name = "niri";
        configHome = "/home/karvono14";
      };

#     gdm.enable = true;
    };
  };
}
