\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{khslides}

\LoadClass{article}
\RequirePackage{khlatex}
\RequirePackage{khcolor}
\RequirePackage{graphicx}

\PassOptionsToPackage{papersize={128mm,96mm},margin=6mm,footskip=4mm}{geometry}
\RequirePackage{geometry}

\RequirePackage[skip=.5\baselineskip plus 2pt minus 2pt]{parskip}

\PassOptionsToPackage{small}{titlesec}
\RequirePackage{titlesec}

\RequirePackage{enumitem}
\setlist{
    partopsep=0pt,
    topsep=.25\baselineskip plus 2pt minus 2pt,
    itemsep=.25\baselineskip plus 2pt minus 2pt,
    parsep=0pt
}
\SetEnumitemKey{compact}{noitemsep}
%\setlist{itemsep=.25\baselineskip,parsep=.25\baselineskip plus 2pt}

\RequirePackage{caption}
\captionsetup{font=small}

\setcounter{secnumdepth}{0}

\RequirePackage{fancyhdr}
\AtBeginDocument{
%    \renewcommand{\headrulewidth}{0pt}
    \pagestyle{fancy}
    \fancyhead{}
    \fancyfoot{}
    \fancyfoot[r]{\tiny\thepage}
}

% Text markup

\colorlet{hla}{azure!90!black}
\colorlet{hlb}{redorange!90!black}
\colorlet{hlc}{green}
\colorlet{hld}{purple}
\colorlet{hle}{gold!90!black}
\colorlet{hl}{hla}

\newcommand{\semph}[1]{\textbf{#1}}
\newcommand{\demph}[1]{\textcolor{gray}{#1}}

\newcommand{\hl}[1]{\textcolor{hl}{#1}}
\newcommand{\hla}[1]{\textcolor{hla}{#1}}
\newcommand{\hlb}[1]{\textcolor{hlb}{#1}}
\newcommand{\hlc}[1]{\textcolor{hlc}{#1}}
\newcommand{\hld}[1]{\textcolor{hld}{#1}}
\newcommand{\hle}[1]{\textcolor{hle}{#1}}


% Title page
\newcommand{\@titlegraphic}{}
\newcommand{\titlegraphic}[1]{\def\@titlegraphic{#1}}

\newcommand{\@titlefmt}{\LARGE}
\newcommand{\@pretitlefmt}{\Large}
\newcommand{\@subtitlefmt}{\Large}
\newcommand{\@keywordfmt}{\large}
\newcommand{\@authorfmt}{\large}
\newcommand{\@emailfmt}{\normalsize\ttfamily}
\newcommand{\@datefmt}{\large}

\newlength{\@titleblocksep}
\setlength{\@titleblocksep}{1em}
\newlength{\@titleblocktmargin}
\setlength{\@titleblocktmargin}{2em}
\newlength{\@titleblockbmargin}
\setlength{\@titleblockbmargin}{1.5em}

\renewcommand{\maketitle}{%
    \begingroup%
    \setlength{\topskip}{0pt}%
    \vspace*{0pt}%
    \addvspace{\@titleblocktmargin}%
    \begin{center}%
        \centering%
        {\@titlefmt \@title\par}%
        \addvspace{\@titleblocksep}
        \ifdefvoid{\@subtitle}{}{{\@subtitlefmt \@subtitle\par}}%
        \addvspace{\@titleblocksep}
        \ifdefvoid{\@author}{}{{\@authorfmt \@author \par}}%
        \ifdefvoid{\@email}{}{{\@emailfmt \@email \par}}%
        \addvspace{\@titleblocksep}
        \ifdefvoid{\@titlegraphic}{}{\@titlegraphic \par}%
        \addvspace{\@titleblocksep}
        \ifdefvoid{\@date}{}{{\@datefmt \@date \par}}%
        \unskip
    \end{center}%
    \addvspace{\@titleblockbmargin}%
    \endgroup%
}

% Structure

%\newcommand{\slide}[1]{\section{#1}\vspace{1em}}
%\newcommand{\sectionbreak}{\clearpage} % requires titlesec

\newenvironment{titleslide}{%
    \setlength{\topskip}{0pt}
    \vspace*{\fill}
}{%
    \vspace*{0pt plus 2fill}
}

\newenvironment{slide}[1]{%
    \clearpage
    {\large\bfseries #1 \par}
%    \vspace{1em}
    \vspace*{\fill}
}{%
    \vspace*{0pt plus 2fill} % Allocate more space to the bottom
}

%% Alias beamer "frame" environment
%\newenvironment{frame}[1][]
%{\begin{slide}{#1}}
%{\end{slide}}

\newenvironment{indentblock}[1][.25in]{%
\par\medskip
\hfill
\begin{minipage}{\dimexpr\textwidth-#1}
}{%
\end{minipage}
\par\medskip
}

\newenvironment{centerblock}[1][.9]{%
\par\medskip
\hfill
\begin{minipage}{#1\textwidth}
}{%
\end{minipage}
\hfill
\par\medskip
}
