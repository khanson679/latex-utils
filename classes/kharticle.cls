\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{kharticle}
\RequirePackage{etoolbox}
\RequirePackage{kvoptions}

%% Class options

%% Font size
%\newcommand{\@basefontsize}{10}
%\DeclareVoidOption{9pt}{
%    \renewcommand{\@basefontsize}{9}
%    \PassOptionsToClass{\CurrentOption}{article}}
%\DeclareVoidOption{10pt}{
%    \renewcommand{\@basefontsize}{10}
%    \PassOptionsToClass{\CurrentOption}{article}}
%\DeclareVoidOption{11pt}{
%    \renewcommand{\@basefontsize}{11}
%    \PassOptionsToClass{\CurrentOption}{article}}
%\DeclareVoidOption{12pt}{
%    \renewcommand{\@basefontsize}{12}
%    \PassOptionsToClass{\CurrentOption}{article}}

%% Quick settings for title and headings
\newbool{small}
\newbool{tiny}
\newbool{compact}
\DeclareVoidOption{tiny}{\setbool{tiny}{true}}
\DeclareVoidOption{small}{\setbool{small}{true}}
\DeclareVoidOption{compact}{\setbool{compact}{true}}

%% Quick setting for title size, options normal/small/tiny (default=normal)
\DeclareStringOption[normal]{title}

%% Header/footer aoptions
\DeclareBoolOption{contactinhead}
\DeclareBoolOption{pagecountinfoot}

%% Forward other options to 'article' class
\DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{article}}

\ProcessKeyvalOptions*


%% Use standard article class as base for modifications
\LoadClass{article}
\RequirePackage{khlatex}

%% Set margins using 'geometry' package
\newlength{\@hmargin}
\newlength{\@vmargin}
\setlength{\@hmargin}{1in}
\setlength{\@vmargin}{1.25in}
\if@twocolumn
    \relax
\else
    \switchcase{\kh@ptsize}{
        {9}{\setlength{\@hmargin}{2in}}
        {10}{\setlength{\@hmargin}{1.75in}}
        {11}{\setlength{\@hmargin}{1.5in}}
        {12}{\setlength{\@hmargin}{1.25in}}}
    [\ClassError{kharticle}{Base font size '\kh@ptsize' not available.}]
\fi
%\ifdim \textwidth < 4.5in
%    \setlength{\@hmargin}{\dimexpr(\paperwidth-4.5in)/2\relax}
%\fi
\PassOptionsToPackage{hmargin=\@hmargin,vmargin=\@vmargin}{geometry}
\RequirePackage{geometry}

%% header and footer

\RequirePackage{fancyhdr}
\AtBeginDocument{\pagestyle{fancy}} % Ensure header/footer set after page layout

%% default settings
\renewcommand{\headrulewidth}{0pt}
\fancyhf{}
\fancyfoot[c]{\thepage}

%% Show page number and count in footer
\ifkharticle@pagecountinfoot
    \RequirePackage{lastpage}
    \fancyfoot[c]{\thepage/\pageref*{LastPage}}
\fi

