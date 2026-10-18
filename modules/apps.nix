{ inputs, ... }:
{
  flake.modules.nixos.apps = { pkgs, ... }: {
    programs.firefox.enable = true;

    home-manager.users.karvono14.programs = {
      yazi = {
        enable = true;
      };
    };

    environment.systemPackages = with pkgs; [
      pacman
      nox
      aseprite
      keepassxc
      nautilus
      adw-gtk3
      ncdu
      krita
      libreoffice
      p7zip
      obsidian
      wf-recorder
      slurp
      bat

      inputs.serein.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];

    services = {
      gvfs.enable = true;
      tumbler.enable = true;
    };
  };
}
