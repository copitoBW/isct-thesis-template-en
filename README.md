# Master's Thesis Template — Institute of Science Tokyo (Matsuoka Lab)

A clean, modular **English** LaTeX template for a master's thesis, built with
pdfLaTeX. All formatting lives in one self-contained class file
(`ist_master_thesis.cls`), so the look is consistent and changeable in one place.
Chapters stay pure content.

> Writing in Japanese? There is a separate Japanese (upLaTeX) edition of this
> template in its own repository.

## Folder layout

```
thesis/
├── main.tex                      # master file (metadata + \input of each part)
├── ist_master_thesis.cls         # the class: ALL formatting lives here
├── references.bib                # bibliography database (cite with \cite{key})
├── frontmatter/
│   └── abstract.tex  acknowledgment.tex
├── chapters/
│   └── 01-introduction.tex … 06-conclusion.tex  appendix-a.tex  appendix-b.tex
│      (appendix-b is a LaTeX cheat-sheet — delete before submission)
├── figures/
│   └── ist_logo.png              # official logo, used on the title page
└── .vscode/settings.json         # one-click build recipe for VS Code
```

## How to build

- **VS Code:** open `main.tex`, press the green ▶ (LaTeX Workshop) or save the
  file. The PDF opens in a side tab.
- **Terminal:** `latexmk main.tex` (runs pdfLaTeX → biber → pdfLaTeX ×2).
- **Clean:** `latexmk -c` (removes intermediates, keeps the PDF).

> **Output goes to `build/`.** All build artefacts — including the finished
> `build/main.pdf` — are written into a `build/` folder (configured in
> `.latexmkrc`), so the source tree never fills up with `.aux`, `.log`, etc.
> The `build/` folder is git-ignored.

### Requirements
A TeX distribution (MiKTeX or TeX Live) with: `newtx`, `biblatex`, `biber`,
`titlesec`, `fancyhdr`, `cleveref`, `booktabs`, `microtype`, `siunitx`. MiKTeX
installs missing packages on first build.

## Daily workflow

- **New chapter:** add `chapters/07-foo.tex`, then `\input{chapters/07-foo}` in
  `main.tex`.
- **Figures:** every figure needs a slot (label + caption) immediately, but the
  image file can come later. Use the smart placeholder so writing is never
  blocked:
  ```latex
  \begin{figure}[ht]
    \centering
    \figauto{0.9}{pipeline.pdf}{0.4}{short description of the missing figure}
    \caption{Real caption.}\label{fig:pipeline}
  \end{figure}
  ```
  `\figauto{width}{file}{aspect}{desc}` draws a grey placeholder box until
  `figures/<file>` exists, then **auto-upgrades** to the real image — no code
  change. (`width` = fraction of text width, `aspect` = height/width of the box.)
  For a final figure you can also just use `\includegraphics{name.png}`.
- **References:** add to `references.bib` (or export from Zotero), cite with
  `\cite{key}`.
- **Cross-references:** `\cref{fig:x}`, `\cref{tab:x}`, `\cref{eq:x}`,
  `\cref{ch:x}` — never type "Figure 3" by hand.

## Design choices
Classic academic serif (Times-like `newtx`), justified, 1.5 spacing, A4 with a
binding margin, black & white, running headers, `booktabs` tables, IEEE numeric
citations. Edit `ist_master_thesis.cls` to change any of these globally.
