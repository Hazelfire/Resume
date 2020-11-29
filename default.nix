{ pkgs ? import <nixpkgs> {}}:

with pkgs;

stdenv.mkDerivation {
  name = "resume";
  buildInputs = 
  [ (texlive.combine {
      inherit (texlive)
        scheme-small

        # Add other LaTeX libraries (packages) here as needed, e.g:
        # stmaryrd amsmath pgf

        # build tools
        moderncv
        fontawesome
        ;
    })

  ];
  src = ./.;
  buildPhase = ''
  pdflatex document.tex
  '';
  installPhase = ''
    mkdir -p $out
    cp document.pdf $out
  '';

  meta = with lib; {
    description = "My Resume";
    license = licenses.bsd3;
    platforms = platforms.linux;
  };
}
