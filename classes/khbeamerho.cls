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
\PassOptionsToPackage{colorlinks=true,allcolors=darkblue}{hyperref}
\RequirePackage{hyperref}
\RequirePackage{qrcode}

%% implement missing beamer elements

\renewenvironment<>{beamer@columnenv}[2][]
    {\begin{minipage}{#2}}
    {\end{minipage}}
\let\endcolumn\endbeamer@columnenv

%% make sure frame ends with a paragraph break
%\setbeamertemplate{frame end}{\par}

%% show small frame numbers
\newcommand{\textsquarebullet}{\raisebox{1pt}{\rule{.4em}{.4em}}}
\renewcommand{\frametitle}[1]{%
    \subsection*{\ifbool{framenumbers}%
        {{\xsmall[\insertframenumber]}\space#1}
        {\textsquarebullet\space#1\space\textsquarebullet}}}


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

%% frame elements

\setbeamertemplate{block begin}
    {\par\vskip\smallskipamount{\noindent\textbf{\insertblocktitle}}\par\noindent\ignorespaces}
\setbeamertemplate{block end}{\vskip\smallskipamount}

\renewcommand{\blockheading}[1]{\medskip\textbf{#1}\par}

\renewenvironment{figure}
    {\smallskip\begin{center}
        \renewcommand{\caption}[1]{\par{\centering\small##1\par}}}
    {\end{center}\smallskip}
\renewenvironment{table}
    {\smallskip\begin{center}
        \renewcommand{\caption}[1]{\par{\centering\small##1\par}}}
    {\end{center}\smallskip}
