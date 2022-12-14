\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{khbeamer}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{khhandout}}
\ProcessOptions\relax

\LoadClass{khhandout}
\RequirePackage{beamerarticle}
\RequirePackage{khbeamertools}

\mode<article>{
	\renewenvironment<>{beamer@columnenv}[2][]
	{\begin{minipage}{#2}}
	{\end{minipage}}
	\let\endcolumn\endbeamer@columnenv
}

