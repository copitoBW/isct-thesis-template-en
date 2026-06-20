# Master's Thesis Template — Institute of Science Tokyo (Matsuoka Lab)

A clean, modular **English** LaTeX template for a master's thesis (pdfLaTeX).
**You don't need to know LaTeX to start** — follow the three steps below and you'll
have a PDF in a few minutes. All the formatting lives in one class file, so you
just write text.

> Writing in Japanese? There's a separate Japanese (upLaTeX) edition in its own
> repository.

---

## Step 1 — Install the tools (first time only)

You have two ways to build this thesis. **Pick ONE.**

### Option A — Overleaf (easiest; nothing to install)
1. Make a free account at <https://www.overleaf.com>.
2. Get the ZIP of this template (see **Step 2**).
3. In Overleaf: **New Project → Upload Project**, and drop the ZIP in. It builds
   in your browser — jump to **"What to edit"** below.

   *(Overleaf uses pdfLaTeX by default, which is exactly what this template needs.)*

### Option B — VS Code on your computer (works offline)
1. **LaTeX compiler:** install **MiKTeX** — <https://miktex.org/download>.
   (On the first build it may pause to download missing packages — click "Install".)
2. **Editor:** install **VS Code** — <https://code.visualstudio.com>.
3. **Extension:** in VS Code press `Ctrl+Shift+X`, search **"LaTeX Workshop"**, and
   click **Install**.

---

## Step 2 — Get the template files

- **Easiest:** on this repository's GitHub page, click the green **`Code`** button →
  **Download ZIP**, then unzip it somewhere you'll find again.
- **If you already use git:** `git clone <repository-url>`.

---

## Step 3 — Build it (turn the files into a PDF)

**On Overleaf:** it builds automatically; press **Recompile** to refresh.

**In VS Code:**
1. **File → Open Folder…** and choose the unzipped template folder.
2. Open **`main.tex`**.
3. Press the green **▶** button (top-right), or just **save** with `Ctrl+S`.
4. The PDF opens in a tab on the right and refreshes every time you save.

That's the whole loop: **edit → save → look at the PDF.** The finished file is
`build/main.pdf`.

---

## What to edit

| You want to… | Edit this |
|---|---|
| Set your title, name, supervisor, year | the top of **`main.tex`** |
| Write a chapter | the files in **`chapters/`** |
| Add an image | drop it in **`figures/`** |
| Add a reference | **`references.bib`** (cite it with `\cite{key}`) |

You rarely need to touch anything else.

## Folder layout

```
thesis/
├── main.tex                      # master file: your details + which chapters to include
├── ist_master_thesis.cls         # the class: ALL the formatting lives here (rarely touched)
├── references.bib                # bibliography database (cite with \cite{key})
├── frontmatter/
│   └── abstract.tex  acknowledgment.tex  abbreviations.tex
├── chapters/
│   └── 01-introduction.tex … 06-conclusion.tex  appendix-a.tex  appendix-b.tex
│      (appendix-b is a LaTeX cheat-sheet — delete before submission)
├── figures/
│   └── ist_logo.png              # official logo, used on the title page
└── .vscode/settings.json         # one-click build setup for VS Code
```

---

## Need more detail?

See **[`MANUAL.md`](MANUAL.md)** — a step-by-step guide to *writing*: figures,
tables, equations, citations, cross-references, abbreviations, code listings,
troubleshooting, and a pre-submission checklist. Start there whenever you're not
sure how to do something.

## Requirements (Option B only)
A TeX distribution (MiKTeX or TeX Live) with: `newtx`, `biblatex`, `biber`,
`titlesec`, `fancyhdr`, `cleveref`, `booktabs`, `caption`, `subcaption`,
`microtype`, `siunitx`, `listings`, `acronym`. MiKTeX installs any that are
missing on the first build. (Overleaf already has all of these.)

## Design choices
Classic academic serif (Times-like `newtx`), justified, 1.5 spacing, A4 with a
binding margin, black & white, running headers, `booktabs` tables, IEEE numeric
citations. Edit `ist_master_thesis.cls` to change any of these globally.
