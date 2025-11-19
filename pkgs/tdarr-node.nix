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
  pname = "tdarr-node";
  version = "2.57.01";

  src = fetchzip {
    url = "https://storage.tdarr.io/versions/${version}/linux_x64/Tdarr_Node.zip";
    hash = "sha256-faWwqFksxjb5ar5+EXeI3BQTOrs1B8qgA1Txzz492Pw=";
    stripRoot = false;
  };

  nativeBuildInputs = [
    autoPatchelfHook
    makeWrapper
  ];

  buildInputs = [
    stdenv.cc.cc.lib
  ];

  pathDependencies = [
    ffmpeg
    handbrake
    mkvtoolnix-cli
  ];

  installPhase = ''
    runHook preInstall

    mkdir -p $out/lib/tdarr-node
    cp -r . $out/lib/tdarr-node/

    # Remove GUI tray application (not needed for headless server)
    rm -f $out/lib/tdarr-node/Tdarr_Node_Tray

    # Remove bundled ccextractor (requires older tesseract/leptonica versions)
    rm -rf $out/lib/tdarr-node/assets/app/ccextractor

    # Create placeholder directories for bind mounts
    # Tdarr looks for these as siblings to the tdarr-server directory
    mkdir -p $out/lib/configs
    mkdir -p $out/lib/node
    mkdir -p $out/lib/logs

    mkdir -p $out/bin
    makeWrapper $out/lib/tdarr-node/Tdarr_Node $out/bin/tdarr-node \
      --prefix PATH : ${lib.makeBinPath pathDependencies}

    runHook postInstall
  '';

  meta = with lib; {
    description = "Audio/Video library transcoding automation";
    homepage = "https://tdarr.io";
    license = licenses.unfree;
    platforms = [ "x86_64-linux" ];
    mainProgram = "tdarr-node";
  };
}
