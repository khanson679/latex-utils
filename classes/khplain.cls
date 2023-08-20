\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{khplain}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{kharticle}}
\ProcessOptions\relax

\LoadClass{kharticle}

%% remove space before title
\setlength{\@titleblocktmargin}{0em}

%% reduce margins
\switchcase{\@basefontsize}{
    {10}{\setlength{\@hmargin}{1.5in}}
    {11}{\setlength{\@hmargin}{1.25in}}
    {12}{\setlength{\@hmargin}{1in}}}
\geometry{vmargin=1in,hmargin=\@hmargin}
