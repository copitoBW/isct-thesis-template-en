# Thesis Template — User Manual

A practical, step-by-step guide to writing your master's thesis with this
template. No deep LaTeX knowledge required — if you can edit text and copy-paste,
you can use this.

> **First time here?** Read **[README.md](README.md)** first — it walks you through
> installing the tools, getting the files, and pressing build. This manual is about
> *writing* your thesis.

> **One golden rule:** keep all *formatting* in `ist_master_thesis.cls`, and keep
> all *content* in the chapter files. You almost never need to touch the class.

---

## 1. What's in the folder

```
thesis/
├── main.tex                      ← master file: metadata + which chapters to include
├── ist_master_thesis.cls         ← ALL the formatting (fonts, margins, title page…). Rarely touched.
├── references.bib                ← your bibliography database (one entry per paper)
├── frontmatter/
│   └── abstract.tex  acknowledgment.tex  abbreviations.tex   ← (abstract: write this LAST)
├── chapters/
│   └── 01-introduction.tex … 06-conclusion.tex, appendix-a.tex, appendix-b.tex
│      (appendix-b = LaTeX cheat-sheet — DELETE before submitting)
├── figures/                      ← put all your images here (PNG / JPG / PDF)
│   └── ist_logo.png
├── README.md                     ← short quick-reference
└── MANUAL.md                     ← this file
```

You will spend 99% of your time in `chapters/`, `figures/`, and `references.bib`.

---

## 2. How to build (turn `.tex` into a PDF)

### In VS Code (recommended)
1. Open the `thesis` folder in VS Code (you already have the LaTeX Workshop extension).
2. Open `main.tex`.
3. Press the green **▶ "Build LaTeX project"** button (top-right), or just **save the file** (`Ctrl+S`).
4. The PDF opens in a side tab. It refreshes every time you save.

That's it. The build automatically runs the full sequence (LaTeX → bibliography →
LaTeX twice) so citations and references always come out right, and it cleans up
the temporary files afterwards.

### In a terminal (alternative)
```powershell
latexmk main.tex     # build → produces build/main.pdf
latexmk -c           # clean temporary files (keeps the PDF)
```

All artefacts (including the PDF) are written to a **`build/`** folder, so the
source tree stays clean. The finished file is `build/main.pdf`.

### If a build ever fails
- Read the first **red error** in the "LaTeX Compiler" output — it names the file
  and line.
- Most common cause: a typo in a command, or a missing `}`. Fix it and rebuild.
- First build on a new machine may pause while MiKTeX installs a missing package —
  click "Install".
- See §11 (Troubleshooting) for specific messages.

---

## 3. Fill in your details (title page)

Open `main.tex` and edit the block near the top. This is the only place these live:

```latex
\title{Your Thesis Title Here:\\
       A Descriptive Subtitle Across\\
       Two or Three Balanced Lines}
\author{Your Name}
\supervisor{Prof.\ Masashi Matsuoka}
\school{School of Environment and Society}
\department{Department of Architecture and Building Engineering}
\degree{Master's Thesis}
\thesisyear{2026}
```

- `\\` forces a line break in the title (use it to balance long titles nicely).
- Optional lines you can add: `\laboratory{Matsuoka Laboratory}` and
  `\thesismonth{March}`. If you leave them out, those lines simply don't appear.
- The logo is `figures/ist_logo.png`. To change it, replace that file (or add
  `\logofile{figures/your_logo.png}`).

---

## 4. Writing the chapters

Each chapter is one file in `chapters/`. Just open it and write normal text.
Blank lines separate paragraphs.

### Headings
```latex
\chapter{Methodology}            % a new chapter (big, numbered "4")
\section{Pipeline Overview}      % 4.1
\subsection{Backbone}            % 4.1.1
```
Numbering and the Table of Contents update automatically — never type a section
number by hand.

### Emphasis and formatting
```latex
\emph{italic} or \textit{italic}
\textbf{bold}
\texttt{code / monospace}        % good for file names, e.g. \texttt{main.tex}
```

### Lists
```latex
\begin{itemize}
  \item First point.
  \item Second point.
\end{itemize}

\begin{enumerate}
  \item Numbered point.
  \item Another.
\end{enumerate}
```

