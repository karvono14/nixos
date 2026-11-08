{ inputs, ... }:
{
  flake.modules.nixos.dev = { pkgs, config, ... }: {

    programs.git.enable = true;
    programs.neovim = {
      enable = true;
      # defaultEditor = true;
      # viAlias = true;
      # vimAlias = true;
    };
    programs.direnv = {
      enable = true;
      nix-direnv.enable = true;
    };

    programs.nix-ld = {
      enable = true;
      libraries = with pkgs; [
        stdenv.cc.cc.lib
        libgcc
        zlib
        freetype
        fontconfig
        libX11
        libXext
        libXrender
        libXtst
        libXi
        libXrandr
        alsa-lib
      ];
    };

    home-manager.users.karvono14 = { config, ... }: {

      # 1. La plantilla (lo que me pasaste)
      xdg.configFile."matugen/templates/helix.toml".text = ''
        "keyword"   = "{{dank16.color5.default.hex}}"
        "string"    = "{{dank16.color2.default.hex}}"
        "function"  = "{{dank16.color4.default.hex}}"
        "type"      = "{{dank16.color3.default.hex}}"
        "constant"  = "{{dank16.color1.default.hex}}"
        "comment"   = { fg = "{{dank16.color8.default.hex}}", modifiers = ["italic"] }

        "ui.background"   = {}
        "ui.text"         = "{{colors.on_surface.default.hex}}"
        "ui.selection"    = { bg = "{{colors.secondary_container.default.hex}}" }
        "ui.statusline"   = { fg = "{{colors.on_surface.default.hex}}", bg = "{{colors.surface_container.default.hex}}" }
      '';

      # 2. El registro de la plantilla en matugen
      xdg.configFile."matugen/config.toml".text = ''
        [config]

        [templates.helix]
        input_path = '${config.xdg.configHome}/matugen/templates/helix.toml'
        output_path = '${config.xdg.configHome}/helix/themes/dank.toml'
      '';

      programs = {

        helix = {
          enable = true;
          # defaultEditor = true;
          settings = {
            theme = "dank";
            editor = {
              line-number = "relative";
              mouse = true;
              cursor-shape = {
                insert = "bar";
                normal = "block";
                select = "underline";
              };
              file-picker = {
                hidden = false;
              };
            };
            keys.normal = {
              space.space = "file_picker";
              esc = [
                "collapse_selection"
                "keep_primary_selection"
              ];
            };
          };

          # Configuración de lenguajes (languages.toml)
          languages = {
            language = [
              # nix
              {
                name = "nix";
                auto-format = true;
                formatter = {
                  command = "${pkgs.nixfmt}/bin/nixfmt";
                };
              }
              # python
              {
                name = "python";
                auto-format = true;
                language-servers = [ "pyright" ];
                formatter = {
                  command = "${pkgs.ruff}/bin/ruff";
                  args = [
                    "format"
                    "-"
                  ];
                };
              }
              # C
              {
                name = "c";
                auto-format = true;
                language-servers = [ "clangd" ];
              }
            ];
          };

          # Paquetes adicionales necesarios para tus lenguajes (LSP, formatters)
          extraPackages = with pkgs; [
            nil # LSP para Nix
            marksman # LSP para Markdown
            typescript-language-server
            pyright
            ruff
            clang-tools
            cmake
          ];

        };
      };

      virtualisation.docker = {
        enable = true;
        enableOnBoot = false;
      };
    };

    environment.systemPackages = with pkgs; [
      devenv
      glow
      vscode
      jq
      gh
      github-desktop
      # inputs.yazelix.packages.${pkgs.stdenv.hostPlatform.system}.yazelix # <-- el ultimo atributo es el nombre del archivo en el repo
    ];
    environment.variables = {
      SUDO_EDITOR = "hx";
      EDITOR = "hx";
      VISUAL = "hx";
    };
    environment.shellAliases = {
      h = "hx";
      hs = "sudo -e";
      vis = "sudo vim";
    };

  };
}
