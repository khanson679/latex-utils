\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{conlangsho}[2026/01/25 Handouts for conlangs class, based in part on code by Lydia Newkirk and the "ling-macros" package]

\RequirePackage{etoolbox}

% Options for key, key with TA notes, and inclass uses

% Default: don't show answers
\newcommand{\ans}[1]{}%
\newcommand{\ansblank}[2]{\blank{#1}\rule{0pt}{1.5em}}%
\newcommand{\tanote}[1]{}%
\newcommand{\spans}[2]{\vspace{#1}}%


% key: show answers but not TA notes
\DeclareOption{key}{%
  \renewcommand{\ans}[1]{\textcolor{red}{#1}}%
  \renewcommand{\ansblank}[2]{\underline{\makebox[#1]{\textcolor{red}{#2}\rule{0pt}{1.5em}}}}%
  \renewcommand{\tanote}[1]{}%
  \renewcommand{\spans}[2]{\parbox[t][#1]{\textwidth}{\ans{#2}}}%
}

% takey: show answers (red) and TA notes (blue)
\DeclareOption{takey}{%
  \ExecuteOptions{key}
  \renewcommand{\tanote}[1]{\textcolor{blue}{#1}}%
}

% inclass: hide answers and TA notes (dummy option)
\DeclareOption{inclass}{%
%  \renewcommand{\ans}[1]{}%
%  \renewcommand{\ansblank}[2]{\blank{#1}\rule{0pt}{1.5em}}%
%  \renewcommand{\tanote}[1]{}%
%  \renewcommand{\spans}[2]{\vspace{#1}}%
}

% fancy double page formatting (ignores big/small margins settings)
\newif\iftwoup
\DeclareOption{2up}{\twouptrue}

% big draft mark
\newif\ifpreview
\DeclareOption{preview}{\previewtrue}

% control margins (bigmargins used for margin notes)
\newif\ifbigmargins
\DeclareOption{bigmargins}{\bigmarginstrue}
\DeclareOption{smallmargins}{\bigmarginsfalse}

% load lingmacros
\newif\iflingmacros
\DeclareOption{lingmacros}{\lingmacrostrue}

% high-level settings
\DeclareOption{handout}{\ExecuteOptions{bigmargins}}
\DeclareOption{worksheet}{\ExecuteOptions{smallmargins}}
\DeclareOption{assignment}{\ExecuteOptions{smallmargins}}
\DeclareOption{pset}{\ExecuteOptions{bigmargins}}
\DeclareOption{quiz}{\ExecuteOptions{smallmargins}}

\ExecuteOptions{handout}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions \relax

%% Page formatting

\PassOptionsToPackage{letterpaper}{geometry}

\iftwoup
    % Automatically format two pages to a side
    \PassOptionsToClass{9pt}{extarticle}
    \PassOptionsToPackage{vmargin=.75in,hmargin=1in,marginpar=0.5in,twocolumn,landscape,columnsep=0.5in,footskip=.25in}{geometry}
    %\patchcmd{\maketitle}
    % {\twocolumn[\@maketitle]}
    % {\@maketitle}
    % {}{}
\else
    % Stardard size
    \PassOptionsToClass{11pt}{extarticle}
    \ifbigmargins
        \PassOptionsToPackage{top=1in,bottom=2in,left=1in,right=2in}{geometry}
    \else
        \PassOptionsToPackage{margin=1in}{geometry}
    \fi
\fi

\LoadClass{extarticle}
\RequirePackage{geometry}

%% Draft watermark
\ifpreview
\RequirePackage{draftwatermark}\SetWatermarkText{DRAFT}
\fi

%% Font/language
\RequirePackage{fontspec}
\RequirePackage[mono=false]{libertine}
\RequirePackage[libertine]{newtxmath}
%\RequirePackage{amssymb}
%\RequirePackage{polyglossia} \setmainlanguage[variant=american]{english}
\RequirePackage{microtype}

%% Text formatting
\RequirePackage[small]{titlesec}
\RequirePackage[skip=.5em plus .25em minus .25em]{parskip}
%\setlength{\intextsep}{2em plus .5em minus .5em}

%% List formatting
\RequirePackage[inline]{enumitem}
\SetEnumitemKey{tight}{parsep=0em} % toggle to remove space between items
\setlist{parsep=\parskip, itemsep=0pt, topsep=.25em plus .25em minus .15em, partopsep=0pt}
\setlist[description]{leftmargin=1em,labelindent=1em}
\setlist[2]{topsep=0em, parsep=0.75\parsep}
\newlist{wordlist}{itemize}{1}
\setlist[wordlist]{left=1em,label=}
\newlist{wordlist*}{itemize*}{1}
\setlist[wordlist*]{label=,itemjoin=\hspace{2em plus 1em minus 1em}}
\newlist{problems}{enumerate}{2}
\setlist[problems,1]{label=Q\arabic*.\space}
\setlist[problems,2]{label=(\alph*)\space}

%% Colors
\RequirePackage[cmyk]{xcolor}

%% Misc. packages
\RequirePackage{soul}
\RequirePackage{xspace}
\RequirePackage{graphicx}
\RequirePackage{adjustbox}
\RequirePackage{standalone}
\RequirePackage{fancyhdr}
\usepackage[bottom]{footmisc}
\RequirePackage[colorlinks=true,allcolors=blue]{hyperref}
\RequirePackage[]{multicol} \setlength{\multicolsep}{\parskip}
%\RequirePackage{siunitx}
\RequirePackage{float}
%\RequirePackage{colortbl}
\usepackage{multirow}
\RequirePackage{booktabs}
\RequirePackage{makecell}
%\RequirePackage{natbib}
%\RequirePackage{enumerate}
% \graphicspath{ {img/} }


% the linguistics packages I typically use. Can probably change at will without breaking things
%\RequirePackage[linguistics]{forest}
%\RequirePackage{tipa}
%\RequirePackage{vowel}
\usepackage{gb4e}\noautomath
\iflingmacros
\RequirePackage{ling-macros}
\fi
%\RequirePackage{ling-macros} % removed due to craziness, with needed commands implemented below


\newcommand{\@coursename}{LING 1190, Spring 2026}
\newcommand{\@documentid}{}
\newcommand{\documentid}[1]{\def\@documentid{#1}}

%% customtitle block
\def\@maketitle{%
%\null
% \vskip 2em%
{\centering\bfseries\sffamily\LARGE \@title \par}%
\vskip .2em \hrule \vskip .3em
{\parskip=0pt\noindent \bfseries\sffamily
  \ifdefvoid{\@documentid}{\@date}{\@documentid\ (\@date)}
  \ans{-- KEY}
  \hfill \@coursename \par}%
\addvspace{\bigskipamount}%
}

%\titlelabel{} % Suppress numbering on sections etc.

%% header/footer
\pagestyle{fancyplain}
\fancyhf{}
\cfoot{}
\lfoot{\thepage}
\renewcommand{\headrulewidth}{0pt}

%% ``Business'' heading for handouts
\newcommand{\business}[1]{{\raggedright \textbf{Business:}\\ #1\par}}

%% Name/ID for worksheets
\newcommand{\studentname}{\textbf{Name:} \blank{15em}\qquad \textbf{ID:}\blank{12em}\par\bigskip}
%\newcommand{\studentname}{\alert{Name:} \blank{15em}\par\bigskip}

% For blank spaces that can be filled in
\newcommand{\blank}[1]{\underline{\hspace{#1}}}
\newcommand{\blankline}{\underline{\hspace*{\fill}}}

% Quiz margin notes
\newcommand{\snote}[1]{\marginpar{\raggedright \scriptsize #1}}

% doesn't seem to do anything
\newcommand{\BlankCell}{} % For an IPA chart I took from the internet at one point. Thanks Tim Mahrt!

% table formatting
\newenvironment{inlinetable}{\par\smallskip}{\par\smallskip}

%% from https://tex.stackexchange.com/a/94702/91605
\newenvironment{absolutelynopagebreak}
  {\par\nobreak\vfil\penalty0\vfilneg
   \vtop\bgroup}
  {\par\xdef\tpd{\the\prevdepth}\egroup
   \prevdepth=\tpd}

%% formatting commands from ling-macros, to preserve compatibility

% text formatting
\providecommand{\alert}{\textbf}
\providecommand{\ol}{\textit}
\providecommand{\term}{\textsc}

% math formatting
\providecommand{\set}[1]{\ensuremath{\{#1\}}}

% linguistics formatting
\providecommand{\becomes}{\ensuremath{\rightarrow}\xspace}
\providecommand{\spot}{\rule[-1pt]{2ex}{.5pt}\xspace}      % location of change
\providecommand{\m}[1]{\textsc{#1}} % morpheme glossing as small caps: clashes with fontspec, where \m does stuff.
\providecommand{\den}[1]{\ensuremath{\llbracket}\,{#1}\,\ensuremath{\rrbracket}}

%% other linguistics commands

\newcommand{\orth}[1]{$\langle$#1$\rangle$}
\newcommand{\zero}{\ensuremath{\varnothing}\xspace}

% For features
\newcommand{\mf}[1]{[\ensuremath{-}#1]}
\newcommand{\pf}[1]{[+#1]}


\endinput
