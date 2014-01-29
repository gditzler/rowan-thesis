%%% ====================================================
%%% File Name: ruthesis.cls
%%% Last Modification Date: %G%     %U%
%%% Current Version: %M%    %I%
%%% File Creation Date: Tue Nov 21 11:09:28 1995
%%% Author: Jan Erik Odegard  <odegard@ece.rice.edu>
%%%
%%% Copyright: All software, documentation, and related files in this
%%%            distribution are Copyright (c) 1995-1996 Rice University
%%% ====================================================
%%%
%%% This is a port of the original Rice thesis style for LaTeX to
%%% LaTeX2e. The port is still not complete but it does work with a 
%%% few minor hacks in your actual documant (e.g., the linespacing for
%%% tables is not right but can be fixed by inserting the command 
%%% '\linespacing{1}' inside the 'table' environemnt as nedded for
%%% tabular data). 
%%%
%%% This is not a clean and optimal LaTeX2e class port yet. I am working
%%% on that but this class file has been used for a PhD thesis that did 
%%% pass a preliminary inspection by the graduate office.
%%%
%%% I would appreciate any help/comments and improvements. The goal is
%%% to make this an official Rice thesis style for LaTeX2e that can
%%% exist in parallel with the old LaTeX thesis style.
%%%
%%% ====================================================
%%% ====================================================
%%% ====================================================
%%% 
%%% This file has been modified to meet the requirements for Rowan
%%% University specifications for a thesis. 
%%% --greg ditzler
%%% 
%%% 
%%% 
%%\NeedsTeXFormat{LaTeX2e}[1994/12/01]
\ProvidesClass{ruthesis}[1995/11/21 Thesis Class, ECE, Rowan University, jeo]

\LoadClass[11pt]{report}
\RequirePackage{ifthen}
\RequirePackage[dvips]{graphicx}
\RequirePackage{setspace}


\DeclareOption{draft}{\typeout{DRAFT MODE}}
\DeclareOption{12pt}{\typeout{12pt mode selected but not implemented}}
\ProcessOptions

\newif\if@ruthesis
\@ruthesistrue


\def\baselinestretch{1.5}

\if@twoside
 \oddsidemargin 21pt
 \evensidemargin 59pt
 \marginparwidth 85pt
\else
 %\oddsidemargin .5in
 %\evensidemargin 0in
 %\marginparwidth .8in
\fi

\oddsidemargin .75in
\textwidth 6.0in
\marginparsep .2in
\marginparwidth .5in
\topmargin -.5in
\headheight .25in
\footskip .5in
\paperheight 11in
\paperwidth 8.5in
\headsep 0.35in
\textheight 8.9in
\hoffset -0.25in


\skip\footins 18pt plus 12pt minus 6pt
\floatsep 24pt plus 6pt minus 6pt
\textfloatsep 36pt plus 10pt minus 10pt
\intextsep 24pt plus 6pt minus 6pt




\def\@pnumwidth{1.55em}
\def\@tocrmarg {2.55em plus 1fil}
\def\@dotsep{4.5}
\setcounter{tocdepth}{2}

\def\tableofcontents{\@restonecolfalse\if@twocolumn\@restonecoltrue\onecolumn
 \fi\chapter*{Table of Contents\@mkboth{CONTENTS}{CONTENTS}} %\thispagestyle{empty}
 \@starttoc{toc}\if@restonecol\twocolumn\fi}

\def\l@part#1#2{\addpenalty{-\@highpenalty}
 \addvspace{2.25em plus 1pt}
%\addvspace{1em plus 1pt}
 \begingroup
 \@tempdima 3em
 \parindent \z@ \rightskip \@pnumwidth
 \parfillskip -\@pnumwidth   
 {\large \bf
 \leavevmode
 #1\hfil \hbox to\@pnumwidth{\hss #2}}\par
 \nobreak
 \endgroup}

\def\l@chapter#1#2{\pagebreak[3] 
 \vskip 1.0em plus 1pt
 \@tempdima 1.5em
 \begingroup
 \parindent \z@ \rightskip \@pnumwidth 
 \parfillskip -\@pnumwidth 
 \parskip \z@
 \large \bf
 \leavevmode
 \advance\leftskip\@tempdima
 \hskip -\leftskip
 #1\nobreak\hfil \nobreak\hbox to\@pnumwidth{\hss #2}\par
 \endgroup}

%\def\l@chapter{\@dottedtocline{0}{0em}{1.2em}}
 
