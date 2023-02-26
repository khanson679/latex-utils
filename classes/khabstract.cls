\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{khabstract}
\RequirePackage{etoolbox}

\newbool{compact}
\newbool{anonymous}
\DeclareOption{compact}{\booltrue{compact}}
\DeclareOption{anonymous}{\booltrue{anonymous}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

\LoadClass{article}
\RequirePackage{khlatex}
\RequirePackage{khfontsize}

\PassOptionsToPackage{margin=1in}{geometry}
\RequirePackage{geometry}

\PassOptionsToPackage{tiny,compact}{titlesec}
\usepackage{titlesec}

% title formatting
\renewcommand{\@titlesize}{\normalsize}
\renewcommand{\@titleweight}{\bfseries}
\renewcommand{\@pretitlesize}{\normalsize}
\renewcommand{\@subtitlesize}{\normalsize}
\renewcommand{\@keywordsize}{\normalsize}
\renewcommand{\@authorsize}{\normalsize}
\renewcommand{\@datesize}{\normalsize}

\renewcommand{\@titlespread}{1.0}
\setlength{\@posttitleadjust}{0em}
\renewcommand{\@titleblocksep}{0em}
\setlength{\@titleblocktmargin}{0em}
\setlength{\@titleblockbmargin}{0em}

\ifbool{compact}{
	% inline section headings
	\titleformat{\section}[runin]{\normalfont\bfseries}{\thesection.}{3pt}{}[\;]
}{}

% title block formatting
\renewcommand{\maketitle}{%
	\begingroup
	\setlength{\topskip}{0mm} % \prevent spurious space when \@titleblocktmargin is 0pt
	\vspace*{\@titleblocktmargin}
	\centering
	\setlength{\parskip}{\@titleblocksep}
	\ifdefvoid{\@pretitle}{}{\@formatpretitle}
	\@formattitle
	\ifdefvoid{\@subtitle}{}{\@formatsubtitle}
	\ifbool{anonymous}{}{
		\ifdefvoid{\@author}{}{\@formatauthor}
		\ifdefvoid{\@email}{}{\@formatemail}}
	\ifdefvoid{\@date}{}{\@formatdate}
	\ifdefvoid{\@keywords}{}{\@formatkeywords}
	\vspace{\@titleblockbmargin}
	\endgroup
}