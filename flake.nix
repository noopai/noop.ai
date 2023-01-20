{
  description = "My Nix flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-22.11";
    unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    snowfall-lib = {
      url = "github:snowfallorg/lib";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs:
    inputs.snowfall-lib.mkFlake {
      inherit inputs;

      src = ./.;

      outputs-builder = channels:
        let
          inherit (channels.nixpkgs) lib buildNpmPackage esbuild nodejs;
          inherit (lib) getExe;
        in
        {
          packages = rec {
            default = website;

            website = buildNpmPackage {
              pname = "noop.ai";
              version = inputs.self.sourceInfo.shortRev or "dirty";

              src = ./.;

              npmFlags = [ "--ignore-scripts" ];

              npmDepsHash = "sha256-OU0zoVj7tA/r9xLNZUYfmmfbrLl1euncXJ75ZFuVZIc";

              installPhase = ''
                mv dist $out
              '';
            };
          };
        };
    };
}
