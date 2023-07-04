\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{kharticle}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

\LoadClass{article}
\RequirePackage{khlatex}
% \RequirePackage{khfontsize}

\PassOptionsToPackage{margin={1.5in,1in}}{geometry}
\RequirePackage{geometry}

% Show page number and count in footer
\RequirePackage{fancyhdr}
\RequirePackage{lastpage}
\AtBeginDocument{
	\renewcommand{\headrulewidth}{0pt}
	\pagestyle{fancy}
	\fancyhead{}
%	\fancyhead[l]{\ifdefined\@author\@author\fi}
%	\fancyhead[r]{%
%		\ifdefined\@shorttitle\@shorttitle\else{\ifdefined\@title\@title\fi}\fi}
	\fancyfoot{}
	\fancyfoot[c]{\thepage/\pageref{LastPage}}
}

% Show document title or short title in footer
% This must be done when \title or \shorttitle is called
% \newcommand{\setfoottitle}{%
% 	\fancyfoot[l]{%
% 		\ifdefined\@shorttitle\@shorttitle\else\ifdefined\@title\@title\fi\fi}}
% \let\oldtitle\title
% \let\oldshorttitle\shorttitle
% \renewcommand{\title}[1]{\oldtitle{#1}\setfoottitle}
% \renewcommand{\shorttitle}[1]{\oldshorttitle{#1}\setfoottitle}

% Overwrite definition for \maketitle
%\renewcommand{\maketitle}{\vspace*{2em} \titleblock \vspace*{2em}}