\def\l@section{\@dottedtocline{1}{1.5em}{2.3em}}
\def\l@subsection{\@dottedtocline{2}{2.5em}{3.2em}}
\def\l@subsubsection{\@dottedtocline{3}{3.5em}{4.1em}}
\def\l@paragraph{\@dottedtocline{4}{4.5em}{5em}}
\def\l@subparagraph{\@dottedtocline{5}{5.5em}{6em}}
%\def\l@subsection{\@dottedtocline{2}{2.5em}{3.2em}}
%\def\l@subsubsection{\@dottedtocline{3}{7.0em}{4.1em}}
%\def\l@paragraph{\@dottedtocline{4}{10em}{5em}}
%\def\l@subparagraph{\@dottedtocline{5}{12em}{6em}}

\def\listoffigures{\@restonecolfalse\if@twocolumn\@restonecoltrue\onecolumn
 \fi\chapter*{List of Figures\@mkboth
 {ILLUSTRATIONS}{ILLUSTRATIONS}} %\thispagestyle{empty}
 \addcontentsline{toc}{frontmatter}{\protect\numberline
 {\hfil}List of Figures}\@starttoc{lof}\if@restonecol
 \twocolumn\fi
}

\def\l@figure{\@dottedtocline{1}{1.5em}{2.3em}}

\def\listoftables{\@restonecolfalse\if@twocolumn\@restonecoltrue\onecolumn
 \fi\chapter*{List of Tables\@mkboth
 {TABLES}{TABLES}} %\thispagestyle{empty}
 \addcontentsline{toc}{frontmatter}{\protect\numberline
 {\hfil}List of Tables}\@starttoc{lot}\if@restonecol
 \twocolumn\fi}

\let\l@table\l@figure

\def\l@frontmatter#1#2{\pagebreak[3]
 \@tempdima 1.5em \begingroup
 \parindent \z@ \rightskip \@pnumwidth 
 \parfillskip -\@pnumwidth 
 \leavevmode #1\hfil \hbox to\@pnumwidth{\hss #2}\par
 \endgroup}

