# latexmk configuration for the thesis (pdfLaTeX).
#   Build : latexmk main.tex      -> produces build/main.pdf
#   Clean : latexmk -c            -> removes intermediates (keeps the PDF)
#
# Send ALL build artefacts (aux, log, toc, pdf, ...) into build/ so the source
# tree never fills up with residual files. The finished PDF is build/main.pdf.
$pdf_mode = 1;        # build the PDF with pdfLaTeX
$out_dir  = 'build';
