# Master's Thesis Template — Institute of Science Tokyo (Matsuoka Lab)

A clean, modular **English** LaTeX template for a master's thesis (pdfLaTeX).
**You don't need to know LaTeX to start** — follow the three steps below and you'll
have a PDF in a few minutes. All the formatting lives in one class file, so you
just write text.

📄 **See what it produces:** [`sample.pdf`](sample.pdf)

> Writing in Japanese? There's a separate Japanese (upLaTeX) edition:
> **<https://github.com/copitoBW/isct-thesis-template-ja>**

---

## Step 1 — Install the tools (first time only)

You have two ways to build this thesis. **Pick ONE.**

### Option A — VS Code on your computer (recommended)
**Why local:** your thesis stays on your own machine (privacy), and you can pair
VS Code with an AI coding assistant (GitHub Copilot, Claude, Cursor, …) to help you
write and edit — the whole thesis is just plain text files.

1. **LaTeX compiler:** install **MiKTeX** — <https://miktex.org/download>.
   (On the first build it may pause to download missing packages — click "Install".
   Everything this template needs is installed automatically.)
2. **Editor:** install **VS Code** — <https://code.visualstudio.com>.
3. **Extension:** in VS Code press `Ctrl+Shift+X`, search **"LaTeX Workshop"**, and
   click **Install**.

### Option B — Overleaf (no install, runs in the browser)
Make a free account at <https://www.overleaf.com>, get the ZIP (see **Step 2**),
then **New Project → Upload Project** and drop the ZIP in. Convenient, but your
draft lives on Overleaf's servers rather than on your computer.

---

## Step 2 — Get the template files

- **Easiest:** on this repository's GitHub page, click the green **`Code`** button →
  **Download ZIP**, then unzip it somewhere you'll find again.
- **If you already use git:** `git clone https://github.com/copitoBW/isct-thesis-template-en.git`.

---

## Step 3 — Build it (turn the files into a PDF)

**In VS Code:**
1. **File → Open Folder…** and choose the unzipped template folder.
2. Open **`main.tex`**.
3. Press the green **▶** button (top-right), or just **save** with `Ctrl+S`.
4. The PDF opens in a tab on the right and refreshes every time you save.

**On Overleaf:** it builds automatically; press **Recompile** to refresh.

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
