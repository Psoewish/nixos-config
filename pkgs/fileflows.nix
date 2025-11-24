{
  lib,
  stdenv,
  fetchurl,
  unzip,
  dotnetCorePackages,
  makeWrapper,
  sqlite,
  zlib,
}:

stdenv.mkDerivation {
  pname = "fileflows";
  version = "25.11.1.2210";

  src = fetchurl {
    url = "https://fileflows.com/downloads/zip";
    hash = "sha256-L7xrzAxgQTU1QZ8hPs/hRwbwT+s8td8CMzpWj68Bu9Q=";
  };

  nativeBuildInputs = [
    makeWrapper
    unzip
  ];

  buildInputs = [
    dotnetCorePackages.sdk_8_0
    sqlite
    zlib
  ];

  unpackPhase = ''
    unzip $src
  '';

  installPhase = ''
    runHook preInstall

    mkdir -p $out/lib
    cp -r Server $out/
    cp -r FlowRunner $out/
    cp -r Node $out/

    chmod -R a+rx $out

    runHook postInstall
  '';

  meta = with lib; {
    description = "File processing and transcoding automation tool";
    homepage = "https://fileflows.com";
    license = licenses.unfree;
    platforms = platforms.linux;
    maintainers = [ ];
  };
  unfreeRequires = true;
}
