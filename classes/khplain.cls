\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{khplain}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

\LoadClass{article}
\RequirePackage{khfontsize}

\PassOptionsToPackage{compact}{khlatex}
\RequirePackage{khlatex}

\PassOptionsToPackage{margin={1.5in,1in}}{geometry}
\RequirePackage{geometry}

% Compact title
%\renewcommand{\maketitle}{\titleblock \vspace*{2em}}
