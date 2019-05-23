{ pkgs }:

self: super:

with { inherit (pkgs.stdenv) lib; };

with pkgs.haskell.lib;

{
  xoshiro256 = (
    with rec {
      xoshiro256Source = pkgs.lib.cleanSource ../.;
      xoshiro256Basic  = self.callCabal2nix "xoshiro256" xoshiro256Source { };
    };
    overrideCabal xoshiro256Basic (old: {
    })
  );
}
