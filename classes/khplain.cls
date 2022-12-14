\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{khplain}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

\LoadClass{article}

\PassOptionsToPackage{compact}{khtitle}
\RequirePackage{khtitle}

\PassOptionsToPackage{margin={1.5in,1in}}{geometry}
\RequirePackage{geometry}

% Compact title
%\renewcommand{\maketitle}{\titleblock \vspace*{2em}}
