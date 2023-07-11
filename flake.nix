{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.05";
    oxalica.url = "github:oxalica/rust-overlay";
    oxalica.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, oxalica }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        system = "x86_64-linux";
        overlay.default = [ oxalica.overlay ];
        config.allowUnfree = true;
      };

      # To update the tailwind packages use node2nix
      # node2nix -c tailwindcss.nix -16
      nodeDependencies = (pkgs.callPackage ({ pkgs, system }:
        let nodePackages = import ./tailwindcss.nix { inherit pkgs system; };
        in nodePackages // {
          shell = nodePackages.shell.override {
            buildInputs = [
              # pkgs.nodePackages.node-gyp-build
            ];
          };
        }) { }).nodeDependencies;
    in {

      packages.x86_64-linux = {
        website = pkgs.stdenv.mkDerivation rec {
          version = "0.0.1";
          name = "kodama-theme-${version}";
          src = pkgs.lib.sourceByRegex ./. [
            "^content"
            "^content/.*"
            "^static"
            "^static/.*"
            "^templates"
            "^templates/.*"
            "^templates/macros"
            "^templates/macros.*"
            "^themes"
            "^themes/.*"
            "^styles"
            "^styles/.*\.css"
            "tailwind.config.js"
            "config.toml"
          ];

          buildInputs = [
            pkgs.zola
            pkgs.nodePackages.npm
            pkgs.tree
            # nodeDependencies
          ];

          checkPhase = ''
            zola check
          '';

          buildPhase = ''
            # https://github.com/svanderburg/node2nix#using-the-nodejs-environment-in-other-nix-derivations
            ln -s ${nodeDependencies}/lib/node_modules ./node_modules
            export PATH="${nodeDependencies}/bin:$PATH"

            tailwindcss -i styles/styles.css -o static/styles/style.css
          '';

          base-url = "https://adfaure.github.io/kodama-theme";
          installPhase = ''
            zola build -o $out --base-url ${base-url}
          '';
        };
      };
      # Use `nix develop` to activate the shell
      devShell.x86_64-linux = pkgs.mkShell {
        buildInputs = with pkgs; [
          zola
          nodeDependencies
          # nodePackages.npm
          nodePackages.node2nix
        ];
        # This tells npx where to find the node lib.
        # The css generation can be done with:
        # npx tailwindcss -i styles/styles.css -o static/styles/styles.css
        # NODE_PATH="${nodeDependencies}/lib/node_modules";
      };
    };
}
