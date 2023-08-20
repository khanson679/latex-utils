\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{khhandout}
\usepackage{etoolbox}

\newbool{twocolumn}

\DeclareOption{onecolumn}{
%	\PassOptionsToPackage{small}{titlesec}
%	\PassOptionsToPackage{compact}{khlatex}
}
\DeclareOption{twocolumn}{%
%	\PassOptionsToPackage{small,tight}{khlatex}
	\setbool{twocolumn}{true}
}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{kharticle}}
\ExecuteOptions{onecolumn,title=small}
\ProcessOptions\relax

\LoadClass{kharticle}
% \RequirePackage{khfontsize}
%\RequirePackage{titlesec}
%\RequirePackage{parskip}

%% remove space before title
\setlength{\@titleblocktmargin}{0em}

%% set page size for one or two columns
\ifbool{twocolumn}{
    \geometry{twocolumn,landscape,margin=0.75in,columnsep=0.5in}
}{
    \switchcase{\@basefontsize}{
        {10}{\setlength{\@hmargin}{1.5in}}
        {11}{\setlength{\@hmargin}{1.25in}}
        {12}{\setlength{\@hmargin}{1in}}}
    \geometry{hmargin=\@hmargin}
}

%% put title in first column
\renewcommand{\maketitle}{\@titleblock}
