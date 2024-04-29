\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{khabstract}
\RequirePackage{etoolbox}

\newbool{compact}
\newbool{anonymous}
\DeclareOption{compact}{\booltrue{compact}}
\DeclareOption{anonymous}{\booltrue{anonymous}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

\LoadClass{article}
\RequirePackage{khlatex}
\RequirePackage{geometry}
\geometry{margin=1in}
\PassOptionsToPackage{tiny,compact}{titlesec}
\usepackage{titlesec}

%% title formatting
\newcommand{\@titlefmt}{\normalsize\bfseries}
\newcommand{\@keywordfmt}{\small}
\newcommand{\@authorfmt}{\normalsize}
\newcommand{\@emailfmt}{\small\ttfamily}
\newcommand{\@venuefmt}{\small}
\newcommand{\@datefmt}{\normalsize}
\newcommand{\@titleblocksep}{0.2em}
\newlength{\@titleblocktmargin}
\setlength{\@titleblocktmargin}{0em}
\newlength{\@titleblockbmargin}
\setlength{\@titleblockbmargin}{0em}

\ifbool{compact}{
    % no space in title
    \renewcommand{\@titleblocksep}{0em}
    % inline section headings
    \titleformat{\section}[runin]{\normalfont\bfseries}{\thesection.}{3pt}{}[\;]
}{}

%% title block formatting
\renewcommand{\maketitle}{%
    \begingroup
    \setlength{\topskip}{0pt} % prevent spurious space when \@titleblocktmargin is 0pt
    \setlength{\parskip}{0pt}
    \vspace*{\@titleblocktmargin}
    \centering
    {\@titlefmt \@title \par}
    \vspace*{\@titleblocksep}
    \ifbool{anonymous}{}{
        \ifdefvoid{\@author}{}{{\@authorfmt \@author \par}}
        \ifdefvoid{\@email}{}{{\@emailfmt \@email \par}}}
    \vspace*{\@titleblocksep}
    \ifdefvoid{\@venue}{}{{\@venuefmt \@venue \par}}
    \ifdefvoid{\@date}{}{{\@datefmt \@date \par}}
    \vspace*{\@titleblocksep}
    \ifdefvoid{\@keywords}{}{{\@keywordfmt Keywords: \@keywords \par}}
    \vspace*{\@titleblockbmargin}
    \endgroup
}
