%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Universidade Federal de Santa Catarina             
% Biblioteca Universitária                     
%---------------------------------------------------------------------------
% Definition of class ufscthesis - Latex Model for academic works for BU-UFSC
%---------------------------------------------------------------------------
% Version 20150612 - Based on class memoir. The style myheadings is based on modifications implemented by Caio Giulliani. Many features were extracted from class ufscThesis(20100631) from Roberto Simoni and Carlos R Rocha. Citations use class abntex2cite. 
%                                                           
% (c)2015 Eduardo Otte Hülse (eohulse@gmail.com)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%                                                         
% This file may be distributed and/or modified              
%
% 1. under the LaTeX Project Public License and/or          
% 2. under the GNU Public License.                          
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

\NeedsTeXFormat{LaTeX2e}   % Identifies the current LaTeX version
\ProvidesClass{ufscthesis} % Inform the type of documentclass being defined

%---------------------------------------------------------------------------
% Custom options
% \newcommand{\tipodeimpressao}{cover}
% \DeclareOption{cover}{}
% \DeclareOption{softcopy}{}

% Set the main language of the document
\newcommand{\idiomaprincipal}{brazil}
\DeclareOption{brazil}{\renewcommand{\idiomaprincipal}{brazil}}
\DeclareOption{english}{\renewcommand{\idiomaprincipal}{english}}
\providecommand{\setmainlanguage}{
\ifthenelse{\equal{\idiomaprincipal}{brazil}}{%
    \selectlanguage{brazil}
}{}
\ifthenelse{\equal{\idiomaprincipal}{english}}{%
    \selectlanguage{english}
}{}
}
% Set if .pdf will be a hard copy or a softcopy
\providecommand{\linkcolorone}{Black}
\providecommand{\linkcolortwo}{Black}
\providecommand{\imprimecapa}{nao}
\DeclareOption{hardcopy}{%
\renewcommand{\linkcolorone}{Black}
\renewcommand{\linkcolortwo}{Black}
\renewcommand{\imprimecapa}{nao}
}%
\DeclareOption{softcopy}{%
\renewcommand{\linkcolorone}{DarkCyan}
\renewcommand{\linkcolortwo}{Cyan}
\renewcommand{\imprimecapa}{sim}
}%
\providecommand{\printthis}{1}
\DeclareOption{nofrontmatter}{%
\renewcommand{\printthis}{}
}%

%---------------------------------------------------------------------------
\AtBeginDocument{\pagestyle{empty}}

%---------------------------------------------------------------------------
% Passes non-interesting options to class memoir
% Using the class memoir as the base of the document (memoir is the same class used by abntex2)
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{memoir}}%{\OptionNotUsed}%
\ProcessOptions\relax

%---------------------------------------------------------------------------
% Load class memoir, with default font size 10pt (this will be reset later to match the BU-USFC Norm), page size A5, two sided printing, and chapters beginning at the right side of the page.
\LoadClass[10pt,a5paper,twoside,openright]{memoir}

