\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{seminarka}[2020 Class pro seminární práce]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{extarticle}}
\ProcessOptions
\LoadClass{extarticle}

% -- Load packages --
\RequirePackage[english,czech]{babel} % the main document language is the last one
\RequirePackage{fontspec}
\RequirePackage{csquotes}
\RequirePackage{polyglossia}
\setmainlanguage{czech}
\setotherlanguage{english}
\RequirePackage{lmodern} % specify used font
\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}

% citations 
\RequirePackage[
  backend=biber,        % if we want unicode and many other features (biber is already by default)
  style=iso-numeric,    % iso-numeric for numeric citation method
  sorting=nty,          % for alphabetic sorting by author
  sortcites=true
]{biblatex}

\RequirePackage[
    margin=2.5cm,
	headheight=14pt]{geometry}
\RequirePackage{lastpage} % get number of pages
\RequirePackage[nobottomtitles]{titlesec} % change headins style
\RequirePackage{graphicx}
\RequirePackage{booktabs}
\RequirePackage[
	pdfusetitle,
	pdfproducer={Latex, or other tool},
	pdfcreator={pdflatex, or other tool},
    hyperfigures,
    hyperfootnotes=false,
    psdextra
]{hyperref} % create links in file

\RequirePackage{fancyhdr} % enable changing header and footer
\fancyhf{}
\fancyhead[RO]{\bfseries\@author}
\fancyhead[LE]{\@title}
\fancyfoot[RO,LE]{\thepage/\pageref{LastPage}}
\pagestyle{fancy}

\RequirePackage{setspace}
\onehalfspacing

\DefineBibliographyStrings{czech}{%
  at           = {v},
  in           = {v},
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

% -----
% Commands 
% -----
\newcommand\@leader{N/A}
    \newcommand\leader[1]{\renewcommand\@leader{#1}}
\newcommand\@prohlaseni{N/A}
    \newcommand\prohlaseni[1]{\renewcommand\@prohlaseni{#1}}
\newcommand\@podekovani{N/A}
    \newcommand\podekovani[1]{\renewcommand\@podekovani{#1}}

\newcommand\mcite[1]{\mbox{\cite{#1}}}

\renewcommand{\maketitle}{
    \firstpage
    \pagebreak
    \emptypage
    \printprohlaseni
    \printpodekovani
    \tableofcontents
    \newpage
}

% --- define first page ---
\newcommand{\firstpage}{
    \begin{titlepage}
        %\thispagestyle{empty}
        {\large
        \centering
        \vspace{1.5cm}

        Gymnázium a~střední odborná škola Mikulov\\
        příspěvková organizace

        \vspace{1.5cm}

        \includegraphics[width=0.3\textwidth]{figures/gss.pdf}

        \vspace{3cm}

        {\Large\bfseries\sffamily\@title}

        \vspace{0.5cm}

        Seminární práce

        \vspace{2.5cm}

        Mikulov 2021
        \vfill
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

% --- Create page "Prohlášení" ---
\RequirePackage{dashrule} % dotted line
\newcommand{\printprohlaseni}{
    \newpage
    \thispagestyle{empty}
    \hspace{0cm}
    \vfill
    \section*{Prohlášení}
    \@prohlaseni
    \newpage
}

% --- Create page "Poděkování" ---
\newcommand{\printpodekovani}{
    \newpage
    \thispagestyle{empty}
    \hspace{0cm}
    \vfill
    \section*{Poděkování}
    \@podekovani
    \newpage
}
