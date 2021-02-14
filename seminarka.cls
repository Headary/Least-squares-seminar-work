\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{seminarka}[2020 Class pro seminární práce]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{extarticle}}
\ProcessOptions
\LoadClass{extarticle}

% -- Load packages --
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{lmodern} % specify used font
\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}
\RequirePackage[
	pdftex,
    margin=2.5cm,
	headheight=12pt]{geometry}
\RequirePackage{lastpage} % get number of pages
\RequirePackage[nobottomtitles]{titlesec} % change headins style
\RequirePackage[
	pdfusetitle,
    pdfencoding=auto,
	pdfproducer={Latex, or other tool},
	pdfcreator={pdflatex, or other tool},
    hyperfigures
]{hyperref} % create links in file
\RequirePackage{graphicx}
\RequirePackage{fkssugar}
\RequirePackage{krskasugar}

\RequirePackage{fancyhdr} % enable changing header and footer
\fancyhf{}
\fancyhead[RO]{\bfseries\@author}
\fancyhead[LE]{\@title}
\fancyfoot[RO,LE]{\thepage/\pageref{LastPage}}
\pagestyle{fancy}

\RequirePackage{setspace}
\onehalfspacing

% citations 
\RequirePackage[english,czech]{babel} % the main document language is the last one
\RequirePackage[
  backend=biber,        % if we want unicode and many other features (biber is already by default)
  style=iso-numeric     % or iso-numeric for numeric citation method
]{biblatex}

\DefineBibliographyStrings{czech}{%
  at           = {v},
  bysupervisor = {vedouc\'{i} pr\'{a}ce},
  urlfrom      = {dostupn\'{e} z},
  %urlalso      = {dostupn\'{e} tak\'{e} z},
  urlalso      = {dostupn\'{e} z},
  director     = {re\v{z}is\'{e}r},
  bydirector   = {re\v{z}ie},
  inventor     = {vyn\'{a}lezce},
  byinventor   = {vyn\'{a}lezce\addcolon},
  online       = {online},
  film         = {film}
}
% -- change headings to sans font --
\titleformat*{\section}{\Large\bfseries\sffamily}
\titleformat*{\subsection}{\large\bfseries\sffamily}
\titleformat*{\subsubsection}{\bfseries\sffamily}
\titleformat*{\paragraph}{\bfseries\sffamily}
\titleformat*{\subparagraph}{\bfseries\sffamily}
\renewcommand{\bottomtitlespace}{0.1\textheight}

% -- Commands --
\newcommand\@leader{N/A}
\newcommand\leader[1]{\renewcommand\@leader{#1}}

\renewcommand{\maketitle}{

\firstpage
\pagebreak
\emptypage
\prohlaseni
\tableofcontents
\newpage
}

\newcommand{\firstpage}{
\begin{titlepage}
%\thispagestyle{empty}
{\Large
\centering
\vspace{1cm}

Gymnázium a střední odborná škola Mikulov\\
příspěvková organizace

\vspace{1.5cm}

\includegraphics[width=0.3\textwidth]{figures/gss.pdf}

\vspace{3cm}

{\bfseries\sffamily\@title}

\vspace{2cm}

Mikulov 2020
\vfill
\normalsize
Autor: \@author \hfill Vedoucí: \@leader
\vspace{1cm}}
\end{titlepage}
}

\newcommand\emptypage{
    \clearpage
    \thispagestyle{empty}
    \null
    \clearpage
}

\RequirePackage{dashrule} % dotted line
\newcommand{\prohlaseni}{
\newpage
\hspace{0cm}
\thispagestyle{empty}
\vfill

\noindent Prohlášení:

Prohlašuji, že jsem závěrečnou práci zpracoval samostatně. Souhlasím, aby moje 
práce byla archivována Gymnáziem a střední odbornou školou Mikulov, příspěvková 
organizace, případně použita pro další studijní účely.
\vspace{1cm}
\begin{center}
\hdashrule{6cm}{1pt}{2pt}\\
(podpis)
\end{center}
\newpage
}
