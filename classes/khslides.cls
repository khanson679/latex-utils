\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{khsimpleslides}

\LoadClass{extarticle}

\PassOptionsToPackage{papersize={128mm,96mm},margin=6mm,footskip=4mm}{geometry}
\RequirePackage{geometry}

\RequirePackage[skip=.5\baselineskip plus 2pt]{parskip}

\PassOptionsToPackage{small}{titlesec}
\RequirePackage{titlesec}

\PassOptionsToPackage{small}{khtitle}
\RequirePackage{khtitle}
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


\newenvironment{slide}[1]{%
	\clearpage
	{\large\bfseries #1}
%	\vspace{1em}
	\vspace{\fill}
}{%
	\vspace{\fill}
}

\newenvironment{indentblock}{%
\vspace{\parskip}
\hfill
\begin{minipage}{\dimexpr\textwidth-.25in}
}{%
\end{minipage}
\vspace{\parskip}
}

\newenvironment{centerblock}{%
\vspace{\parskip}
\begin{center}
\begin{minipage}{\dimexpr\textwidth-.5in}
}{%
\end{minipage}
\end{center}
\vspace{\parskip}
}