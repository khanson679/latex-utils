\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{khsimpleslides}

\LoadClass{extarticle}

\PassOptionsToPackage{papersize={128mm,96mm},margin=6mm,footskip=4mm}{geometry}
\RequirePackage{geometry}

\RequirePackage[skip=.5\baselineskip plus 2pt]{parskip}

\PassOptionsToPackage{small}{titlesec}
\RequirePackage{titlesec}

\PassOptionsToPackage{small}{khlatex}
\RequirePackage{khlatex}
\RequirePackage{khfontsize}
\RequirePackage{khcolor}

\RequirePackage{enumitem}
\setlist{topsep=.5\baselineskip}
\SetEnumitemKey{compact}{noitemsep}
%\setlist{itemsep=.25\baselineskip,parsep=.25\baselineskip plus 2pt}

\RequirePackage{caption}
\captionsetup{font=small}

\setcounter{secnumdepth}{0}

\RequirePackage{fancyhdr}
\AtBeginDocument{
	\renewcommand{\headrulewidth}{0pt}
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

\newcommand{\titlegraphic}[1]{\def\@titlegraphic{#1}}


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
%	\vspace{1em}
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
