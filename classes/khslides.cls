\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{khslides}

\DeclareOption{43}{\PassOptionsToPackage{papersize={128mm,96mm}}{geometry}}
\DeclareOption{1610}{\PassOptionsToPackage{papersize={160mm,90mm}}{geometry}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ExecuteOptions{11pt,43}
\ProcessOptions\relax

\LoadClass{article}
\PassOptionsToPackage{hmargin=6mm,vmargin={4mm,6mm},footskip=1mm}{geometry}
\RequirePackage{geometry}
\RequirePackage{khlatex}
\RequirePackage{khcolor}
\RequirePackage{graphicx}

%% text formatting

\RequirePackage[skip=.75\baselineskip plus 2pt minus 6pt]{parskip}

% add more negative glue to skips
\renewcommand{\bigskipamount}{12pt plus 4pt minus 8pt}
\renewcommand{\medskipamount}{6pt plus 2pt minus 4pt}
\renewcommand{\smallskipamount}{3pt plus 1pt minus 2pt}

\RequirePackage{caption}
\captionsetup{font=small}

\setcounter{secnumdepth}{0}
%\setcounter{tocdepth}{1}

%% lists
\RequirePackage{enumitem}
\setlist{
    leftmargin=2em,
    partopsep=0pt,
    topsep=.25\baselineskip plus 2pt minus 2pt,
    itemsep=.25\baselineskip plus 2pt minus 2pt,
    parsep=0pt
}
\SetEnumitemKey{compact}{noitemsep}


%% footer
\RequirePackage{fancyhdr}
\AtBeginDocument{
%    \renewcommand{\headrulewidth}{0pt}
    \pagestyle{fancy}
    \fancyhead{}
    \fancyfoot{}
    \fancyfoot[r]{\tiny\thepage}
}

% Colors

\colorlet{theme}{darkred}

\colorlet{hla}{azure!90!black}
\colorlet{hlb}{redorange!90!black}
\colorlet{hlc}{green}
\colorlet{hld}{purple}
\colorlet{hle}{gold!90!black}
\colorlet{hl}{hla}

% Text markup

\newcommand{\semph}[1]{\textbf{#1}}
\newcommand{\demph}[1]{\textcolor{lightgray}{#1}}
\newcommand{\kw}[1]{\textcolor{hl}{\bfseries #1}}

\newcommand{\hlfont}{\bfseries\mathversion{bold}}
\newcommand{\hl}[1]{\textcolor{hl}{\hlfont #1}}
\newcommand{\hla}[1]{\textcolor{hla}{\hlfont #1}}
\newcommand{\hlb}[1]{\textcolor{hlb}{\hlfont #1}}
\newcommand{\hlc}[1]{\textcolor{hlc}{\hlfont #1}}
\newcommand{\hld}[1]{\textcolor{hld}{\hlfont #1}}
\newcommand{\hle}[1]{\textcolor{hle}{\hlfont #1}}

\newcommand{\parheading}[1]{\textbf{\color{theme}{#1}}}
\newcommand{\blockheading}[1]{\unskip\medskip\textbf{\color{theme}{#1}}\par}

% Title page
\newcommand{\@titlegraphic}{}
\newcommand{\titlegraphic}[1]{\def\@titlegraphic{#1}}

\newcommand{\@titlefmt}{\Large\bfseries\color{theme}}
\newcommand{\@pretitlefmt}{\large}
\newcommand{\@subtitlefmt}{\large}
\newcommand{\@authorfmt}{\normalsize}
\newcommand{\@emailfmt}{\normalsize\ttfamily}
\newcommand{\@datefmt}{\normalsize}

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
    {\large\bfseries\color{theme} #1 \par}
    \vspace*{0cm plus 1fill}
}{%
    \vspace*{0cm plus 2fill} % Allocate more space to the bottom
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

\newcommand{\sidebyside}[3][.5]{{%
    \def\gap{0.01}%
    \def\lwidth{\fpeval{#1-\gap/2}\linewidth}%
    \def\rwidth{\fpeval{1-\gap/2-#1}\linewidth}%
    \adjustbox{minipage=\lwidth,valign=t}{#2}%
    \hspace{\gap\linewidth}%
    \adjustbox{minipage=\rwidth,valign=t}{#3}%
}}

\renewenvironment{figure}
    {\bigskip\begin{center}
        \renewcommand{\caption}[1]{\par{\centering\small##1\par}}}
    {\end{center}\bigskip}
\renewenvironment{table}
    {\bigskip\begin{center}
        \renewcommand{\caption}[1]{\par{\centering\small##1\par}}}
    {\end{center}\bigskip}
