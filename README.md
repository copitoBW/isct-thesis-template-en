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
│   └── abstract.tex  acknowledgment.tex  abbreviations.tex
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
`titlesec`, `fancyhdr`, `cleveref`, `booktabs`, `microtype`, `siunitx`,
`listings`, `acronym`. MiKTeX installs missing packages on first build.

## Daily workflow

- **New chapter:** add `chapters/07-foo.tex`, then `\input{chapters/07-foo}` in
  `main.tex`.
- **Figures:** put the image in `figures/`, add a figure block, and reference it
  by label:
  ```latex
  \begin{figure}[ht]
    \centering
    \includegraphics[width=0.6\textwidth]{pipeline.png}
    \caption{Real caption.}\label{fig:pipeline}
  \end{figure}
  ```
- **Abbreviations:** define each acronym once in `frontmatter/abbreviations.tex`,
  then write `\ac{key}` in the text — full form on first use, short form after.
  They also collect into the *List of Abbreviations*.
- **Code:** use the `lstlisting` environment (or `\lstinputlisting{file}`) for
  code or algorithms; the clean monospace style is preset.
- **References:** add to `references.bib` (or export from Zotero), cite with
  `\cite{key}`.
- **Cross-references:** `\cref{fig:x}`, `\cref{tab:x}`, `\cref{eq:x}`,
  `\cref{ch:x}` — never type "Figure 3" by hand.

## Design choices
Classic academic serif (Times-like `newtx`), justified, 1.5 spacing, A4 with a
binding margin, black & white, running headers, `booktabs` tables, IEEE numeric
citations. Edit `ist_master_thesis.cls` to change any of these globally.
