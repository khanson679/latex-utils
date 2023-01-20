\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{khabstract}
\RequirePackage{etoolbox}

%\newbool{compact}
%\DeclareOption{fancyfoot}{\booltrue{compact}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

\LoadClass{article}
\RequirePackage{khtitle}
\RequirePackage{khfontsize}

\PassOptionsToPackage{margin=1in}{geometry}
\RequirePackage{geometry}

%\RequirePackage[skip=6pt]{parskip}

% extra title info
\newcommand{\keywords}[1]{\def\@keywords{#1}}

% title block formatting
\renewcommand{\maketitle}{%
	\begingroup
    \centering
	\textbf{\@title} \\
	{\small Keywords: \@keywords \par}
	\endgroup
}
