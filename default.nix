{ mkDerivation, aeson, attoparsec, base, base-compat
, base-unicode-symbols, base64-bytestring, blaze-html, blaze-markup
, bytestring, containers, containers-unicode-symbols, directory
, exceptions, filepath, http-media, http-types, lucid
, monad-control, mtl, network, network-uri, resourcet, servant
, servant-server, stdenv, string-conversions, tagged, text, time
, transformers, transformers-base, wai, wai-app-static, warp, word8
}:
mkDerivation {
  pname = "evserv";
  version = "0.1.0.0";
  src = ./.;
  isLibrary = false;
  isExecutable = true;
  libraryHaskellDepends = [
    aeson attoparsec base base-compat base-unicode-symbols
    base64-bytestring blaze-html blaze-markup bytestring 
    directory exceptions filepath http-media
    http-types lucid monad-control mtl network network-uri resourcet
    servant servant-server string-conversions tagged text time
    transformers transformers-base wai wai-app-static warp word8
  ];
  executableHaskellDepends = [ base base-unicode-symbols ];
  doHaddock = false;
  homepage = "git@github.com:EvanMisshula/evserv.git";
  license = stdenv.lib.licenses.bsd3;
}
