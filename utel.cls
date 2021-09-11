\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{utel}[2021/09/08 Formato Utel]

\RequirePackage{hyperref}
\let\Hypersetup\hypersetup%
\renewcommand\hypersetup[1]{%
  \Hypersetup{%
    #1,%
    colorlinks=true,%
    linkcolor=blue,%
    filecolor=magenta,%
    urlcolor=urlcolor,%
  }%
}
\LoadClass{article}
\RequirePackage[utf8]{inputenc}
\RequirePackage[spanish]{babel}
\selectlanguage{spanish}
\RequirePackage{datetime}
\RequirePackage[a4paper, left=1in,right=1in,top=3cm,bottom=1in]{geometry}
\RequirePackage[outputdir=.]{minted}
\RequirePackage{xcolor}
\RequirePackage[absolute,overlay]{textpos}
  \setlength{\TPHorizModule}{1cm}
  \setlength{\TPVertModule}{1cm}
\RequirePackage[scaled]{helvet}
\RequirePackage{calc}
\RequirePackage{multicol}
\RequirePackage{float}
\RequirePackage{enumitem}
%% \setlist{nosep}
\setlist{itemsep}

\RequirePackage{fancyhdr}
\RequirePackage[explicit,compact]{titlesec}
\RequirePackage[normalem]{ulem}

\newcommand{\headlinecolor}{\normalcolor}
\renewcommand*\familydefault{\sfdefault}
\RequirePackage[T1]{fontenc}

\definecolor{green}{HTML}{7ab800}
\definecolor{blue}{HTML}{244061}
\definecolor{gray}{HTML}{7f7f7f}
\definecolor{red}{HTML}{d52b1e}
\definecolor{black}{HTML}{000000}
\definecolor{urlcolor}{HTML}{808080}

\renewcommand{\normalsize}{\linespread{1.5}\fontsize{11}{10}\selectfont}
\renewcommand{\normalcolor}{\color{black}}
\renewcommand{\headlinecolor}{\color{blue}}

\newcommand{\materia}[1]{\def\utel@materia{#1}}
\newcommand{\carrera}[1]{\def\utel@carrera{#1}}
\newcommand{\maestro}[1]{\def\utel@maestro{#1}}
\newcommand{\matricula}[1]{\def\utel@matricula{#1}}
\newcommand{\unidad}[2]{\def\utel@unidad{#1}\def\utel@nombreunidad{#2}}

\newcommand{\with}[2]{\ifx#1\undefined~\else#2\fi}

\renewcommand{\maketitle}{%
  \pagenumbering{gobble}
  \begin{titlepage}
  \begin{textblock}{7.62cm}[0,0](0,0)
    \noindent\includegraphics[width=7.62cm,height=\paperheight]{media/cover}
  \end{textblock}

  \begin{textblock}{\pagewidth}[0,0](10.9,1.27)
    \noindent\includegraphics[width=8cm,height=6cm]{utel}
  \end{textblock}

  \renewcommand{\bold}[1]{{\color{green}\textbf{#1}}}
  \fontsize{14}{10}\selectfont
  \begin{textblock}{400}[0,0](9,11.87)
    \color{gray}
    \noindent\bold{Nombre de la materia}\newline
    \utel@materia\newline
    \with\utel@carrera{\bold{Nombre de la licenciatura}\newline
    \utel@carrera\newline}
    \with\utel@maestro{\newline
    \bold{Nombre del maestro}\newline
    \utel@maestro\newline}
   \newline
    \bold{Nombre del alumno}\newline
    \@author\newline
    \with\utel@matricula{\bold{Matricula}\newline
    \utel@matricula\newline}
    \newline
    \with\@title{\bold{Nombre de la Tarea}\newline
    \@title\newline}
    \with\utel@unidad{\bold{Unidad \#\utel@unidad}\newline
    \with\utel@nombreunidad{\utel@nombreunidad \newline}}
    \newline
    \with\@date{\bold{Fecha}\newline
    \today\newline}
  \end{textblock}
  \end{titlepage}
~\newpage

  \cleardoublepage
  \pagenumbering{arabic}
  \renewcommand{\topmargin}{-2cm}
  \renewcommand{\headheight}{2.19cm}
  \renewcommand{\headsep}{1cm}
  %% \renewcommand{\headrulewidth}{0pt}
  \pagestyle{fancy}
  \fancyhf{}
  \fancyhead[L]{%
    \raisebox{-0.5\height}{\includegraphics[height=2.19cm]{media/utel}}
  }
  \fancyhead[C]{%
    \makebox[13.51cm][c]{
      \bgroup%
      \def\arraystretch{1.5}
      \begin{tabular}{l}
      \fontsize{14}{10}\selectfont
      \textbf{Unidad \#\utel@unidad: }\utel@nombreunidad\\%
      \fontsize{12}{10}\selectfont
      \color{gray}{\utel@materia}
      \end{tabular}
      \egroup%
  }}
  \fancyhead[R]{}
  \fancyfoot[C]{%
    \begin{textblock*}{\paperwidth}[0,1](0,\paperheight)
      \noindent\includegraphics[width=\paperwidth]{media/footer}
    \end{textblock*}
  }
  \fancyfoot[R]{%
    \begin{textblock*}{0.97\paperwidth}[0,1](0,0.970\paperheight)
      \fontsize{14}{10}\selectfont
      \textbf{\color{white}\thepage}
    \end{textblock*}
  }

  \begin{center}
    \color{red}
    \fontsize{15}{10}\selectfont
    \textbf{\MakeUppercase{\@title}}
  \end{center}

\normalsize
\normalcolor
}

\newlength{\remaining}
\newcommand{\underlineAll}[1]{%
  \setlength{\remaining}{\textwidth-\widthof{#1}}
  \fontsize{12}{10}\selectfont
  \par\noindent\ignorespaces\underline{\textbf{{\color{blue}#1}}\hspace*{\remaining}\par}%
  \normalsize
  \normalcolor
  \normalem
}

\titleformat{\section}
  {}{\currenttitle}{0pt}{\underlineAll{#1}}
%% \setcounter{secnumdepth}{0}

\AtBeginDocument{%
\renewcommand{\contentsname}{Contenido}
}
