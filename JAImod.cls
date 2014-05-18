%
% JAIbookchapter - JAI book chapters
% Copyright (C) 2006 Otávio Lemos and Fabiano Ferrari (ICMC/USP)


%=======================================================================
% Identification
%=======================================================================
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{JAImod}[24/04/2006 v0.1 by Lemos and Ferrari (ICMC/USP)]

%=======================================================================
% Declaration of variables
%=======================================================================
\def\smallauthor#1{\def\smallauthor{#1}}
\def\smalltitle#1{\def\smalltitle{#1}}


%=======================================================================
% Declaration of class options
%=======================================================================
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\DeclareOption{a5paper}
   {\setlength\paperheight {210mm}%
    \setlength\paperwidth  {140mm}}
\ProcessOptions\relax

%=======================================================================
% Main class inheritance and package loading
%=======================================================================
\LoadClass[10pt,a5paper,twoside]{article}
% \RequirePackage{mathptmx}
\RequirePackage{times}
\RequirePackage{indentfirst}
% Package Geometry -- setting margins
\RequirePackage
[paperwidth=14cm, paperheight=21cm,
 top=2cm, left=16mm, right=14mm,
 height=172mm, width=11cm, bottom=18mm,
 twoside] {geometry}
\RequirePackage{fancyhdr} 

%=======================================================================
% Defining headers and footers
%=======================================================================
\pagestyle{fancy}
\fancyhead{} % delete the defaults
\chead[\smallauthor]{\smalltitle}
\renewcommand{\headrulewidth}{0pt}
\cfoot{}
\fancyfoot[LE,RO]{\footnotesize\thepage}

% updated by Lemos 05/25/2007
\fancypagestyle{firstpage}{%
\fancyhead{} % delete the defaults
\renewcommand{\headrulewidth}{0pt}
\cfoot{}
\fancyfoot[LE,RO]{\footnotesize\thepage}
} 
%=======================================================================
% Font styles and sizes
%=======================================================================
\newcommand{\chapnamesize}{\fontsize{18}{23}\selectfont}
\newcommand{\chapnumsize}{\fontsize{48}{60}\selectfont}
\newcommand{\titlesize}{\fontsize{11}{13}\selectfont}
\newcommand{\authorsize}{\fontsize{10}{12}\selectfont}
\newcommand{\sectionsize}{\fontsize{10}{13}\selectfont}
\newcommand{\captionsize}{\fontsize{10}{13}\selectfont}
\newcommand{\abstractsize}{\fontsize{7}{12}\selectfont}
\newcommand{\bibsize}{\fontsize{9}{11}\selectfont}
\newcommand{\bodysize}{\fontsize{9}{11}\selectfont}
\newcommand{\myfootnotesize}{\fontsize{8}{10}\selectfont}

% utilizando o normalsize como small, o tamanho do corpo vai para 9pt
\renewcommand{\normalsize}{\small}

%utilizando o default como serifado
\renewcommand{\rmdefault}{phv} 

%=======================================================================
% Redefinition of \maketitle
%=======================================================================
\renewcommand{\maketitle}{  
      $\vspace{1cm}$
    {\flushright\titlesize\sffamily\textbf{\@title}\\[4ex]}
    {\flushright\sffamily\authorsize\@author\\[4ex]}
}

\long\def\@makefntext#1{%
      \setlength{\parindent}{0pt}%
      \begin{list}{}{%
          \setlength{\labelwidth}{.5mm}%
          \setlength{\labelsep}{.5mm}%
          \setlength{\listparindent}{-1pc}%
          \setlength{\leftmargin}{\labelwidth}%
          \setlength{\topsep}{0pt}% let footnotesep space the footnotes
          \setlength{\parsep}{0pt}%
          \setlength{\itemindent}{0pt}% footnote numbers at left margin
          \setlength{\itemsep}{0pt}%
          \myfootnotesize
          \sffamily}%
        \item[$^{\@thefnmark}$]#1%
      \end{list}}


%=======================================================================
% [Re]definition of environments abstract and resumo 
%=======================================================================
\renewenvironment{abstract}[1][Abstract]{%
    \itshape\abstractsize
    \begin{center}
    \textbf{#1}
    \end{center}
}{%
}

\newenvironment{resumo}{%
    \begin{abstract}[Resumo]
}{%
    \end{abstract}    
}


%=======================================================================
% Section heading and numbering
%=======================================================================
\renewcommand{\section}{%
    \@startsection{section}{1}{0pt}{-6pt}{.1pt}
        {\reset@font\sectionsize\sffamily\itshape\bfseries}%
}
\renewcommand{\subsection}{%
    \@startsection{subsection}{2}{0pt}{-6pt}{.1pt}
        {\reset@font\sectionsize\sffamily\itshape\bfseries}%
}

\renewcommand{\paragraph}{%
    \@startsection{paragraph}{4}{0pt}{-3pt}{.1pt}
        {\reset@font\sectionsize\sffamily\itshape\bfseries}%
}

\newcounter{chapter}\setcounter{chapter}{1}
\renewcommand{\thesection}{\thechapter.\arabic{section}}
\def\@seccntformat#1{\csname the#1\endcsname.\hspace{.5em}}

%=======================================================================
% Figure and table captions
%=======================================================================
\setlength{\abovecaptionskip}{6pt}
\setlength{\belowcaptionskip}{6pt}
\def\@makecaption#1#2{%
    \def\@fmt{\sffamily\captionsize\textbf{#1. #2}}%
    \vskip\abovecaptionskip
    \sbox\@tempboxa{\@fmt}%
    \ifdim \wd\@tempboxa >\hsize
        \setlength{\@tempdima}{\textwidth}%
        \addtolength{\@tempdima}{-16mm}%
        \centerline{\parbox{\@tempdima}{\@fmt}}
    \else
        \centerline{\@fmt}
    \fi
    \vskip\belowcaptionskip
}
\renewcommand{\thefigure}{\thechapter.\arabic{figure}}
\renewcommand{\thetable}{\thechapter.\arabic{table}}
