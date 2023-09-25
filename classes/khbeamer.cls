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
\setlength{\parskip}{.75\baselineskip plus 2pt minus 2pt}

% Beamer color settings
\usecolortheme{pine}

% Beamer text formatting
\setbeamercolor{alerted text}{fg=hl}
\setbeamerfont{block title}{size=\normalsize,series=\bfseries}
\setbeamertemplate{caption}[numbered]
\setbeamertemplate{itemize item}[circle]
\setbeamertemplate{itemize subitem}[triangle]
\setbeamertemplate{itemize subsubitem}{\raisebox{1pt}{$\blacksquare$}} % correct square bullet size
\setbeamertemplate{bibliography item}{} % remove icon
\setbeamercolor{bibliography entry note}{fg=darkgray}

%\addtobeamertemplate{block begin}{\renewcommand{\medskipamount}{\parskip}}


% Overwrite Beamer list formatting
%\def\@listi{\leftmargin\leftmargini
%            \topsep  0\p@
%            \parsep  0\p@
%            \itemsep 6\p@ \@plus2\p@ \@minus4\p@}
%\let\@listI\@listi
%\def\@listii{\leftmargin\leftmarginii
%              \topsep  4\p@ \@plus\p@ \@minus2\p@
%              \parsep  0\p@ \@plus\p@
%              \itemsep 4\p@ \@plus\p@ \@minus3\p@}
%\def\@listiii{\leftmargin\leftmarginiii
%              \topsep  2\p@ \@plus\p@ \@minus1\p@
%              \parsep  0\p@ \@plus\p@
%              \itemsep 2\p@ \@plus\p@ \@minus2\p@}
\def\@listi{\leftmargin\leftmargini
    \topsep  0\p@
    \parsep  6\p@ \@plus2\p@ \@minus4\p@
    \itemsep 0\p@}
\let\@listI\@listi
\def\@listii{\leftmargin\leftmarginii
    \topsep  0\p@ \@plus\p@
    \parsep  4\p@ \@plus\p@ \@minus3\p@
    \itemsep 0\p@ \@plus\p@}
\def\@listiii{\leftmargin\leftmarginiii
    \topsep  0\p@ \@plus\p@
    \parsep  3\p@ \@plus\p@ \@minus3\p@
    \itemsep 0\p@ \@plus\p@}

% Beamer frame formatting
\setbeamertemplate{frametitle continuation}[from second][(\insertcontinuationcount)]
\setbeamertemplate{navigation symbols}{}

% titlebar -- light text on dark background
\ifbool{titlebar}
    {\setbeamercolor{frametitle}{fg=white!95!themegreen,bg=themegreen}}
    {\setbeamercolor{frametitle}{bg=white}} %% spacing is different if no color set

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