\ifkharticle@contactinhead
%    \setbool{showemail}{false}
%    \setbool{showwebsiteintitle}{false}
%    \RequirePackage{titleps}
    \RequirePackage{hyperref}
    \RequirePackage{fontawesome5}
    \faStyle{regular}
    \newcommand{\makecontactheader}{
        \begingroup
        \hypersetup{hidelinks}%
        \footnotesize
        \noindent
        \faLink\thickspace
        \href{https://\@website}{\@website}%
        \hspace{.5em}|\hspace{.5em}%
        \faEnvelope\thickspace
        \href{mailto:\@email}{\@email}%
        \endgroup
    }
%    \geometry{headsep=.25in}
    \fancypagestyle{first}[fancy]{
        \fancyhead[r]{\makecontactheader}
    }
    \thispagestyle{first}
\fi

% Show document title or short title in footer
% This must be done when \title or \shorttitle is called
% \newcommand{\setfoottitle}{%
    %   \fancyfoot[l]{%
        %       \ifdefined\@shorttitle\@shorttitle\else\ifdefined\@title\@title\fi\fi}}
% \let\oldtitle\title
% \let\oldshorttitle\shorttitle
% \renewcommand{\title}[1]{\oldtitle{#1}\setfoottitle}
% \renewcommand{\shorttitle}[1]{\oldshorttitle{#1}\setfoottitle}


%% Section headings
\ifbool{small}{
%    \PassOptionsToPackage{small}{titlesec}
    \RequirePackage{titlesec}
}{}
\ifbool{tiny}{
%    \PassOptionsToPackage{tiny}{titlesec}
    \RequirePackage{titlesec}
}{}
\ifbool{compact}{
    \RequirePackage{titlesec}
    \titlespacing*{\section}{0pt}{3ex plus 1ex minus .2ex}{1.5ex plus .2ex}
    \titlespacing*{\subsection}{0pt}{2.5ex plus 1ex minus .2ex}{1.25ex plus .2ex}
    \titlespacing*{\subsubsection}{0pt}{2ex plus 1ex minus .2ex}{1.25ex plus .2ex}
    \titlespacing*{\paragraph}{0pt}{0.5\baselineskip plus 2pt}{1em}
    \titlespacing*{\subparagraph}{\parindent}{0.5\baselineskip plus 2pt}{1em}
}{}


%% Title formatting

\newcommand{\@titlefmt}{\LARGE}
\newcommand{\@pretitlefmt}{\Large}
\newcommand{\@subtitlefmt}{\Large}
\newcommand{\@keywordfmt}{\large}
\newcommand{\@authorfmt}{\large}
\newcommand{\@affiliationfmt}{\normalsize}
\newcommand{\@emailfmt}{\normalsize\ttfamily}
\newcommand{\@websitefmt}{\normalsize\ttfamily}
\newcommand{\@venuefmt}{\large}
\newcommand{\@datefmt}{\large}

\newlength{\@titleblocksep}
\setlength{\@titleblocksep}{1em}
\newlength{\@titleblocktmargin}
\setlength{\@titleblocktmargin}{2em}
\newlength{\@titleblockbmargin}
\setlength{\@titleblockbmargin}{1.5em}

%% handle class options 'small' and 'compact'
\ifbool{small}{
    \renewcommand{\@titlefmt}{\Large}
    \renewcommand{\@pretitlefmt}{\large}
    \renewcommand{\@subtitlefmt}{\large}
    \renewcommand{\@keywordfmt}{\large}
    \renewcommand{\@authorfmt}{\large}
    \renewcommand{\@affiliationfmt}{\large}
    \renewcommand{\@emailfmt}{\normalsize\ttfamily}
    \renewcommand{\@websitefmt}{\normalsize\ttfamily}
    \renewcommand{\@venuefmt}{\large}
    \renewcommand{\@datefmt}{\large}
%    \setlength{\@titleblocksep}{.6em}
}{}
\ifbool{tiny}{
    \renewcommand{\@titlefmt}{\large}
    \renewcommand{\@pretitlefmt}{\normalsize}
    \renewcommand{\@subtitlefmt}{\normalsize}
    \renewcommand{\@keywordfmt}{\normalsize}
    \renewcommand{\@authorfmt}{\normalsize}
    \renewcommand{\@affiliationfmt}{\normalsize}
    \renewcommand{\@emailfmt}{\small\ttfamily}
    \renewcommand{\@websitefmt}{\small\ttfamily}
    \renewcommand{\@venuefmt}{\normalsize}
    \renewcommand{\@datefmt}{\normalsize}
%    \setlength{\@titleblocksep}{.6em}
}{}
\ifbool{compact}{
    \setlength{\@titleblocksep}{0.5\@titleblocksep}
    \setlength{\@titleblocktmargin}{0.5\@titleblocktmargin}
%    \setlength{\@titleblockbmargin}{0.5\@titleblockbmargin}
}{}

%% Titleblock
\newcommand{\@titleblock}{%
    \begingroup%
    \setlength{\parskip}{0pt}%
    \setlength{\topskip}{0pt}%
%    \newpage%
    \vspace*{0pt}%
    \addvspace{\@titleblocktmargin}%
    \begin{center}%
        \centering%
        {\@titlefmt \@title\par}%
        \addvspace{\@titleblocksep}
        \ifdefvoid{\@subtitle}{}{{\@subtitlefmt \@subtitle\par}}%
        \addvspace{\@titleblocksep}
        \ifdefvoid{\@author}{}{{\@authorfmt \@author \par}}%
        \ifdefvoid{\@affiliation}{}{{\@affiliationfmt \@affiliation \par}}%
        \ifkharticle@contactinhead
        \else
            \ifdefvoid{\@email}{}{{\@emailfmt \@email \par}}%
            \ifdefvoid{\@website}{}{{\@websitefmt \@website \par}}%
        \fi
        \addvspace{\@titleblocksep}
        \ifdefvoid{\@venue}{}{{\@venuefmt \@venue \par}}%
        \ifdefvoid{\@date}{}{{\@datefmt \@date \par}}%
        \unskip
    \end{center}%
    \addvspace{\@titleblockbmargin}%
    \endgroup%
}

%% Overwrite definition for \maketitle
\renewcommand{\maketitle}{%
    \if@twocolumn
        \twocolumn[\@titleblock]
    \else
        \@titleblock
    \fi
}

%% add more space below abstract environment
%\renewenvironment{abstract}{%
%    \if@twocolumn
%        \section*{\abstractname}%
%    \else
%        \small
%        \begin{center}%
%            {\bfseries \abstractname\vspace{-.5em}\vspace{\z@}}%
%        \end{center}%
%        \quotation
%        \fi}
%{\if@twocolumn\else\endquotation\addvspace{\@titleblockbmargin}\fi}

%% text markup

\newcommand{\keyterm}{\textsc}
\let\kw\keyterm

\newcommand{\semph}{\textbf}