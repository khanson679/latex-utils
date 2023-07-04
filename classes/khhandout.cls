\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{khhandout}
\usepackage{etoolbox}
\newbool{twocolumn}

\DeclareOption{onecolumn}{%
	\PassOptionsToPackage{small}{titlesec}
	\PassOptionsToPackage{compact}{khlatex}
}
\DeclareOption{twocolumn}{%
	\PassOptionsToPackage{tiny}{titlesec}
	\PassOptionsToPackage{small,tight}{khlatex}
	\setbool{twocolumn}{true}
}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{kharticle}}
\ExecuteOptions{onecolumn}
\ProcessOptions\relax

\LoadClass{kharticle}
% \RequirePackage{khfontsize}
\RequirePackage{titlesec}
\RequirePackage{parskip}

\ifbool{twocolumn}{
	\geometry{twocolumn,landscape,margin=0.75in,columnsep=0.5in}
}{
	\geometry{margin=1in}
}
