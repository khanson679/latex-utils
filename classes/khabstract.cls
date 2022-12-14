\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{khabstract}

\RequirePackage{khtitle}

\RequirePackage{xkeyval}
\DeclareOptionX{hmargin}[1in]{\PassOptionsToPackage{hmargin=#1}{geometry}}
\DeclareOptionX{vmargin}[1in]{\PassOptionsToPackage{vmargin=#1}{geometry}}
\DeclareOptionX*{\PassOptionsToClass{\CurrentOption}{extarticle}}
\ExecuteOptionsX{hmargin,vmargin}
\ProcessOptionsX*

\LoadClass{extarticle}

\RequirePackage{geometry}
\RequirePackage[skip=6pt]{parskip}
% extra title info
\newcommand{\keywords}[1]{\def\@keywords{#1}}

% title block formatting
\renewcommand{\maketitle}{%
	\begin{centering}
	\textbf{\@title} \\
	Keywords: \@keywords \par
	\end{centering}
}