\def\thebibliography#1{\chapter*{References\@mkboth
 {References}{References}}\addcontentsline
 {toc}{chapter}{\protect\numberline {\hfil}References}\list
 {[\arabic{enumi}]}{\settowidth\labelwidth{[#1]}\leftmargin\labelwidth
 \advance\leftmargin\labelsep
 \usecounter{enumi}}
 \def\newblock{\hskip .11em plus .33em minus .03em}
 \sloppy
 \uchyph=1\sfcode`\.=1000\relax}

\let\endthebibliography=\endlist

\def\titlepage{\@restonecolfalse\if@twocolumn\@restonecoltrue\onecolumn
 \else \newpage \fi \thispagestyle{empty}\c@page\z@}

\def\endtitlepage{\if@restonecol\twocolumn \else \newpage \fi}

% Rich Baraniuk's modifications to make fig and table caps work
%\renewcommand{\fnum@figure}{Figure \thefigure \setlength{\baselineskip}{5.5mm}}
%\renewcommand{\fnum@table}{Table \thetable \setlength{\baselineskip}{5.5mm}}
\renewcommand{\fnum@figure}{Fig. \thefigure \linespacing{1}}
\renewcommand{\fnum@table}{Table \thetable \linespacing{1}}

\newcommand{\ricelogo}{%
  \includegraphics[scale=0.5]{/net/dsp1/tex/macros/rice-shield.ps}}
\newcommand{\art}{\@coverart}

\def\makecover{%
\begin{titlepage}
  \null\linespacing{1}\setcounter{page}{0}\vfill
  \vbox to 0pt{\vss\vbox to 8.75in{\parskip 0pt \parindent 0pt
      \rule{\textwidth}{2mm}
      \vskip 3pt
      {\Huge \textsc{\textbf{\@ctitle}} \par} 
      \vskip 6pt
      \rule{\textwidth}{2mm}
      \vskip 12pt
      {\Large \hfill \@author \par}
      \vskip 12pt
      \begingroup
      \begin{center}
        \art
      \end{center}
      \endgroup
      \setlength{\unitlength}{1mm}
      \begin{picture}(20,20)(-7,0)      
        \put(0,0){\ricelogo}
        \put(20,10){Thesis:\ \@degree \par}
        \put(20,6){\@department \par}
        \put(20,2){\@school,  \@address\ (\@month\ \@year) \par}
      \end{picture}}}
    \cleardoublepage
\end{titlepage}}

\def\maketitle{%
\begin{titlepage}
  \null\linespacing{1}\setcounter{page}{1}
  \begin{center}
     {\vskip 1em
     \MakeUppercase{\bf \@title}}
     \vskip 10em
     by\\
     {\@author}\\
     \vskip 10em
     {A Thesis\\
     Submitted to the\\
     Department of \@department \\
     \@college \\
     In partial fulfillment of the requirement\\
     For the degree of\\
     Master of Science\\
     at\\
     {\@school} \\
     {\@month, \@year}\\
     \vskip 2.5em
     Thesis Advisor: \@advisor
     \vskip 2.5em
     %\copyright  {\@author} {\@year}
     }
  \end{center}
%  \vbox to 0pt{\vss\vbox to 8.75in{\parskip 0pt \parindent 0pt\centering
%      {\large \uppercase\expandafter{\@school} \par} \vskip 0pt plus 3fil
%      {\Large \bf \@title \par} \vskip 0pt plus 1.3fil
%      {\large by \par} \vskip 0pt plus 1fil
%      {\large \bf \@author \par} \vskip 0pt plus 3fil
%      {\large \sc A Thesis Submitted \\
%        in Partial Fulfillment of the \\
%        Requirements for the Degree \par} \vskip 0pt plus 1.1fil
%      {\large \bf \@degree \par} \vskip 0pt plus 4.5fil
%      \begingroup
%      \leftskip .5\textwidth \rightskip 0pt plus 1fil
%      {\sc Approved, Thesis Committee: \par} \vskip 2.5em
%      \moveright\leftskip\vbox{\hrule width \leftskip}
%      \def\and{\par \vskip 2.25em minus 1em\moveright\leftskip%
%        \vbox{\hrule width \leftskip}}
%      \@committee \par
%      \endgroup \vskip 0pt plus 2fil
%      {\large \@address \par} \vskip 0pt plus .8fil
%      {\large \@month, \@year \par}}}\cleardoublepage
\end{titlepage}

%\thispagestyle{empty}
\vfill

\begin{center}
\copyright  \@year\hspace{12pt}\@author  
\end{center}
}

\newif\if@bigcommittee \@bigcommitteefalse

\def\school#1{\gdef\@school{#1}}
\def\ctitle#1{\gdef\@ctitle{#1}}
\def\department#1{\gdef\@department{#1}}
\def\college#1{\gdef\@college{#1}}
\def\coverart#1{\gdef\@coverart{#1}}
\def\degree#1{\gdef\@degree{#1}}
\def\committee#1{\gdef\@committee{#1}}
\def\bigcommittee#1{\@bigcommitteetrue\gdef\@committee{#1}}
\def\address#1{\gdef\@address{#1}}
\def\donemonth#1{\gdef\@month{#1}}
\def\doneyear#1{\gdef\@year{#1}}
\def\advisor#1{\gdef\@advisor{#1}}
\def\doneyears#1{\gdef\@doneyears{#1}}

\def\@school{Rowan University}
\def\@ctitle#1{\@title}
\def\@department{Electrical and Computer Engineering}
\def\@coverart{\includegraphics{/net/dsp1/tex/macros/rice-shield-big.ps}}
\def\@degree{Doctor of Philosophy}
\def\@committee{member 1, Chairman \\ prof \and
 member 2 \\ prof \and member 3 \\ prof}
\def\@address{Rowan University, Texas}
\def\@month{\ifcase\month ?\or January\or February\or March\or April\or
 May\or June\or July\or August\or September\or October\or
 November\or December\fi}
\def\@year{\number\year}

%\def\abstract{\cleardoublepage \pagestyle{empty} \global\@topnum\z@
\def\abstract{\cleardoublepage  \global\@topnum\z@
 \@afterindentfalse \begingroup
 \def \baselinestretch{1.7} \parskip \z@ \parindent \z@ \par
 \null 
 \centering {{\center{{\Large \bf Abstract}}}} \vskip .4in
 {\singlespacing \@author \\ \MakeUppercase{\@title} \\ \@doneyears \\ \@advisor \\ Masters of Science \vskip 1.5em  \par }
\endgroup \setcounter
 {footnote}{0}\def\thefootnote{\fnsymbol{footnote}}\addcontentsline
 {toc}{frontmatter}{\protect\numberline {\hfil}Abstract}}

\def\endabstract{\setcounter{footnote}{0}
  \pagestyle{plain}
}

\def\acknowledge{\chapter*{Acknowledgments}%\thispagestyle{empty}
 \setcounter{footnote}{0}
 \addcontentsline{toc}{frontmatter}{\protect\numberline
 {\hfil}Acknowledgments}}

\def\endacknowledge{\setcounter{footnote}{0}}

\def\preface{\chapter*{Preface} \thispagestyle{empty}
 \setcounter{footnote}{0}
 \addcontentsline{toc}{frontmatter}{\protect\numberline
 {\hfil}Preface}}

\def\endpreface{\setcounter{footnote}{0}}

\def\frontmatter{\relax}
\def\endfrontmatter{\cleardoublepage
  \pagenumbering{arabic}\def\thefootnote{\arabic{footnote}}}


\def\linespacing#1{\def\baselinestretch{#1} \let\@tempa\@currsize
 \let\@currsize\relax \@tempa}

\def\@makechapterhead#1{\begingroup
 \def \baselinestretch{1} \parskip \z@ \parindent \z@ \par
 \Large\bf \null \vskip 1.5ex \centering
 \ifnum \c@secnumdepth >\m@ne \@chapapp~\thechapter \vskip 3.5ex \fi
 #1 \vskip 3ex plus .2ex\endgroup}

\def\@makeschapterhead#1{\begingroup
 \def \baselinestretch{1} \parskip \z@ \parindent \z@ \par
 \null \vskip .3in \centering
 \Large \bf #1\par \endgroup \nobreak \vskip .6in\relax}

\def\chapter{\cleardoublepage
 \thispagestyle{plain}
 \global\@topnum\z@
 \@afterindentfalse
 \secdef\@chapter\@schapter}

\def\@chapter[#1]#2{\ifnum \c@secnumdepth >\m@ne
 \refstepcounter{chapter}
 \typeout{\@chapapp\space\thechapter.}
 \addcontentsline{toc}{chapter}{\protect
 \numberline{\thechapter}#1}\else
 \addcontentsline{toc}{chapter}{#1}\fi
 \chaptermark{#1}
 %\addtocontents{lof}{\protect\addvspace{\baselineskip}}
 %\addtocontents{lot}{\protect\addvspace{\baselineskip}}
 \if@twocolumn
 \@topnewpage[\@makechapterhead{#2}]  
 \else \@makechapterhead{#2}
 \@afterheading
 \fi}

\def\@schapter#1{\if@twocolumn \@topnewpage[\@makeschapterhead{#1}]
 \else \@makeschapterhead{#1} 
 \@afterheading\fi}

\def\section{\@startsection{section}{1}{\z@}{-3.25ex plus -1ex minus 
 -.2ex}{1.5ex plus .2ex}{\large\bf}}
\def\subsection{\@startsection{subsection}{2}{\z@}{-3.25ex plus -1ex minus 
 -.2ex}{1.5ex plus .2ex}{\normalsize\bf}}
\def\subsubsection{\@startsection{subsubsection}{3}{\z@}{-3.25ex plus 
 -1ex minus -.2ex}{1.5ex plus .2ex}{\normalsize \sl}}
\def\paragraph{\@startsection
 {paragraph}{4}{\z@}{3.25ex plus 1ex minus .2ex}{-1em}{\normalsize\bf}}
\def\subparagraph{\@startsection
 {subparagraph}{4}{\parindent}{3.25ex plus 1ex minus 
 .2ex}{-1em}{\normalsize\bf}}

\def\chaptermark#1{}

\setcounter{secnumdepth}{3}

\def\appendix{\par
 \setcounter{chapter}{0}
 \setcounter{section}{0}
 \def\@chapapp{Appendix}
 \def\thechapter{\Alph{chapter}}}

\if@twoside
\def\ps@headings{%
  \let\@mkboth\markboth
  \def\@oddfoot{}
  \def\@evenfoot{}
  \def\@evenhead{\rm \thepage\hfil \sl \leftmark}
  \def\@oddhead{\hbox{}\sl \rightmark \hfil \rm\thepage}
  \def\chaptermark##1{\markboth {\uppercase{\ifnum \c@secnumdepth >\m@ne
        \@chapapp\ \thechapter. \ \fi ##1}}{}}
  \def\sectionmark##1{\markright {\uppercase{\ifnum \c@secnumdepth >\z@
        \thesection. \ \fi ##1}}}}
\else
%\def\ps@headings{%
%  \let\@mkboth\markboth
%  \def\@oddfoot{}\def\@evenfoot{}
%  \def\@oddhead{\hbox {}\hfil \rm\thepage}
%  \def\chaptermark##1{\markright {\uppercase{\ifnum \c@secnumdepth >\m@ne
%        \@chapapp\ \thechapter. \ \fi ##1}}}}
\fi

%\def\ps@myheadings{\let\@mkboth\@gobbletwo
%\def\@oddhead{\hbox{}\sl\rightmark \hfil \rm\thepage}
%\def\@oddfoot{}\def\@evenhead{\rm \thepage\hfil\sl\leftmark\hbox {}}
%\def\@evenfoot{}\def\chaptermark##1{}\def\sectionmark##1{}
%\def\subsectionmark##1{}}

%\ps@headings
%\onecolumn
%\if@twoside\else\raggedbottom\fi

\pagenumbering{roman}
\def\thefootnote{\fnsymbol{footnote}}



