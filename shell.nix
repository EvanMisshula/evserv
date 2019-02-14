{ nixpkgs ? import <nixpkgs> {}, compiler ? "default", doBenchmark ? false }:

let

  inherit (nixpkgs) pkgs;

  f = { mkDerivation, aeson, attoparsec, base, base-compat
      , base-unicode-symbols, base64-bytestring, blaze-html, blaze-markup
      , bytestring, containers, directory, exceptions, filepath
      , http-media, http-types, lucid, monad-control, mtl, network
      , network-uri, resourcet, servant, servant-server, stdenv
      , string-conversions, tagged, text, time, transformers
      , transformers-base, wai, wai-app-static, warp, word8
      }:
      mkDerivation {
        pname = "evserv";
        version = "0.1.0.0";
        src = ./.;
        isLibrary = false;
        isExecutable = true;
        libraryHaskellDepends = [
          aeson attoparsec base base-compat base-unicode-symbols
          base64-bytestring blaze-html blaze-markup bytestring containers
          directory exceptions filepath http-media http-types lucid
          monad-control mtl network network-uri resourcet servant
          servant-server string-conversions tagged text time transformers
          transformers-base wai wai-app-static warp word8
        ];
        executableHaskellDepends = [ base ];
        doHaddock = false;
        homepage = "git@github.com:EvanMisshula/evserv.git";
        license = stdenv.lib.licenses.bsd3;
      };

  haskellPackages = if compiler == "default"
                       then pkgs.haskellPackages
                       else pkgs.haskell.packages.${compiler};

  variant = if doBenchmark then pkgs.haskell.lib.doBenchmark else pkgs.lib.id;

  drv = variant (haskellPackages.callPackage f {});

in

  if pkgs.lib.inNixShell then drv.env else drv
