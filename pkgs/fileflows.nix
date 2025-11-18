{
  lib,
  stdenv,
  fetchurl,
  unzip,
  dotnetCorePackages,
  makeWrapper,
  ffmpeg,
  sqlite,
  zlib,
}:

stdenv.mkDerivation rec {
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

    mkdir -p $out/lib/Server
    mkdir -p $out/bin
    cp -r Server/* $out/lib/Server/

    makeWrapper ${dotnetCorePackages.sdk_8_0}/bin/dotnet $out/bin/Server \
      --add-flags "$out/lib/Server/FileFlows.Server.dll" \
      --prefix PATH : ${lib.makeBinPath [ ffmpeg ]} \
      --prefix LD_LIBRARY_PATH : ${
        lib.makeLibraryPath [
          sqlite
          zlib
        ]
      } \
      --set DOTNET_ROOT ${dotnetCorePackages.sdk_8_0}

    runHook postInstall
  '';

  meta = with lib; {
    description = "File processing and transcoding automation tool";
    homepage = "https://fileflows.com";
    license = licenses.unfree;
    platforms = platforms.linux;
    maintainers = [ ];
  };
}
