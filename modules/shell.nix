{ ... }:
{
  flake.modules.nixos.shell =
    { pkgs, ... }:
    let
      nixos = builtins.fromJSON ''"\uf313"''; # logo de NixOS
      nixCopo = builtins.fromJSON ''"\udb84\udd05"''; # copo (U+F1105)
    in
    {
      programs = {

        fish.enable = true;

        zoxide.enable = true;

        starship = {
          enable = true;
          presets = [
            "nerd-font-symbols"
            "pure-preset"
          ];
          settings = {
            add_newline = true;
            line_break.disabled = false;
            directory = {
              truncation_length = 3;
              truncation_symbol = "../";
              truncate_to_repo = true;
            };
            character = {
              success_symbol = "[❯](bold green)";
              error_symbol = "[❯](bold red)";
            };
          };
        };

        zsh = {
          enable = true;
          enableCompletion = true;
          autosuggestions.enable = true;
          syntaxHighlighting.enable = true;
          # interactiveShellInit = "fastfetch";
          ohMyZsh = {
            enable = true;
            plugins = [
              "git"
              "sudo"
            ];
          };
        };
      };

      home-manager.users.karvono14.programs = {

        eza = {
          enable = true;
          # theme = "catpuccin-mocha";
        };

        kitty = {
          enable = true;

          font = {
            name = "JetBrainsMono Nerd Font";
            size = 12;
          };

          settings = {
            enable_audio_bell = true;
            scrollback_lines = 10000;
            background_opacity = 0.9;
            window_padding_width = 12;
            copy_on_select = true;
            shell_integration = "enabled";

            cursor_shape = "block";
            cursor_blink_interval = 1;
            strip_trailing_spaces = "smart";
            tab_bar_style = "powerline";
            tab_bar_align = "left";
            hide_window_decorations = "yes";
            background_blur = 32;
          };

          extraConfig = ''
            transparent_background_colors #500000@0.5
            include dank-tabs.conf
            include dank-theme.conf
          '';
        };
      };

      environment.shellAliases = {
        # sudouser
        run0 = "run0 --setenv=TERMINFO --background='48;2;80;0;0'"; 
        sudo = "run0";

        # config de nixos
        cf = "cd ~/nixos";
        rebuild-switch = "sudo nixos-rebuild switch --flake ~/nixos#nixos";
        rebuild-boot = "sudo nixos-rebuild boot --flake ~/nixos#nixos";

        # eza aliases
        eza = "eza --icons=auto --git";
        ls = "eza --icons=auto --git";
        ll = "eza -l --icons=auto --git";
        la = "eza -a --icons=auto --git";
        lt = "eza --tree --icons=auto";
        lla = "eza -la --icons=auto --git";
      };
      environment.systemPackages = with pkgs; [
        fastfetch
        btop
        (writeShellScriptBin "rebuild-switch-git" (builtins.readFile ./scripts/rebuild-switch-git))
        (writeShellScriptBin "nix-clean" (builtins.readFile ./scripts/nix-clean))
      ];
    };
}
