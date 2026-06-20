%% ==============================================================
%%  ist_master_thesis.cls
%%  Institute of Science Tokyo - Master's Thesis class (ENGLISH)
%%  Matsuoka Lab.  Classic academic serif, black & white, modular.
%%
%%  Compile engine : pdfLaTeX
%%  Bibliography    : biblatex + biber  (IEEE numeric)
%%
%%  This single, self-contained class holds ALL the formatting (fonts,
%%  margins, headers, title page, ...). To change the look of the thesis,
%%  edit this file -- the chapters stay pure content.
%%  v1.1  2026
%% ==============================================================
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ist_master_thesis}[2026/06/19 v1.1 ISCT Master thesis (English, pdfLaTeX)]

% --- Pass any unknown options through to `report' -------------
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions\relax
\LoadClass[12pt,a4paper,oneside]{report}

% --- Engine-only package: pdfLaTeX needs inputenc for UTF-8 ----
\RequirePackage[utf8]{inputenc}

% --- Language strings used by the layout below -----------------
\newcommand{\ist@supervisorlabel}{Supervisor:\ }
\newcommand{\ist@toctitle}{Table of Contents}
\newcommand{\ist@loftitle}{List of Figures}
\newcommand{\ist@lottitle}{List of Tables}

% --- Title-page metadata DEFAULTS -----------------------------
\def\@institution{Institute of Science Tokyo}
\def\@school{School of Environment and Society}
\def\@department{Department of Architecture and Building Engineering}
\def\@laboratory{}
\def\@degree{Master's Thesis}
\def\@supervisor{}
\def\@thesisyear{\the\year}
\def\@thesismonth{}
\def\@logofile{figures/ist_logo.png}

% ----------------------------------------------------------------
%  Fonts (Latin text + maths)
% ----------------------------------------------------------------
\RequirePackage[T1]{fontenc}
\RequirePackage[english]{babel} % Latin hyphenation; language for csquotes/cleveref
\RequirePackage{etoolbox}       % \ifdefempty for optional title-page lines
\RequirePackage{amsmath}        % load maths BEFORE the Times clone
\RequirePackage{newtxtext}      % Times-like serif text
\RequirePackage{newtxmath}      % matching maths (gives \mathbb, \mathcal, ...)

% ----------------------------------------------------------------
%  Page layout  (extra left margin reserved for binding)
% ----------------------------------------------------------------
\RequirePackage[a4paper,left=3cm,right=2.5cm,top=2.7cm,bottom=2.7cm]{geometry}
\RequirePackage{setspace}
\onehalfspacing
\setlength{\parindent}{1.5em}
\setlength{\parskip}{0.2em}

% ----------------------------------------------------------------
%  Graphics, tables, lists, units
% ----------------------------------------------------------------
\RequirePackage{graphicx}
\RequirePackage{xcolor}
\graphicspath{{figures/}}
\RequirePackage{booktabs}       % \toprule \midrule \bottomrule (no heavy grids)
\RequirePackage{array}
\RequirePackage{multirow}
\RequirePackage{enumitem}       % tidy list spacing
\RequirePackage{siunitx}        % \SI{3}{\decibel}, aligned number columns

% ----------------------------------------------------------------
%  Captions:  "Figure 1.1.  ..."  bold label, chapter numbering
% ----------------------------------------------------------------
\RequirePackage[font=small,labelfont=bf,labelsep=period]{caption}
\RequirePackage{subcaption}     % side-by-side sub-figures with (a)/(b) sub-captions

% ----------------------------------------------------------------
%  Code listings  (clean, monochrome --- for code or algorithms)
%    \begin{lstlisting}[language=Python,float=ht,
%        caption={What it does.},label={lst:demo}]
%      ...your code...
%    \end{lstlisting}
%    or  \lstinputlisting[language=Python]{scripts/foo.py}
%    Reference with \cref{lst:demo}  (cref name is set after cleveref below).
% ----------------------------------------------------------------
\RequirePackage{listings}
\lstset{
  basicstyle=\ttfamily\small,
  keywordstyle=\bfseries,
  commentstyle=\itshape\color{black!55},
  stringstyle=\color{black!70},
  numbers=left,
  numberstyle=\tiny\color{black!55},
  numbersep=8pt,
  frame=tb,                 % thin rules top & bottom (matches the booktabs look)
  framerule=0.4pt,
  rulecolor=\color{black!55},
  captionpos=b,             % caption below the listing
  columns=fullflexible,
  keepspaces=true,
  showstringspaces=false,
  breaklines=true,
  tabsize=2,
  xleftmargin=1.5em,
}

% ----------------------------------------------------------------
%  Sectioning: serif bold black, "1  Title" (no "Chapter" word)
% ----------------------------------------------------------------
\RequirePackage{titlesec}
\titleformat{\chapter}[hang]
  {\normalfont\huge\bfseries}{\thechapter}{0.8em}{}
\titlespacing*{\chapter}{0pt}{0pt}{1.5\baselineskip}
\titleformat{\section}
  {\normalfont\Large\bfseries}{\thesection}{0.6em}{}
\titleformat{\subsection}
  {\normalfont\large\bfseries}{\thesubsection}{0.6em}{}

\setcounter{secnumdepth}{2}      % number up to  X.Y.Z  (subsection)
\setcounter{tocdepth}{2}         % show the same depth in the ToC

% ----------------------------------------------------------------
%  Running headers (modern, professional)
%     header : chapter name (left) + page number (right) + thin rule
%     chapter-opening pages stay clean (bottom-centred number)
% ----------------------------------------------------------------
\RequirePackage{fancyhdr}
\setlength{\headheight}{15pt}
\pagestyle{fancy}
\fancyhf{}
\fancyhead[L]{\nouppercase{\small\leftmark}}
\fancyhead[R]{\small\thepage}
\renewcommand{\headrulewidth}{0.4pt}
\renewcommand{\chaptermark}[1]{\markboth{\thechapter.\ #1}{}}
\fancypagestyle{plain}{%        % first page of each chapter + front matter
  \fancyhf{}\fancyfoot[C]{\small\thepage}%
  \renewcommand{\headrulewidth}{0pt}}

% ----------------------------------------------------------------
%  Cross-references & links  (black, no colour, still clickable)
% ----------------------------------------------------------------
\RequirePackage[hidelinks,plainpages=false,hypertexnames=false]{hyperref}
\RequirePackage{cleveref}        % \cref -> "Figure 1.1", "Table 2.1", "Chapter 3"
\RequirePackage[autostyle]{csquotes}
\crefname{lstlisting}{Listing}{Listings}% \cref{lst:...} -> "Listing 1"
\Crefname{lstlisting}{Listing}{Listings}

% ----------------------------------------------------------------
%  Acronyms / abbreviations
%    Define each once in frontmatter/abbreviations.tex, then in the text:
%      \ac{key}  = full form on first use, short form afterwards
%      \acl{key} = long form,  \acs{key} = short form,  \acf{key} = full
% ----------------------------------------------------------------
\RequirePackage{acronym}

% ----------------------------------------------------------------
%  Bibliography (IEEE numeric, in citation order)
% ----------------------------------------------------------------
\RequirePackage[backend=biber,style=ieee,sorting=none]{biblatex}

% ================================================================
%  Title-page metadata setters + builder
% ================================================================
\newcommand{\institution}[1]{\def\@institution{#1}}
\newcommand{\school}[1]{\def\@school{#1}}
\newcommand{\department}[1]{\def\@department{#1}}
\newcommand{\laboratory}[1]{\def\@laboratory{#1}}
\newcommand{\degree}[1]{\def\@degree{#1}}
\newcommand{\supervisor}[1]{\def\@supervisor{#1}}
\newcommand{\thesisyear}[1]{\def\@thesisyear{#1}}
\newcommand{\thesismonth}[1]{\def\@thesismonth{#1}}
\newcommand{\logofile}[1]{\def\@logofile{#1}}

\newcommand{\makethesistitle}{%
  \begin{titlepage}
    \centering
    \vspace*{0.4cm}
    % Official logo (drawn only if present, so the doc always builds)
    \IfFileExists{\@logofile}{%
      \includegraphics[width=0.62\textwidth]{\@logofile}\par
      \vspace{1.4cm}}{%
      {\LARGE\bfseries \@institution\par}\vspace{1.4cm}}
    {\large \@school\par}
    {\large \@department\par}
    \ifdefempty{\@laboratory}{}{{\large \@laboratory\par}}% printed only if set
    \vspace{1.8cm}
    \rule{\textwidth}{0.4pt}\par
    \vspace{1.2cm}
    {\large\scshape \@degree\par}
    \vspace{1.0cm}
    {\LARGE\bfseries \@title\par}
    \vspace{1.2cm}
    \rule{\textwidth}{0.4pt}\par
    \vspace{2.0cm}
    {\large \@author\par}
    \vspace{0.4cm}
    {\large \ist@supervisorlabel\@supervisor\par}
    \vfill
    \ifdefempty{\@thesismonth}%
      {{\large \@thesisyear\par}}%
      {{\large \@thesismonth\ \@thesisyear\par}}%
    \vspace{0.8cm}
  \end{titlepage}
}

% ================================================================
%  Front-matter headings (centred, bold) and un-headed lists,
%  so Abstract / Table of Contents / List of Figures / Tables
%  all share one consistent, professional look.
% ================================================================
\newcommand{\frontmattersection}[1]{%
  \clearpage
  \phantomsection
  \addcontentsline{toc}{chapter}{#1}%
  \begin{center}{\normalfont\Large\bfseries #1}\end{center}
  \vspace{1.5em}
}

\renewcommand{\contentsname}{\ist@toctitle}
\newcommand{\printtoc}{\frontmattersection{\ist@toctitle}\@starttoc{toc}}
\newcommand{\printlistoffig}{\frontmattersection{\ist@loftitle}\@starttoc{lof}}
\newcommand{\printlistoftab}{\frontmattersection{\ist@lottitle}\@starttoc{lot}}

% --- pdfLaTeX-only refinement (load after the core fonts) ------
\RequirePackage{microtype}      % subtle kerning/protrusion -> cleaner justification

\endinput
