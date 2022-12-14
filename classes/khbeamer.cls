\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{khbeamer}
\RequirePackage{etoolbox}
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

\setbeamertemplate{title page}{%
    \centering
    \vspace{2em}
    {\usebeamerfont{title}\usebeamercolor[fg]{title}\inserttitle}\par\bigskip
    \insertauthor\par
    \insertemail\par
    \insertinstitute\par\bigskip
    \inserttitlegraphic\par\bigskip
    \insertdate\par
}