### Adding a brand-new chapter
1. Create `chapters/07-mychapter.tex` starting with `\chapter{My Chapter}`.
2. Open `main.tex` and add `\input{chapters/07-mychapter}` in the right place, in
   the `MAIN MATTER` block.

> **Tip — guidance notes:** some sections currently contain italic notes in
> `\emph{(parentheses)}`. These are reminders of what to write — replace them with
> your prose and delete the parentheses.

---

## 5. Images / figures

**The key idea:** a figure has two parts — the *slot* (caption + label, which you
add now) and the *image file* (which can come later). This template lets you write
first and add pictures later.

### Supported formats
**PNG, JPG, and PDF all work.**
- **Screenshots, maps, satellite imagery** → use **PNG** (sharp, no smearing).
- **Diagrams and plots** (pipeline, charts) → **PDF** if you can export one
  (stays crisp at any zoom); a **high-resolution PNG (300 dpi)** is also fine.
- JPG works but avoid it for anything with text or sharp edges.

### Step 1 — put the file in `figures/`
e.g. `figures/pipeline.png`. No subfolders needed.

### Step 2 — add a figure block in your chapter
```latex
\begin{figure}[ht]
  \centering
  \includegraphics[width=0.9\textwidth]{pipeline.png}
  \caption{The real caption that appears under the figure.}
  \label{fig:pipeline}
\end{figure}
```

- `width=0.9\textwidth` sets the size (`0.9` = 90 % of the text width, `0.5` = half).
- The filename is looked up inside `figures/` automatically — no path needed.
- Always give the figure a `\label{fig:...}` so you can refer to it.

### Referring to a figure in text
```latex
As shown in \cref{fig:pipeline}, the pipeline has four stages.
```
This prints "As shown in Figure 4.1…" and updates automatically. **Never** type
"Figure 4.1" by hand.

---

## 6. Tables

Tables use clean horizontal rules (no vertical lines — that's the professional
style). Caption goes **above** a table.

```latex
\begin{table}[ht]
  \centering
  \caption{Example results by method.}
  \label{tab:results}
  \begin{tabular}{l c c}     % l = left, c = centre, r = right (one letter per column)
    \toprule
    Method & Metric & Note \\
    \midrule
    Baseline          & 0.71 & reference \\
    \textbf{Proposed} & \textbf{0.86} & best \\
    \bottomrule
  \end{tabular}
\end{table}
```

- `&` separates columns, `\\` ends a row.
- `\toprule` / `\midrule` / `\bottomrule` are the three horizontal lines.
- Refer to it with `\cref{tab:results}`.

---

## 7. Equations

```latex
% Inline (in a sentence):
The metric is $\gamma = a / b$.

% Displayed and numbered:
\begin{equation}
  \label{eq:example}
  y = f(x; \theta).
\end{equation}
```
Refer to it with `\cref{eq:example}` → "Equation (4.1)".

---

## 8. Citations and the bibliography

### Citing a paper
```latex
This is an example citation~\cite{smith2024example}.
Several sources cited at once~\cite{smith2024example,tanaka2023example}.   % multiple
```
The `~` before `\cite` keeps the number from wrapping to the next line. References
are numbered and listed automatically in IEEE style.

### Adding a new paper
Open `references.bib` and add an entry. The easiest way is to export BibTeX from
your reference manager (Zotero, Mendeley) or Google Scholar ("Cite → BibTeX") and
paste it in. An entry looks like:

```bibtex
@article{shortkey2024,
  author  = {Last, First and Other, Author},
  title   = {The Title of the Paper},
  journal = {Journal Name},
  year    = {2024},
  volume  = {12},
  pages   = {1--10},
}
```
Then cite it with `\cite{shortkey2024}`. The `shortkey` is yours to choose (keep it
unique and memorable, e.g. `author2024keyword`).

> **`% verify` entries:** some entries in `references.bib` were reconstructed from
> file names and are marked `% verify`. They print a visible "(verify venue)" in
> the reference list so you can't miss them — replace each with the correct
> metadata from the paper before submitting.

Only papers you actually `\cite` appear in the References list.

---

## 9. Cross-references (figures, tables, equations, chapters)

Give anything a `\label{...}` and point to it with `\cref{...}`:

