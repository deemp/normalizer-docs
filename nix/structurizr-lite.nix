{ pkgs }:
pkgs.stdenv.mkDerivation rec {
  pname = "structurizr-lite";
  version = "v2024.03.03";

  src = pkgs.fetchurl {
    url = "https://github.com/structurizr/lite/releases/download/${version}/${pname}.war";
    hash = "sha256-rLqMj+tYPxYE86Wp07w2/QTSTn2XrwGT73MKrGiHE+o=";
  };

  dontUnpack = true;

  nativeBuildInputs = [ pkgs.makeWrapper ];

  installPhase = ''
    mkdir -p $out/bin

    echo $src

    makeWrapper ${pkgs.jre}/bin/java $out/bin/${pname} \
        --prefix PATH : ${pkgs.lib.makeBinPath [ pkgs.graphviz ]} \
        --add-flags "-Djdk.util.jar.enableMultiRelease=false" \
        --add-flags "-jar $src"
  '';

  meta = {
    mainProgram = pname;
    description = "Structurizr builds upon “diagrams as code”, allowing you to create multiple software architecture diagrams, in a variety of rendering tools, from a single model.";
    homepage = "https://structurizr.com/";
  };
}
