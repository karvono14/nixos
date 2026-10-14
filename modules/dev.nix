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

    home-manager.users.karvono14.programs = {
      helix = {
        enable = true;
        # defaultEditor = true;
        settings = {
          theme = "tokyonight";
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

    environment.systemPackages = with pkgs; [
      devenv
      glow
      vscode

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