| You wrote | It prints |
|-----------|-----------|
| `\cref{fig:pipeline}` | Figure 4.1 |
| `\cref{tab:results}`  | Table 5.2 |
| `\cref{eq:example}`   | Equation (4.1) |
| `\cref{ch:methodology}` | Chapter 4 |
| `\cref{sec:objectives}` | Section 1.3 |

Use `\Cref{...}` (capital C) at the **start of a sentence** ("Figure 4.1 shows…").
Label naming convention used here: `fig:`, `tab:`, `eq:`, `ch:`, `sec:` prefixes.
All numbering stays correct even when you reorder things.

---

## 10. Abstract and acknowledgment

- `frontmatter/abstract.tex` — write this **last**, once the thesis is finished.
  Keep it to one page: motivation, method, results, contribution. No citations.
- `frontmatter/acknowledgment.tex` — thank your supervisor, lab, and family.

---

## 11. Troubleshooting

| Symptom | Fix |
|---------|-----|
| **`Undefined control sequence`** | A misspelled command (e.g. `\sectoin`). Check the line in the error. |
| **Citation/reference "undefined"**, or `[?]` in the PDF | Build again — references need two passes. In VS Code just save twice. |
| **A figure shows a grey box** | Expected — the image file isn't in `figures/` yet. Add it. |
| **`File not found` for an image** | Check the file is in `figures/` and the name+extension match exactly (case-sensitive). |
| **Missing `}` / `Runaway argument`** | An unclosed brace. Check the braces in the line above the error. |
| **`Package X not found`** | Let MiKTeX install it when prompted, or run `miktex packages install X`. |
| **Build seems stuck the first time** | MiKTeX is installing packages — let it finish. |
| **Table/figure jumps to another page** | Normal LaTeX float behaviour. Usually fine; finalise positions at the very end. |

When in doubt: read the **first** error (later ones are often consequences of it),
fix it, and rebuild.

---

## 12. Before you submit — checklist

- [ ] **Delete Appendix B** (the LaTeX cheat-sheet): remove
      `\input{chapters/appendix-b}` from `main.tex` (and optionally delete the file).
- [ ] **Replace every figure placeholder** — no grey boxes left in the PDF.
- [ ] **Replace every guidance note** — search the project for `\emph{(` and
      replace each italic `(…)` reminder with your own prose.
- [ ] **Write the abstract** and fill the acknowledgment.
- [ ] Check the **title, your name, year, department** on the title page.
- [ ] Skim the **Table of Contents, List of Figures, List of Tables** — everything
      present and correctly named.
- [ ] Do a final clean build with **no red errors**.
- [ ] Check the page **margins** suit your binding (the left margin is already a bit
      wider for this).

---

## 13. Changing the look (advanced, optional)

Everything visual lives in `ist_master_thesis.cls`. Common tweaks (search the file
for these):

- **Line spacing:** `\onehalfspacing` → `\singlespacing` or `\doublespacing`.
- **Margins:** the `geometry` line near the top (`left=3cm, right=2.5cm, …`).
- **Citation style:** `style=ieee` in the `biblatex` line (e.g. `authoryear` for
  "(Author, 2024)" style).
- **Font size:** `12pt` in the `\LoadClass[...]` line.

If you're unsure, leave the class alone — the defaults are already a clean,
professional academic look.

---

## 14. Abbreviations and code listings

**Abbreviations.** Define each acronym once in `frontmatter/abbreviations.tex`:
```latex
\acro{gis}[GIS]{Geographic Information System}
```
Then in the text write `\ac{gis}`. On first use it prints the full form with the
short form in brackets ("Geographic Information System (GIS)"); after that it just
prints "GIS". Use `\acl{gis}` to force the long form, `\acs{gis}` the short. Every
defined term is listed in the **List of Abbreviations** in the front matter.

**Code listings.** For code or algorithms:
```latex
\begin{lstlisting}[language=Python,float=ht,
    caption={What it does.},label={lst:demo}]
def f(x):
    return x + 1
\end{lstlisting}
```
Reference it with `\cref{lst:demo}` → "Listing A.1". To pull in a whole file, use
`\lstinputlisting[language=Python]{scripts/foo.py}`. The style (monospace, line
numbers, thin rules) is preset in the class.

---

*Happy writing. Build early, build often, and add your figures as you go.*
