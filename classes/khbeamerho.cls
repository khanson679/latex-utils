\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{khbeamerho}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{khhandout}}
\ProcessOptions\relax

\LoadClass{khhandout}
\RequirePackage{beamerarticle}
\RequirePackage{khbeamertools}
\RequirePackage{adjustbox}

%\mode<article>{
%% implement column environment
\renewenvironment<>{beamer@columnenv}[2][]
{\begin{minipage}{#2}}
{\end{minipage}}
\let\endcolumn\endbeamer@columnenv

%% make sure frame ends with a paragraph break
%\setbeamertemplate{frame end}{\par}

%% show small frame numbers
\renewcommand{\frametitle}[1]{\subsubsection*{{\xsmall [\insertframenumber]} #1}}
%}

%% title stuff
%\newcommand{\venue}[1]{\def\@venue{#1}}
\newcommand{\insertvenue}{\ifdefvoid{\@venue}{}{\@venue}}

\setbeamertemplate{title page}{%
    \centering
    \vspace{2em}
    {\usebeamerfont{title}\usebeamercolor[fg]{title}\inserttitle}\par\bigskip
    {\usebeamercolor[fg]{title}\insertsubtitle}\par
    {\large\insertauthor}\par
    \insertemail\par
    \insertwebsite\par
    \medskip
    \insertvenue\par
    \insertdate\par
    \insertqrcode
}

\renewcommand{\blockheading}[1]{\textbf{#1}\par}

\renewenvironment{figure}
    {\begin{center}
        \renewcommand{\caption}[1]{\par{\centering\small##1\par}}}
    {\end{center}}
\renewenvironment{table}
    {\begin{center}
        \renewcommand{\caption}[1]{\par{\centering\small##1\par}}}
    {\end{center}}