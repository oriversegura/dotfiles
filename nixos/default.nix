
  with import <nixpkgs> {};
  stdenv.mkDerivation {
  name = "py-env";
  buildInputs = [ python3 python311Packages.requests python311Packages.requests ];
  }

