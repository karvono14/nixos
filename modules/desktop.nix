{ inputs, ... }:
{
  flake.modules.nixos.desktop = { pkgs, ... }: {

    imports = [
      inputs.dms.nixosModules.default
      inputs.dfiles.nixosModules.dux-files
      ];

    programs.niri.enable = true;
    programs.dank-material-shell = {
      enable = true;
      systemd = {
        enable = true;
        restartIfChanged = true;
      };
    };
    programs.dux-files = {
      enable = true;
      # Keep a resident instance so windows open fast and the portal answers at once
      systemd = {
        enable = true;
        target = "graphical-session.target";
        restartIfChanged = true;
      };
      # Serve other apps' open and save dialogs
      portal = {
        enable = true;      # register the dfiles backend with xdg-desktop-portal
        preferred = true;   # prefer it for org.freedesktop.impl.portal.FileChooser
        desktop = "niri";   # which xdg.portal.config entry gets the preference, "common" by default
      };
    };

    # dux indexer
    programs.dsearch = {
      enable = true;
      systemd.enable = true;
      package = inputs.dsearch.packages.${pkgs.stdenv.hostPlatform.system}.default;
    };

    # paths for dfiles
    systemd.user.services.dfiles.path = [
      "/run/wrappers"
      "/etc/profiles/per-user/karvono14"
      "/run/current-system/sw"
    ];
    
    xdg.portal = {
      enable = true;
      wlr.enable = true;
      extraPortals = [
        pkgs.xdg-desktop-portal-gtk
        pkgs.xdg-desktop-portal-gnome
      ];
      config.common.default = "*";
    };

    fonts.packages = [ pkgs.nerd-fonts.jetbrains-mono ];

    environment.systemPackages = with pkgs; [
      xwayland
      xwayland-satellite
      bibata-cursors
      adwaita-icon-theme
    ];
    environment.sessionVariables = {
      XCURSOR_THEME = "Bibata-Modern-Ice";
      XCURSOR_SIZE = "24";
      QS_ICON_THEME = "Adwaita";
    };

    # services.displayManager.gdm.enable = true;
    # services.desktopManager.gnome.enable = true;
  };
}
