{
  description = "Reproducible LaTeX + VS Code template";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }:
    let
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];

      forAllSystems = nixpkgs.lib.genAttrs systems;
    in
    {
      apps = forAllSystems (
        system:
        let
          pkgs = import nixpkgs { inherit system; };
        in
        {
          setup = {
            type = "app";
            program = "${pkgs.writeShellScriptBin "latex-vscode-setup" ''
              exec ${pkgs.bash}/bin/bash ${self}/scripts/vscode-extensions.sh install
            ''}/bin/latex-vscode-setup";
          };
          teardown = {
            type = "app";
            program = "${pkgs.writeShellScriptBin "latex-vscode-teardown" ''
              exec ${pkgs.bash}/bin/bash ${self}/scripts/vscode-extensions.sh uninstall
            ''}/bin/latex-vscode-teardown";
          };
          extension-status = {
            type = "app";
            program = "${pkgs.writeShellScriptBin "latex-vscode-status" ''
              exec ${pkgs.bash}/bin/bash ${self}/scripts/vscode-extensions.sh status
            ''}/bin/latex-vscode-status";
          };
        }
      );

      devShells = forAllSystems (
        system:
        let
          pkgs = import nixpkgs { inherit system; };
          tex = pkgs.texlive.combine {
            inherit (pkgs.texlive)
              scheme-basic
              latexmk
              amsfonts
              babel
              babel-english
              biblatex
              blindtext
              booktabs
              caption
              csquotes
              fancyhdr
              geometry
              hyperref
              listings
              mdframed
              mhchem
              pgfplots
              url
              xcolor
              epstopdf;
          };
        in
        {
          default = pkgs.mkShell {
            packages = [
              tex
              pkgs.biber
            ];
          };
        }
      );
    };
}
