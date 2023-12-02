\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{khbeamerho}
\RequirePackage{etoolbox}

\newbool{framenumbers}
\DeclareOption{framenumbers}{\booltrue{framenumbers}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{khhandout}}
\ProcessOptions\relax

\LoadClass{khhandout}
\RequirePackage{beamerarticle}
\RequirePackage{khbeamertools}
\RequirePackage{adjustbox}
\RequirePackage{qrcode}

%\mode<article>{
%% implement column environment
\renewenvironment<>{beamer@columnenv}[2][]
{\begin{minipage}{#2}}
{\end{minipage}}
\let\endcolumn\endbeamer@columnenv

%% make sure frame ends with a paragraph break
%\setbeamertemplate{frame end}{\par}

%% show small frame numbers
\renewcommand{\frametitle}[1]{%
    \subsection*{\ifbool{framenumbers}{\xsmall [\insertframenumber] }{}#1}}


%% title stuff
%\newcommand{\venue}[1]{\def\@venue{#1}}
\newcommand{\insertvenue}{\ifdefvoid{\@venue}{}{\@venue}}

\newcommand{\filelink}[1]{\def\@filelink{#1}}
\newcommand{\insertqrcode}{\ifdefvoid{\@filelink}{}{\qrcode[hyperlink,height=0.75in]{\@filelink}}}

\setbeamertemplate{title page}{%
    \centering
    \vspace{2em}
    {\usebeamerfont{title}\usebeamercolor[fg]{title}\inserttitle}\par\bigskip
    {\usebeamercolor[fg]{title}\insertsubtitle}\par
    {\large\insertauthor}\par
    \insertemail\par
    \insertwebsite\par
    \insertinstitute\par
    \medskip
    \insertvenue\par
    \insertdate\par
    \insertqrcode
}

\renewcommand{\blockheading}[1]{\textbf{#1}\par}

\renewenvironment{figure}
    {\medskip\begin{center}
        \renewcommand{\caption}[1]{\par{\centering\small##1\par}}}
    {\end{center}\medskip}
\renewenvironment{table}
    {\medskip\begin{center}
        \renewcommand{\caption}[1]{\par{\centering\small##1\par}}}
    {\end{center}\medskip}