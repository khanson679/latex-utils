\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{khbeamer}
\RequirePackage{etoolbox}
\RequirePackage{qrcode}
\RequirePackage{khcolor}

\newbool{fancyfoot}
\newbool{titlebar}

\DeclareOption{fancyfoot}{\booltrue{fancyfoot}}
\DeclareOption{titlebar}{\booltrue{titlebar}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{beamer}}
\ProcessOptions\relax

% Columns add to \textwidth, rather than extending into margins
\PassOptionsToClass{onlytextwidth}{beamer}

\LoadClass{beamer}
\RequirePackage{khfontsize}
\RequirePackage{khbeamertools}

% Basic formatting
\setlength{\parskip}{.5\baselineskip plus 2pt}

% Beamer color settings
\usecolortheme{pine}

% Beamer text formatting
\setbeamercolor{alerted text}{fg=hl}
%\setbeamerfont{block title}{series=\bfseries}
\setbeamertemplate{caption}[numbered]
\setbeamertemplate{itemize items}[circle]
\setbeamertemplate{bibliography item}{} % remove icon
\setbeamercolor{bibliography entry note}{fg=darkgray}

% Beamer frame formatting
\setbeamertemplate{frametitle continuation}[from second][(\insertcontinuationcount)]
\setbeamertemplate{navigation symbols}{}

% titlebar -- light text on dark background
\ifbool{titlebar}
    {\setbeamercolor{frametitle}{fg=white!95!themegreen,bg=themegreen}}
    {}

% Footline
% Show slide number, but not total
% If fancy, show author/title/date
\ifbool{fancyfoot}{%
    \setbeamertemplate{footline}{
        \rule[-0.55\baselineskip]{0pt}{1.6\baselineskip}
        \hspace{.5em}
        \insertauthor{}
        \;\rule[-0.2em]{.5pt}{1em}\;
        \insertdate {}
        \hfill
        \insertshorttitle{}
        \;\rule[-0.2em]{.5pt}{1em}\;
        \insertframenumber{}
        \hspace{.5em}
    }
}{%
    \setbeamertemplate{footline}{
        \rule[-0.55\baselineskip]{0pt}{1.6\baselineskip}
        \hfill
        \insertframenumber{}
        \hspace{.5em}
    }
}

% titlepage
\newcommand{\email}[1]{\def\@email{#1}}
\newcommand{\insertemail}{\ifdefvoid{\@email}{}{\@email}}

\newcommand{\website}[1]{\def\@website{#1}}
\newcommand{\insertwebsite}{\ifdefvoid{\@website}{}{\@website}}

\newcommand{\venue}[1]{\def\@venue{#1}}
\newcommand{\insertvenue}{\ifdefvoid{\@venue}{}{\@venue}}

\newcommand{\filelink}[1]{\def\@filelink{#1}}
\newcommand{\insertqrcode}{\ifdefvoid{\@filelink}{}{%
    \hfill
    \tikz[remember picture,overlay]{%
        \node[xshift=-0.6in,yshift=0.6in] at (current page.south east)%
            {\qrcode[hyperlink,height=0.75in]{\@filelink}};}}}

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
    \inserttitlegraphic\par
    \medskip
    \insertvenue\par
    \insertdate\par
    \insertqrcode
}


% section page
\setbeamertemplate{section page}{%
    {\usebeamerfont{title}\usebeamercolor[fg]{title}\insertsection}\par
}