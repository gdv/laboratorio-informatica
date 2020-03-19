(TeX-add-style-hook
 "SAS"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("beamer" "12pt")))
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("babel" "italian") ("inputenc" "utf8") ("fontenc" "T1")))
   (TeX-run-style-hooks
    "latex2e"
    "beamer"
    "beamer12"
    "mathptmx"
    "helvet"
    "fancyvrb"
    "listings"
    "babel"
    "inputenc"
    "pgf"
    "verbatim"
    "fontenc"))
 :latex)

