{ ... }:
{
  flake.modules.nixos.gaming = { pkgs, ... }: {
    programs.steam = {
      enable = true;
      gamescopeSession.enable = true;
      extraPackages = [ pkgs.bibata-cursors ];
    };
    programs.gamemode.enable = true;

    environment.systemPackages = with pkgs; [
      osu-lazer-bin
      cacert
    ];

    security.pki.certificateFiles = [ ]; # Asegura el almacén de certificados por defecto
  };
}
