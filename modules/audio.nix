{ ... }:
{
  flake.modules.nixos.audio = {pkgs, ...}:{
    services.pulseaudio.enable = false;
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };

    environment.systemPackages = with pkgs; [
      alsa-utils
      pulseaudio
    ];

    systemd.services.desactivar-automute = {
      wantedBy = [ "multi-user.target" ];
      after = [ "sound.target" ];
      serviceConfig = {
       Type = "oneshot";
       ExecStart = "${pkgs.alsa-utils}/bin/amixer -c 0 sset 'Auto-Mute Mode' Disabled"; 
      };
    }; 
  };
}