%---------------------------------------------------------------------------
% Packages Required
\RequirePackage{mmap} % allows copying correctly pdf text with split words ([noTeX] option for Unicode)
\RequirePackage[utf8]{inputenc} % informing that text codification is in utf8 (allows direct accentuation)
\RequirePackage[T1]{fontenc} % allows copying correctly pdf text with accentuation, accented characters can be automatically hyphenated.
\RequirePackage[english,brazil]{babel} % set document language (last language enter in the option box is the main language of the document.)
\RequirePackage[usenames,dvipsnames,svgnames,table]{xcolor} % Specify colors by their 'svgnames', for a full list of all colors available see here: http://www.latextemplates.com/svgnames-colors
\RequirePackage{pdfpages} % insert pdf pages in the document (used to insert the 'ficha catalográfica' page (http://portal.bu.ufsc.br/ficha/)
\RequirePackage[activate={true,nocompatibility},final,tracking=true,kerning=true,spacing=true,factor=1100,stretch=10,shrink=10]{microtype} %provides a nicer look for textual elements.
\microtypecontext{spacing=nonfrench}
\RequirePackage[figure,table]{totalcount} %provides the countnumber of figures and tables (used to decide whether to print list of figures and tables)
\RequirePackage{etoolbox}
%--------------------------------------------------------------------------
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Setting up the memoir class to match BU guidelines
% http://www.bu.ufsc.br/design/GuiaRapido2013.pdf
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Document font options
\RequirePackage{charter}

% OBS.
% Todo o texto deve ser digitado em tamanho 10,5 pt inclusive títulos das seções e subseções. Citação com mais de três linhas, legendas de ilustrações e tabelas, notas de rodapé, natureza do trabalho, objetivo e nome da instituição a que é submetida e área de concentração, devem ser digitadas em tamanho: 9,5 pt. Citações com mais de três linhas devem ter um recuo de 4 cm a partir da margem esquerda.
% setting up correct font size
\RequirePackage{anyfontsize}
\renewcommand{\normalsize}{\fontsize{10.5pt}{12pt}}
\renewcommand{\footnotesize}{\fontsize{9.5pt}{11pt}}
% memoir caption commands
\captionnamefont{\footnotesize} % Figure XX:, or Table XX: size
\captiontitlefont{\footnotesize} % Title size
\captiontitlefinal{.} % add a dot to the end in the title but not in the list of figures, tables,...
% \interfootnotelinepenalty=10000 % only uncomment this line if some footnote was slit into two pages.

% Paragraph identation (only for the first line), distance between paragraphs and indent first paragraph
\setlength{\parindent}{1cm}
\setlength{\parskip}{0cm}
\RequirePackage{indentfirst}

% Set linespacing to be 'simples' (Single spacing is already the default for memoir class)
% \usepackage{setspace}
% \singlespacing

% Ensure page size is not trimmed
\settrimmedsize{\stockheight}{\stockwidth}{*}

% Document spacing according with UFSC guidelines
\setlrmarginsandblock{25mm}{15mm}{*}
\setulmarginsandblock{20mm}{15mm}{*}

% Setting up header and footer dimensions (Keep the lines below commented. Memoir will handle the footnote space correctly for most of the situations
% \setheadfoot{1cm}{7mm} %{headheight}{footskip}
% \setheaderspaces{*}{7mm}{*} %{headdrop}{headsep}{*}
% OR
% \setheadfoot{\onelineskip}{2\onelineskip}
% \setheaderspaces{*}{2\onelineskip}{*}

% Implementing the document layout settings present above
\checkandfixthelayout

% Table of Content
\setcounter{secnumdepth}{3}
\setcounter{tocdepth}{3}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ABNTex2Cite is used to cite the references
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% this should be called here
\AtEndOfClass{
\RequirePackage[breaklinks=true]{hyperref}
\hypersetup{%
% 	bookmarks=true,
	unicode=false,
	colorlinks=true,% use true to enable colors below:
	linkcolor=\linkcolorone,%red,%Black,
	filecolor=\linkcolorone,%magenta,Black,%
	urlcolor=\linkcolortwo,%cyan,Black
	citecolor=\linkcolorone,%Black
	pdfauthor={\autordata},
	pdftitle={\titulodata},
	pdfsubject={\documentodata},
	pdfkeywords={\keywordsdata},
	pdfproducer={---},
	pdfcreator={---},
%         }
       pdfborder=0 0 0,
}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Glossaries Package setup
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\AtEndOfClass{%
% Next three commands are used to silence memoir conflicts with glossaries package
\RequirePackage{silence}
\WarningFilter{glossaries}{Overriding \printglossary}
\WarningFilter{glossaries}{overriding `theglossary'}
% Uncomment this only if using abntex2cite package
% \let\su@ExpandTwoArgs\relax
% \let\IfSubStringInString\relax
% \let\su@IfSubStringInString\relax 

\RequirePackage[acronym,symbols,nomain,style=list]{glossaries}%nonumberlist
\makeglossaries
\newcommand\Dotfill{\cftdotfill{\cftsectiondotsep}}
\renewcommand*\glspostdescription{\Dotfill}%\nobreak
\glsenablehyper
\ifthenelse{\equal{\idiomaprincipal}{brazil}}{%
    \renewcommand\glssymbolsgroupname{Lista de Símbolos}
    \renewcommand\acronymname{Lista de Sigas e Abreviaturas}
}{}
\ifthenelse{\equal{\idiomaprincipal}{english}}{%
    \renewcommand\glssymbolsgroupname{List of Symbols}
    \renewcommand\acronymname{List of Abbreviations and Acronyms}
}{}
%\renewcommand\contentsname{Table of Contents}%{Sumário}
%% My own glossary to display the units
\newglossarystyle{tabx4col}{%
% Put the glossary in a longtable environment:
\renewenvironment{theglossary}%
{\begin{longtable}{@{}p{0.12\textwidth}@{}p{0.12\textwidth}@{}p{0.56\textwidth}rp{0.15\textwidth}}}%
{\end{longtable}}%
\renewcommand*{\glossaryentryfield}[5]{%
\glstarget{##1}{\textbf{##2}}% Name
 & $[$\glsentryuseri{##1}$]$% Units
 & ##3% Description
 & ##5% Page list
        \\% end of row
}%
%% Nothing between groups:
\renewcommand*{\glsgroupskip}{}%
}
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% References Package setup
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{amstext}
\AtEndOfClass{%
\RequirePackage[abnt-etal-cite=2]{abntex2cite}%
\RequirePackage{breakcites}
\citebrackets[]
}

\AtBeginDocument{
  \ifthenelse{\equal{\idiomaprincipal}{brazil}}{%
      \renewcommand{\bibname}{Referências}
  }{}
  \ifthenelse{\equal{\idiomaprincipal}{english}}{%
      \renewcommand{\bibname}{References}
  }{}
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%---------------------------------------------------------------------------
% Packages that can be removed if causing trouble

%Chapter Names for \autoref
\AtEndOfClass{%
\ifthenelse{\equal{\idiomaprincipal}{english}}{%
\addto\extrasenglish{%
  \renewcommand{\chapterautorefname}{Chapter}%
  \renewcommand{\sectionautorefname}{Section}%
  \renewcommand{\subsectionautorefname}{Section}%
  \renewcommand{\subsubsectionautorefname}{Section}%
  \renewcommand{\equationautorefname}{Eq.}%
}}{}
\ifthenelse{\equal{\idiomaprincipal}{brazil}}{%
\addto\extrasbrazil{%
  \renewcommand{\chapterautorefname}{Capítulo}%
  \renewcommand{\sectionautorefname}{Seção}%
  \renewcommand{\subsectionautorefname}{Seção}%
  \renewcommand{\subsubsectionautorefname}{Seção}%
  \renewcommand{\equationautorefname}{Eq.}%
}}{}
}





%---------------------------------------------------------------------------
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%                                                         
% Identification Variables for the academic work
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%                                                         
% 
%---------------------------------------------------------------------------
% Instituicao
\providecommand{\instituicaodata}{Universidade Federal de Santa Catarina}
\providecommand{\instituicaogenerodata}{a}
\newcommand{\instituicao}[2][a]%
    {\renewcommand{\instituicaodata}{#2}\renewcommand{\instituicaogenerodata}{#1}}

\newcommand{\instituicaoformat}[1]{\bfseries\MakeUppercase{#1}}

%---------------------------------------------------------------------------
% Departamento
\providecommand{\departamentodata}{Departamento de Automação e Sistemas}
\providecommand{\departamentogenerodata}{o}
\newcommand{\departamento}[2][o]%
    {\renewcommand{\departamentodata}{#2}\renewcommand{\departamentogenerodata}{#1}}

\newcommand{\departamentoformat}[1]{\bfseries\MakeUppercase{#1}}

%---------------------------------------------------------------------------
% Programa
\providecommand{\programadata}{Programa de Pós-Graduação em Engenharia de Automação e Sistemas}
\providecommand{\programagenerodata}{o}
\newcommand{\programa}[2][o]%
    {\renewcommand{\programadata}{#2}\renewcommand{\programagenerodata}{#1}}

\newcommand{\programaformat}[1]{\bfseries\MakeUppercase{#1}}

%---------------------------------------------------------------------------
% Curso
\providecommand{\cursodata}{Engenharia de Automação e Sistemas}
\newcommand{\curso}[1]%
    {\renewcommand{\cursodata}{#1}}
%---------------------------------------------------------------------------
% Tipo do documento
\providecommand{\documentodata}{Tese}
\providecommand{\documentogenerodata}{a}
\newcommand{\documento}[2][a]%
    {\renewcommand{\documentodata}{#2} \renewcommand{\documentogenerodata}{#1} \detgenerodoc{#2}}

%---------------------------------------------------------------------------
% Titulo e subtítulo
\providecommand{\titulodata}{}
\newcommand{\titulo}[1]{\renewcommand{\titulodata}{#1}}

\newcommand{\tituloformat}[1]{\bfseries\MakeUppercase{#1}}

\providecommand{\subtitulodata}{}
\newcommand{\subtitulo}[1]{\renewcommand{\subtitulodata}{#1}}

%---------------------------------------------------------------------------
% Autor
\providecommand{\autordata}{Eduardo Otte Hülse}
\newcommand{\autor}[1]{\renewcommand{\autordata}{#1}}

\newcommand{\autorformat}{\mdseries}

%---------------------------------------------------------------------------
% Grau pretendido
\providecommand{\graudata}{Mestre}
\newcommand{\grau}[1]{\renewcommand{\graudata}{#1}}

%---------------------------------------------------------------------------
% Local
\providecommand{\localdata}{Florianópolis}
\newcommand{\local}[1]{\renewcommand{\localdata}{#1}}
\newcommand{\localformat}{\mdseries}

%---------------------------------------------------------------------------
% Data
\providecommand{\diadata}{}
\providecommand{\mesdata}{}
\providecommand{\anodata}{}
\newcommand{\data}[3]{\renewcommand{\diadata}{#1}\renewcommand{\mesdata}{#2}\renewcommand{\anodata}{#3}}
\newcommand{\dataformat}{\mdseries}
\newcommand{\daytype}[1]{\ifthenelse{\equal{#1}{1}}{st}{\ifthenelse{\equal{#1}{2}}{nd}{\ifthenelse{\equal{#1}{3}}{rd}{th}}}}
\newcommand{\printdate}{\diadata\ de \mesdata\ de \anodata}

\AtBeginDocument{
  \ifthenelse{\equal{\idiomaprincipal}{brazil}}{%
    \renewcommand{\printdate}{\diadata\ de \mesdata\ de \anodata}%
  }{}
  \ifthenelse{\equal{\idiomaprincipal}{english}}{%
    \renewcommand{\printdate}{\mesdata\ \diadata \daytype{\diadata}\ \anodata} %
  }{}
}


%---------------------------------------------------------------------------
% Orientador e co-orientador
\providecommand{\orientadorname}{}
\providecommand{\orientadordata}{}
\providecommand{\orientadorinstituicao}{}
\newcommand{\orientador}[2][Orientador]%
    {
    \renewcommand{\orientadorname}{#2}%
    \renewcommand{\orientadorinstituicao}{#1}
    }
\newcommand{\orientadorformat}{}

\providecommand{\coorientadorname}{}
\providecommand{\coorientadordata}{}
\providecommand{\coorientadorinstituicao}{}
\newcommand{\coorientador}[2][Coorientador]%
    {
    \renewcommand{\coorientadorname}{#2}%
    \renewcommand{\coorientadorinstituicao}{#1}
    }
\newcommand{\coorientadorformat}{}

%---------------------------------------------------------------------------
% Coordenador do curso
\providecommand{\coordenadorname}{}
\providecommand{\coordenadortitulo}{}
\providecommand{\coordenadorinstituicao}{}
\newcommand{\coordenador}[2][Coordenador do Curso]
    {
    \renewcommand{\coordenadorname}{#2}%
    \renewcommand{\coordenadorinstituicao}{#1}
    }
\newcommand{\coordenadorformat}{}


\AtBeginDocument{
  \ifthenelse{\equal{\idiomaprincipal}{brazil}}{%
    \renewcommand{\orientadordata}{Orientador}%
    \renewcommand{\coorientadordata}{Coorientador}
    \renewcommand{\coordenadortitulo}{Coordenador do Curso}
  }{}
  \ifthenelse{\equal{\idiomaprincipal}{english}}{%
    \renewcommand{\orientadordata}{Advisor} %
    \renewcommand{\coorientadordata}{Co-advisor}
    \renewcommand{\coordenadortitulo}{Graduate Program Coordinator}
  }{}
}

%-!
% Banca - Ate 7 membros, fora orientador e coorientador.
% Se o nro de membros passar de 4, será criada uma folha adicional
%---------------------------------------------------------------------------
\newcommand{\bancaname}{Banca~Examinadora}
\AtBeginDocument{
  \ifthenelse{\equal{\idiomaprincipal}{brazil}}{%
    \renewcommand{\bancaname}{Banca~Examinadora}%
  }{}
  \ifthenelse{\equal{\idiomaprincipal}{english}}{%
    \renewcommand{\bancaname}{Dissertation Committee} %
  }{}
}


\newcommand{\bancaformat}{}

\providecommand\orientadorbancadata{nao}
\providecommand\coorientadorbancadata{nao}
\providecommand\nrobanca{4}

\newcommand\numerodemembrosnabanca[1]{\renewcommand\nrobanca{#1}}
\newcommand\orientadornabanca[1]{\renewcommand\orientadorbancadata{#1}}
\newcommand\coorientadornabanca[1]{\renewcommand\coorientadorbancadata{#1}}

\providecommand{\bancanameA}{}
\providecommand{\bancadataA}{}
\newcommand{\bancaMembroA}[2][]% se for incluir Presidente colocar [aqui]
    {\renewcommand{\bancanameA}{#2}%
     \renewcommand{\bancadataA}{#1}}

\providecommand{\bancanameB}{}
\providecommand{\bancadataB}{}
\newcommand{\bancaMembroB}[2][]%
    {\renewcommand{\bancanameB}{#2}%
     \renewcommand{\bancadataB}{#1}}

\providecommand{\bancanameC}{}
\providecommand{\bancadataC}{}
\newcommand{\bancaMembroC}[2][]%
    {\renewcommand{\bancanameC}{#2}%
     \renewcommand{\bancadataC}{#1}}

\providecommand{\bancanameD}{}
\providecommand{\bancadataD}{}
\newcommand{\bancaMembroD}[2][]%
    {\renewcommand{\bancanameD}{#2}%
     \renewcommand{\bancadataD}{#1}}

\providecommand{\bancanameE}{}
\providecommand{\bancadataE}{}
\newcommand{\bancaMembroE}[2][]%
    {\renewcommand{\bancanameE}{#2}%
     \renewcommand{\bancadataE}{#1}}

\providecommand{\bancanameF}{}
\providecommand{\bancadataF}{}
\newcommand{\bancaMembroF}[2][]%
    {\renewcommand{\bancanameF}{#2}%
     \renewcommand{\bancadataF}{#1}}

\providecommand{\bancanameG}{}
\providecommand{\bancadataG}{}
\newcommand{\bancaMembroG}[2][]%
    {\renewcommand{\bancanameG}{#2}%
     \renewcommand{\bancadataG}{#1}}

%---------------------------------------------------------------------------
% Texto da folha de rosto
\newcommand{\comentariodata}{\documentodata\ submetid\documentogenerodata\ \aoa{\programagenerodata}\ \programadata\ d\instituicaogenerodata\ \instituicaodata\ para a obtenção do Grau de \graudata\ em \cursodata.}%

\AtBeginDocument{
  \ifthenelse{\equal{\idiomaprincipal}{brazil}}{%
    \renewcommand{\comentariodata}{\documentodata\ submetid\documentogenerodata\ 
 \aoa{\programagenerodata}\ \programadata\ d\instituicaogenerodata\ \instituicaodata\ para a obtenção do Grau de \graudata\ em \cursodata.}%
  }{}
  \ifthenelse{\equal{\idiomaprincipal}{english}}{%
    \renewcommand{\comentariodata}{\documentodata\ presented to the \programadata\ in partial fulfillment of the requirements for the degree of \graudata\ in \cursodata.}%
  }{}
}

\newcommand{\comentarioformat}{\footnotesize}

%---------------------------------------------------------------------------
% Texto da folha de aprovacao
\newcommand{\textoAprovacaodata}{This \documentodata\ is recommended in partial fulfillment of the requirements for the degree of ``\graudata~in \cursodata'',  which has been approved in its present form by the \programadata.} 

\AtBeginDocument{
  \ifthenelse{\equal{\idiomaprincipal}{brazil}}{%
    \renewcommand{\textoAprovacaodata}{\esteEsta{\documentogenerodata} \documentodata\ 
    foi julgad\documentogenerodata\ adequad\documentogenerodata\ para a 
    obtenção do Título de ``\graudata~em \cursodata'',  e aprovad\documentogenerodata\ 
    em sua forma final \peloPela{\programagenerodata} \programadata.} %
  }{}
  \ifthenelse{\equal{\idiomaprincipal}{english}}{%
    \renewcommand{\textoAprovacaodata}{This \documentodata\ is recommended in partial fulfillment of the requirements for the degree of ``\graudata~in \cursodata'',  which has been approved in its present form by the \programadata.} %
  }{}
}

%---------------------------------------------------------------------------
% Dedicatoria
\providecommand{\dedicatoriadata}{}
\newcommand{\dedicatoria}[1]{\renewcommand{\dedicatoriadata}{#1}}
\newcommand{\dedicatoriaformat}{}

%---------------------------------------------------------------------------
% Agradecimentos
\providecommand{\agradecimentodata}{}
\newcommand{\agradecimento}[1]{\renewcommand{\agradecimentodata}{#1}}
\newcommand{\agradecimentoname}{Agradecimentos}

\AtBeginDocument{
  \ifthenelse{\equal{\idiomaprincipal}{brazil}}{%
    \renewcommand{\agradecimentoname}{Agradecimentos}%
  }{}
  \ifthenelse{\equal{\idiomaprincipal}{english}}{%
    \renewcommand{\agradecimentoname}{Acknowledgements} %
  }{}
}

%---------------------------------------------------------------------------
% Epigrafe
\providecommand{\epigrafedata}{}
\providecommand{\epigrafeautordata}{}
\newcommand{\epigrafe}[2]{\renewcommand{\epigrafedata}{#1}\renewcommand{\epigrafeautordata}{#2}}
\newcommand{\epigrafeformat}{}%{\itshape}
\newcommand{\epigrafeautorformat}{\hfill}

%---------------------------------------------------------------------------
% Resumo
\providecommand{\textoresumodata}{}
\newcommand{\textoresumo}[1]{\renewcommand{\textoresumodata}{#1}}
\newcommand{\resumoname}{Resumo}

\AtBeginDocument{
  \ifthenelse{\equal{\idiomaprincipal}{brazil}}{%
    \renewcommand{\resumoname}{Resumo}%
  }{}
  \ifthenelse{\equal{\idiomaprincipal}{english}}{%
    \renewcommand{\resumoname}{Resumo Estendido} %
  }{}
}

\providecommand{\palavraschavedata}{}
\newcommand{\palavraschave}[1]{\renewcommand{\palavraschavedata}{#1}}


%---------------------------------------------------------------------------
% Abstract
\providecommand{\textabstractdata}{}
\newcommand{\textabstract}[1]{\renewcommand{\textabstractdata}{#1}}

\providecommand{\keywordsdata}{}
\newcommand{\keywords}[1]{\renewcommand{\keywordsdata}{#1}}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%                                                         
% Comandos e formatos customizáveis 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%                                                         

%---------------------------------------------------------------------------
% Funções de ajustes aos textos de acordo com o genero
\newcommand{\esteEsta}[1]{\ifthenelse{\equal{#1}{a}}{Esta}{Este}}
\newcommand{\aoa}[1]{{\ifthenelse{\equal{#1}{a}}{\`a}{ao}}}
\newcommand{\peloPela}[1]{\ifthenelse{\equal{#1}{o}}{pelo}{pela}}
%---------------------------------------------------------------------------
% Determina o genero do documento pré-definido
\newcommand{\detgenerodoc}[1] % Me dei por vencido - Verificar no futuro sobre expansao de commands
    {\ifthenelse{\equal{#1}{Relatório}\or\equal{#1}{Trabalho}\or
                 \equal{#1}{Trabalho de Conclusão de Curso}\or
		 \equal{#1}{Relatório de Pós-Doutorado}}
	{\renewcommand{\UFSCdocumentogenerodata}{o}}
    }

%---------------------------------------------------------------------------
% Executa o comando #2 se o argumento #1 não estiver vazio
\newcommand{\ifnotempty}[2]{\ifthenelse{\not\equal{#1}{}}{#2}{}}
% Executa o comando #2 se o argumento #1 não estiver vazio senão executa #3
\newcommand{\ifnotemptyelse}[3]{\ifthenelse{\not\equal{#1}{}}{#2}{#3}}
%---------------------------------------------------------------------------
% Estilo de folha em branco se nao estou enganado
\newcommand*\NewPage{\newpage\null\thispagestyle{empty}\newpage}

%---------------------------------------------------------------------------
% Estilo do texto da folha de rosto
\newenvironment{textodafolhaderosto}%
  {\begin{SingleSpace}%
   \footnotesize
   \begin{list}{}{%
       \setlength{\listparindent}{0cm}%
       \setlength{\itemindent}{\listparindent}%
       \setlength{\rightmargin}{0cm}%
       \setlength{\leftmargin}{54mm}%
       \setlength{\parsep}{0pt}}%
    \item\relax}%
  {\end{list}\end{SingleSpace}}

%---------------------------------------------------------------------------
% Estilo da dedicatoria e da epigrafe
\newenvironment{textorecuadodedicatoria}%
  {\begin{SingleSpace}%
   \normalsize
   \begin{list}{}{%
       \setlength{\listparindent}{0cm}%
       \setlength{\itemindent}{\listparindent}%
       \setlength{\rightmargin}{0cm}%
       \setlength{\leftmargin}{50mm}%
       \setlength{\parsep}{0pt}}%
    \item\relax}%
  {\end{list}
   \end{SingleSpace}}
\newenvironment{textorecuadopretextual}%
  {\begin{SingleSpace}%
   \footnotesize
   \begin{list}{}{%
       \setlength{\listparindent}{0cm}%
       \setlength{\itemindent}{\listparindent}%
       \setlength{\rightmargin}{0cm}%
       \setlength{\leftmargin}{40mm}%
       \setlength{\parsep}{0pt}}%
    \item\relax}%
  {\end{list}
   \end{SingleSpace}}

%---------------------------------------------------------------------------
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%
%%% Cover
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\capa}%
{%
\setmainlanguage
\ifnotempty{\printthis}{%
\setcounter{page}{-1}	% Caso o documento tenha capa redefine contagem incial para -1 (capa anverso -1, capa verso 0)
\thispagestyle{empty} 	% Define o estilo desta página como vazio
%
\vspace*{-7mm}
%
\begin{center}
\begin{SingleSpace}
\ifnotempty{\instituicaodata}%
    {\instituicaoformat{\instituicaodata}}\\
\ifnotempty{\programadata}%
    {\programaformat{\programadata}}\\
\end{SingleSpace}
\end{center}
\vspace*{7mm}
\begin{center}
    \ifnotempty{\autordata}%
	{%
	\autorformat\autordata
	}
\end{center}
\vspace*{3.5cm}
\begin{center}
    \begin{SingleSpace}
	\ifnotempty{\titulodata}%
	    {%
	    \ifnotemptyelse{\subtitulodata}%
		{%
		\tituloformat{\titulodata}:~\par
		\tituloformat{\subtitulodata}\par
		}%
		{%
		\tituloformat{\titulodata}\par
		}%
	    }%
    \end{SingleSpace}
\end{center}
\vfill
\begin{center}
    \begin{SingleSpace}
    \setlength{\parskip}{.3cm}
    \ifnotempty{\localdata}
	{{\localformat\localdata}\par}
    \ifnotempty{\anodata}
	{\dataformat{\anodata}}
    \end{SingleSpace}
\end{center}
\vspace{2cm}
\newpage
\NewPage
\setmainlanguage
}% end of \ifnotempty{\printthis}
} %end of cover

\AtBeginDocument{%
\ifthenelse{\equal{\imprimecapa}{sim}}{\capa}{}
}%

%---------------------------------------------------------------------------
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%
%%% Folha de Rosto
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\folhaderosto}[1][semficha]%
{%
\setmainlanguage
\ifnotempty{\printthis}{%
\if@openright\cleardoublepage\else\clearpage\fi%
\thispagestyle{empty} % Define o estilo desta página como vazio
\begin{center}
    \ifnotempty{\autordata}%
	{%
	\autorformat\autordata
	}
\end{center}
\vspace{1.5cm}
\begin{center}
    \begin{SingleSpace}
    \ifnotempty{\titulodata}%
	{%
	\ifnotemptyelse{\subtitulodata}%
	    {%
	    \tituloformat{\titulodata}:\\ \tituloformat{\subtitulodata}\par
	    }%
	    {%
	    \tituloformat{\titulodata}\par
	    }%
	}%
    \end{SingleSpace}
\end{center}
\vfill
\begin{textodafolhaderosto}
    {\comentarioformat\comentariodata}\par
\end{textodafolhaderosto}
\begin{flushright}
    \normalsize
    \ifnotempty{\orientadordata}%
	{%
	{\orientadordata}:\ {\orientadorname}\protect\\
	}
    \ifnotempty{\coorientadordata}
	{%
	{\coorientadordata}:\ {\coorientadorname}
	}
\end{flushright}
% \end{textodafolhaderosto}
\vfill\vfill
\begin{center}
    \begin{SingleSpace}
    \setlength{\parskip}{.3cm}
    \ifnotempty{\localdata}
	{{\localformat\localdata}\par}
    \ifnotempty{\anodata}
	{\dataformat{\anodata}}
    \end{SingleSpace}
\end{center}
\vspace{2cm}
\ifnotempty{#1}{
% \newpage
\includepdf[pages=1]{#1}
}
% \newpage
% \NewPage
}% end of \ifnotempty{\printthis}
} %end folhaderosto      

%---------------------------------------------------------------------------
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%
%%% Ficha catalografica
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Maiores informações em:
% http://portalbu.ufsc.br/ficha

%---------------------------------------------------------------------------
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%
%%% Folha de Aprovação
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcounter{numerodemembrosnabanca}
\AtBeginDocument{%
\ifnotempty{\orientadordata}{%
  \ifthenelse{\equal{\orientadorbancadata}{sim}}{\stepcounter{numerodemembrosnabanca}}{}
}
\ifnotempty{\coorientadordata}{%
\ifthenelse{\equal{\coorientadorbancadata}{sim}}{\stepcounter{numerodemembrosnabanca}}{}
}
\ifnotempty{\bancanameA}{\stepcounter{numerodemembrosnabanca}}
\ifnotempty{\bancanameB}{\stepcounter{numerodemembrosnabanca}}
\ifnotempty{\bancanameC}{\stepcounter{numerodemembrosnabanca}}
\ifnotempty{\bancanameD}{\stepcounter{numerodemembrosnabanca}}
\ifnotempty{\bancanameE}{\stepcounter{numerodemembrosnabanca}}
\ifnotempty{\bancanameF}{\stepcounter{numerodemembrosnabanca}}
\ifnotempty{\bancanameG}{\stepcounter{numerodemembrosnabanca}}
}

\newcommand{\folhadeaprovacao}[2]
{%
\setmainlanguage
\ifnotempty{\printthis}{%
\if@openright\cleardoublepage\else\clearpage\fi%
\thispagestyle{empty}%

\ifthenelse{\equal{#1}{}}{%
\ifnotempty{\autordata}%
    {%
    \begin{center}
    \autorformat\autordata
    \end{center}
    }
\vspace{0pt}%\vfill 
\begin{center}
    \begin{SingleSpace}
    \ifnotempty{\titulodata}%
	{%
	\ifnotemptyelse{\subtitulodata}%
	    {%
	    \tituloformat{\titulodata}:~\tituloformat{\subtitulodata}\par
	    }%
	    {%
	    \tituloformat{\titulodata}\par
	    }%
	}%
    \end{SingleSpace}
\end{center}
\vspace{0pt}%\vfill
\begin{SingleSpace}
    \textoAprovacaodata\par
\end{SingleSpace}
\begin{center}
    \localdata, \printdate.\par
\end{center}
\begin{SingleSpace}
    \vspace{0.5em}
    \begin{center}
    {\rule{8cm}{1pt}\par
     \coordenadorname \\ \coordenadortitulo \\ \coordenadorinstituicao \par}
    \end{center}
\end{SingleSpace}


{\setlength{\parindent}{0cm} \bfseries \bancaname:\par}  
\vspace{1em} 
\ifnotempty{\orientadordata}
    {
    \ifthenelse{\equal{\orientadorbancadata}{sim}}
	{
	\begin{SingleSpace}
	    \vspace{0.5em}
	    \begin{center}
	    {\rule{8cm}{1pt}\par
	     \bancaformat \orientadorname \\ \orientadordata \\ \orientadorinstituicao \par}
	    \end{center}
	\end{SingleSpace}
	}{}
    }
\ifnotempty{\coorientadordata}
    {
    \ifthenelse{\equal{\coorientadorbancadata}{sim}}
	{
	\begin{SingleSpace}
	    \vspace{0.5em}
	    \begin{center}
	    {\rule{8cm}{1pt}\par
	     \bancaformat \coorientadorname \\ \coorientadordata \\ \coorientadorinstituicao \par}
	    \end{center}
	\end{SingleSpace}
	}{}
    }

\ifnum \value{numerodemembrosnabanca} < 5
    {
 \ifnotempty{\bancanameA}
    {
    \begin{SingleSpace}
	\vspace{0.9em}
	\begin{center}
	{\rule{8cm}{1pt}\par
	 \bancaformat \bancanameA \\ \bancadataA\par}
	\end{center}
    \end{SingleSpace}
    }   
    
 \ifnotempty{\bancanameB}
    {
    \begin{SingleSpace}
	\vspace{0.0em}
	\begin{center}
	{\rule{8cm}{1pt}\par
	 \bancaformat \bancanameB \\ \bancadataB\par}
	\end{center}
    \end{SingleSpace}
    }   
  
  \ifnotempty{\bancanameC}
     {
     \begin{SingleSpace}
 	\vspace{0.0em}
 	\begin{center}
 	{\rule{8cm}{1pt}\par
 	 \bancaformat \bancanameC \\ \bancadataC\par}
 	\end{center}
     \end{SingleSpace}
     }   
    
    }
\vfill
% Cria uma nova página de assinaturas
% \ifnum \nrobanca > 4
\else
  {%
  \NewPage
  \newpage

 \ifnotempty{\bancanameA}
    {
    \begin{SingleSpace}
	\vspace{0.0em}
	\begin{center}
	{\rule{8cm}{1pt}\par
	 \bancaformat \bancanameA \\ \bancadataA\par}
	\end{center}
    \end{SingleSpace}
    }   
 

 \ifnotempty{\bancanameB}
    {
    \begin{SingleSpace}
	\vspace{0.0em}
	\begin{center}
	{\rule{8cm}{1pt}\par
	 \bancaformat \bancanameB \\ \bancadataB\par}
	\end{center}
    \end{SingleSpace}
    }   
 
 \ifnotempty{\bancanameC}
    {
    \begin{SingleSpace}
	\vspace{0.0em}
	\begin{center}
	{\rule{8cm}{1pt}\par
	 \bancaformat \bancanameC \\ \bancadataC\par}
	\end{center}
    \end{SingleSpace}
    }   
 
 \ifnotempty{\bancanameD}
    {
    \begin{SingleSpace}
	\vspace{0.0em}
	\begin{center}
	{\rule{8cm}{1pt}\par
	 \bancaformat \bancanameD \\ \bancadataD\par}
	\end{center}
    \end{SingleSpace}
    }   
    
 \ifnotempty{\bancanameE}
    {
    \begin{SingleSpace}
	\vspace{0.0em}
	\begin{center}
	{\rule{8cm}{1pt}\par
	 \bancaformat \bancanameE \\ \bancadataE\par}
	\end{center}
    \end{SingleSpace}
    }   
  
 \ifnotempty{\bancanameF}
    {
    \begin{SingleSpace}
	\vspace{0.0em}
	\begin{center}
	{\rule{8cm}{1pt}\par
	 \bancaformat \bancanameF \\ \bancadataF\par}
	\end{center}
    \end{SingleSpace}
    }   
    
 \ifnotempty{\bancanameG}
    {
    \begin{SingleSpace}
	\vspace{0.0em}
	\begin{center}
	{\rule{8cm}{1pt}\par
	 \bancaformat \bancanameG \\ \bancadataG\par}
	\end{center}
    \end{SingleSpace}
    }      
    \vfill
    }
\fi
\newpage
\NewPage
}
{%
\ifnotempty{#1}{%
\includepdf[pages=1]{#1}}
\cleardoublepage
\ifnotempty{#2}{%
\includepdf[pages=1]{#2}}
}
}% end of \ifnotempty{\printthis}
} %end folhadeaprovacao   

%---------------------------------------------------------------------------
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%
%%% Dedicatória
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\paginadedicatoria}%
{%
\ifnotempty{\printthis}{%
\ifnotempty{\dedicatoriadata}{%
\setmainlanguage
\if@openright		% Garante que se a página for "direita"
    \cleardoublepage	% ele pula uma página para deixar o anverso em branco
\else
    \clearpage
\fi

\thispagestyle{empty} 	% Define o estilo desta página como vazio
\mbox{}
\vfill
\ifnotempty{\dedicatoriadata}%
    {%
    \begin{textorecuadodedicatoria}
	{\dedicatoriaformat\dedicatoriadata}\par
    \end{textorecuadodedicatoria}
    }
    \vspace{1cm}
%\vfill
\mbox{}
\newpage
\NewPage
} % end of \ifnotempty
}% end of \ifnotempty{\printthis}
}% end of \dedicatoria

%--------------------------------------------------------------------------
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%
%%% Agradecimento
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\paginaagradecimento}%
{%
\ifnotempty{\printthis}{%
\ifnotempty{\agradecimentodata}{%
\setmainlanguage
\if@openright		% Garante que se a página for "direita"
    \cleardoublepage	% ele pula uma página para deixar o anverso em branco
\else
    \clearpage
\fi
\thispagestyle{empty} 	% Define o estilo desta página como vazio
\ifnotempty{\agradecimentodata}%
    {   
    \begin{center}
	\tituloformat{\agradecimentoname}
    \end{center}
    \vspace{.2cm}
    \begin{SingleSpace}
	\agradecimentodata
    \end{SingleSpace}
    }
\newpage
\NewPage
}% end of \ifnotempty
}% end of \ifnotempty{\printthis}
}% end of \agradecimento

%---------------------------------------------------------------------------
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%
%%% Epígrafe
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\paginaepigrafe}%
{%
\ifnotempty{\printthis}{%
\ifnotempty{\epigrafedata}{%
\setmainlanguage
\if@openright		% Garante que se a página for "direita"
    \cleardoublepage	% ele pula uma página para deixar o anverso em branco
\else
    \clearpage
\fi
\thispagestyle{empty} 	% Define o estilo desta página como vazio
\mbox{}
\vfill\vfill
\ifnotempty{\epigrafedata}%
    {%
    \begin{textorecuadopretextual}
	{\epigrafeformat\epigrafedata}\par
	{\epigrafeautorformat\epigrafeautordata}\par
    \end{textorecuadopretextual}
%     \ABNTifnotempty{\epigrafeautordata}%
% 	{%
% 	\begin{textorecuadopretextual}
% 	    {\epigrafeautorformat\epigrafeautordata}\par
% 	\end{textorecuadopretextual}
% 	}
    }
     \vspace{1cm}
   
%\vfill\vfill
\mbox{}
\newpage
% \cleardoublepage
% \NewPage
}% end of \ifnotempty
}% end of \ifnotempty{\printthis}
}% end of \epigrafe

%--------------------------------------------------------------------------
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%
%%% Resumo
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\paginaresumo}%
{%
\ifnotempty{\printthis}{%
\ifnotempty{\textoresumodata}{%
\if@openright		% Garante que se a página for "direita"
    \cleardoublepage	% ele pula uma página para deixar o anverso em branco
\else
    \clearpage
\fi
\selectlanguage{brazil}
\thispagestyle{empty} 	% Define o estilo desta página como vazio
\ifnotempty{\textoresumodata}%
    {%
    \chapter*{\resumoname}
    \pdfbookmark{\resumoname}{chap:resumo}
    \vspace{.2cm}
    \begin{SingleSpace}
	\textoresumodata
    \end{SingleSpace}
    }
\vspace{2 em}
\ifnotempty{\palavraschavedata}{\par\setlength{\parindent}{0cm}{\bfseries Palavras-chave:} \palavraschavedata
\setlength{\parindent}{1cm}
\setlength{\parskip}{0cm}
}
\newpage
\NewPage

% Xunxo pra fazer isso funcionar por conta da possivel mudança da lingua
\ifthenelse{\equal{\idiomaprincipal}{brazil}}{%
    \renewcommand{\bibname}{Referências}
}{}
\ifthenelse{\equal{\idiomaprincipal}{english}}{%
    \renewcommand{\bibname}{References}
}{}
}% end of \ifnotempty
}% end of \ifnotempty{\printthis}
}% end of \resumo

%--------------------------------------------------------------------------
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%
%%% Abstract
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\paginaabstract}%
{%
\ifnotempty{\printthis}{%
\ifnotempty{\textabstractdata}{%
\if@openright		% Garante que se a página for "direita"
    \cleardoublepage	% ele pula uma página para deixar o anverso em branco
\else
    \clearpage
\fi
\selectlanguage{english}
\thispagestyle{empty} 	% Define o estilo desta página como vazio
\ifnotempty{\textabstractdata}%
    {%
    \chapter*{Abstract}
    \pdfbookmark{Abstract}{chap:abstract}
    \vspace{.2cm}
    \begin{SingleSpace}
	\textabstractdata
    \end{SingleSpace}
    }
\vspace{2 em}
\ifnotempty{\keywordsdata}{\par\setlength{\parindent}{0cm}{\bfseries Keywords:} \keywordsdata
\setlength{\parindent}{1cm}
\setlength{\parskip}{0cm}
}
\newpage
\NewPage

% Xunxo pra fazer isso funcionar por conta da mudança da lingua
\ifthenelse{\equal{\idiomaprincipal}{brazil}}{%
    \renewcommand{\bibname}{Referências}
}{}
\ifthenelse{\equal{\idiomaprincipal}{english}}{%
    \renewcommand{\bibname}{References}
}{}
}% end \ifnotempty
}% end of \ifnotempty{\printthis}
}% end of \abstract

%--------------------------------------------------------------------------
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% List of Figures, List of Tables, List of Abbreviations and Acronyms, List of Symbols, List of Contents
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%--------------------------------------------------------------------------
%List of Figures
\newcommand{\listadefiguras}%
{%
\ifnotempty{\printthis}{%
\iftotalfigures
\setmainlanguage
\if@openright		% Garante que se a página for "direita"
    \cleardoublepage	% ele pula uma página para deixar o anverso em branco
\else
    \clearpage
\fi
\thispagestyle{empty} 	% Define o estilo desta página como vazio
\microtypesetup{protrusion=false}
\pdfbookmark{\listfigurename}{chap:ListOfFigures}
\listoffigures*
\clearpage
\microtypesetup{protrusion=true}
\fi % end of iftotalfigures
}% end of \ifnotempty{\printthis}
}%
%--------------------------------------------------------------------------
%List of Tables
\newcommand{\listadetabelas}%
{%
\ifnotempty{\printthis}{%
\iftotaltables
\setmainlanguage
\if@openright		% Garante que se a página for "direita"
    \cleardoublepage	% ele pula uma página para deixar o anverso em branco
\else
    \clearpage
\fi
\thispagestyle{empty} 	% Define o estilo desta página como vazio
\microtypesetup{protrusion=false}
\pdfbookmark{\listtablename}{chap:ListOfTables}
\listoftables*
\clearpage
\microtypesetup{protrusion=true}
\fi % end of \iftotaltables
}% end of \ifnotempty{\printthis}
}%
%--------------------------------------------------------------------------
%List of Abbreviations and Acronyms
\newcommand{\listadeabreviaturas}%
{%
\ifnotempty{\printthis}{%
\ifdefempty{\printacronyms}{%
\setmainlanguage
\if@openright		% Garante que se a página for "direita"
    \cleardoublepage	% ele pula uma página para deixar o anverso em branco
\else
    \clearpage
\fi
\thispagestyle{empty} 	% Define o estilo desta página como vazio
\microtypesetup{protrusion=false}
\pdfbookmark{\acronymname}{chap:ListOfAbbreviationsAndAcronyms}
\printacronyms
\clearpage
\microtypesetup{protrusion=true}
}%
{}% end of \ifdefempty
}% end of \ifnotempty{\printthis}
}%
%--------------------------------------------------------------------------
%List of Symbols
\newcommand{\listadesimbolos}%
{%
\ifnotempty{\printthis}{%
\ifdefempty{\printsymbols}{%
\setmainlanguage
\if@openright		% Garante que se a página for "direita"
    \cleardoublepage	% ele pula uma página para deixar o anverso em branco
\else
    \clearpage
\fi
\thispagestyle{empty} 	% Define o estilo desta página como vazio
\microtypesetup{protrusion=false}
\pdfbookmark{\glssymbolsgroupname}{chap:ListOfSymbols}
\printsymbols[style=tabx4col]
\clearpage
\microtypesetup{protrusion=true}
}%
{}% end of \ifdefempty
}% end of \ifnotempty{\printthis}
}%
%--------------------------------------------------------------------------
%List of Contents
\newcommand{\sumario}%
{%
\setmainlanguage
\if@openright		% Garante que se a página for "direita"
    \cleardoublepage	% ele pula uma página para deixar o anverso em branco
\else
    \clearpage
\fi
\thispagestyle{empty} 	% Define o estilo desta página como vazio
\microtypesetup{protrusion=false}
\pdfbookmark{\contentsname}{chap:Contents}
\tableofcontents*
\clearpage
\microtypesetup{protrusion=true}
}%


%---------------------------------------------------------------------------
% Outras definições
%---------------------------------------------------------------------------

%---------------------------------------------------------------------------
% Theorem Styles
% \newtheorem{teorema}{Teorema}
% \newtheorem{definicao}{Defini\c{c}\~{a}o}
% \newtheorem{corolario}{Corol\'{a}rio}
% \newtheorem{condicao}{Condi\c{c}\~{a}o}
% \newtheorem{proposicao}{Proposi\c{c}\~{a}o}
% \newtheorem{hipotese}{Hip\'{o}tese}
% \newtheorem{lema}{Lema}
%%%%
% \newtheorem{theorem}{Theorem}[section]
% \newtheorem{lemma}[theorem]{Lemma}
% \newtheorem{proposition}[theorem]{Proposition}
% \newtheorem{corollary}[theorem]{Corollary}
% % Definition Styles
% \theoremstyle{definition}
% \newtheorem{definition}{Definition}[section]
% \newtheorem{example}{Example}[section]
% \theoremstyle{remark}
% \newtheorem{remark}{Remark}
%---------------------------------------------------------------------------
% \addto\extrasenglish{%
%   \renewcommand{\chapterautorefname}{Chapter}%
%   \renewcommand{\sectionautorefname}{Section}%
%   \renewcommand{\subsectionautorefname}{Section}%
%   \renewcommand{\subsubsectionautorefname}{Section}%
%   \renewcommand{\equationautorefname}{Eq.}%
% }
% \SetAlgorithmName{Algorithm}{Algorithm}{List of Algorithms}
%---------------------------------------------------------------------------
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%
%%% Formatação de capitulos
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\setsecnumdepth{subsubsection}
\newlength{\linespace}
\setlength{\linespace}{\baselineskip} % current equivalent of \onelineskip
\newlength{\toptafiddle} \setlength{\toptafiddle}{2\linespace}
\newlength{\topfiddle} \setlength{\topfiddle}{\toptafiddle}
%% Definções do Estilo dos Capítulos
\makechapterstyle{asu}{%
\setlength{\beforechapskip}{-\topfiddle}
\setlength{\midchapskip}{1.0\onelineskip}
\setlength{\afterchapskip}{1.0\onelineskip}
%\renewcommand*{\chapnamefont}{\usefont{T1}{qhv}{b}{n}\selectfont\large}
\renewcommand*{\chapnamefont}{\bfseries\selectfont}% define fonte do capitulo{\sffamily\bfseries\large}
\renewcommand*{\chapnumfont}{\chapnamefont}
\renewcommand*{\printchapternum}{\chapnumfont \thechapter} %\thechapter
\renewcommand*{\chaptitlefont}{\chapnamefont}
\renewcommand*{\printchaptername}{}
\renewcommand*{\afterchapternum}{\hspace{0.6em}}
\renewcommand*{\printchaptertitle}[1]{\chaptitlefont \MakeUppercase{##1}}
\renewcommand*{\printchapternonum}{\centering}
}
% \setsecheadstyle{\usefont{T1}{qhv}{m}{n}\selectfont\MakeUppercase}
% \setsubsecheadstyle{\usefont{T1}{qhv}{b}{n}\selectfont}
% \setsubsubsecheadstyle{\usefont{T1}{qhv}{b}{n}\selectfont}
% \renewcommand*{\cftchapterfont}{\usefont{T1}{qhv}{b}{n}\selectfont}
%% Definções do Estilo das seções e subseções
\setsecheadstyle{\MakeUppercase} %\sffamily
\setsubsecheadstyle{\bfseries\selectfont} %\sffamily
\setsubsubsecheadstyle{\bfseries\selectfont} %\sffamily
\renewcommand*{\cftchapterfont}{\bfseries\selectfont} %\sffamily

%%%%%%%%%%%% Configura Cabeçalho

\nouppercaseheads

\makeatletter
\makepsmarks{myheadings}{%
\createmark{chapter}{left}{shownumber}{\@chapapp\ }{. \ }
\createmark{section}{right}{shownumber}{}{. \ }
\createplainmark{toc}{both}{\contentsname}
\createplainmark{lof}{both}{\listfigurename}
\createplainmark{lot}{both}{\listtablename}
\createplainmark{bib}{both}{\bibname}
\createplainmark{index}{both}{\indexname}
\createplainmark{glossary}{both}{\glossaryname}}
\makeatother

\makepagestyle{myheadings}
\makeheadrule{myheadings}{\textwidth}{\normalrulethickness}
\makeevenhead{myheadings}{\thepage}{}{\footnotesize\leftmark} % \scshape tirado
\makeoddhead{myheadings}{\footnotesize\rightmark}{}{\thepage}
\addtocontents{toc}{\protect\thispagestyle{empty}}


%\chapterstyle{tandh}
\chapterstyle{asu}

%%%%%%%%%%% Re-define frontmatter and mainmatter %%%%%%%%%%
\RequirePackage{etoolbox}
\makeatletter
\aliaspagestyle{title}{empty} % suppress the page number after \maketitle
\let\origps@chapter\ps@chapter
\preto\frontmatter{\let\ps@chapter\ps@empty\pagestyle{empty}}
\preto\mainmatter{%
  \cleardoublepage
  \let\ps@chapter\origps@chapter\pagestyle{myheadings}}
\makeatother
%%%%%%%%%%% Avoid clear page count after frontmatter %%%%%%%%%%
\makeatletter
\def\pagenumbering#1{%
  \gdef\thepage{\csname @#1\endcsname \c@page}}
\makeatother


