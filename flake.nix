{
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-23.11";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    { self
    , nixpkgs
    , flake-utils
    }: flake-utils.lib.eachDefaultSystem (system:
    let
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      devShell = pkgs.stdenv.mkDerivation
        {
          name = "reveal.js";
          src = ./.;
          nativeBuildInputs = with pkgs; [
            nodejs
            nodePackages.npm
          ];
        };
    });
}
