{
    description = "CoreSight Access Library";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
        utils.url = "github:numtide/flake-utils";
    };

    outputs = { self, nixpkgs, ... }@inputs: inputs.utils.lib.eachSystem [
        "aarch64-linux"
    ] (system: let
        pkgs = import nixpkgs {
            inherit system;
        };
    in {
        devShells.default = pkgs.mkShell {
            buildInputs = with pkgs; [
                gcc

                clang-tools

                python3
            ];
        };
    });
}