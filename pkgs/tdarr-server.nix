{
  lib,
  stdenv,
  fetchzip,
  autoPatchelfHook,
  makeWrapper,
  ffmpeg,
  handbrake,
  mkvtoolnix-cli,
}:

stdenv.mkDerivation rec {
  pname = "tdarr-server";
  version = "2.57.01";

  src = fetchzip {
    url = "https://storage.tdarr.io/versions/${version}/linux_x64/Tdarr_Server.zip";
    hash = "sha256-WKqqffwFNfhCQoxT1Q+FeyD5XWTGOlNIKY1UHF95kxQ=";
    stripRoot = false;
  };

  nativeBuildInputs = [
    autoPatchelfHook
    makeWrapper
  ];

  buildInputs = [
    stdenv.cc.cc.lib
  ];

  runtimeDependencies = [
    ffmpeg
    handbrake
    mkvtoolnix-cli
  ];

  installPhase = ''
    runHook preInstall

    mkdir -p $out/lib/tdarr-server
    cp -r . $out/lib/tdarr-server/

    # Remove GUI tray application (not needed for headless server)
    rm -f $out/lib/tdarr-server/Tdarr_Server_Tray

    # Remove bundled ccextractor (requires older tesseract/leptonica versions)
    rm -rf $out/lib/tdarr-server/assets/app/ccextractor

    mkdir -p $out/bin
    makeWrapper $out/lib/tdarr-server/Tdarr_Server $out/bin/tdarr-server \
      --prefix PATH : ${lib.makeBinPath runtimeDependencies}

    runHook postInstall
  '';

  meta = with lib; {
    description = "Audio/Video library transcoding automation";
    homepage = "https://tdarr.io";
    license = licenses.unfree;
    platforms = [ "x86_64-linux" ];
    mainProgram = "tdarr-server";
  };
}
