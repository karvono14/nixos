{ ... }:
{
  flake.modules.nixos.base = {config, lib, pkgs, ... }: {
    boot.loader = {
      systemd-boot = { enable = true; consoleMode = "auto"; };
      efi.canTouchEfiVariables = true;
    };
    boot.kernelPackages = pkgs.linuxPackages_latest;
    boot.kernelModules = [ "uinput" ];
    networking.networkmanager.enable = true;
    security.polkit.enable = true;
    nixpkgs.config.allowUnfree = true;
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    hardware.uinput.enable = true;
    hardware.opentabletdriver.enable = true;
    services.flatpak.enable = true;
    services.printing.enable = true;
    environment.systemPackages = with pkgs; [ wget curl ];

    zramSwap = {
      enable = true;
      memoryPercent = 50;
      priority = 10;
    };

    swapDevices = [
      { device = "/swapfile"; priority = 5; }
      { device = "/dev/sda3"; priority = 0; }
    ];
  };
   
}
