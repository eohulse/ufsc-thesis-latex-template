### Modelo para LaTeX para Teses e Dissertações da UFSC #

Este projeto implementa o modelo de Tese e Dissertação da Universidade Federal de Santa Catarina para LaTeX.

Antes de mais nada é importante salientar que já existem alguns projetos que implementam classes LaTeX com o modelo exigido pela UFSC. Abaixo seguem alguns pontos (nada imparciais) sobre duas destas implementações de que tenho conhecimento:
* Versão "[Oficial](http://sbu.paginas.ufsc.br/files/2011/03/modelo.zip)" da UFSC:
  1. Esta versão foi criada por Roberto Simoni e Carlos R Rocha e possui diversas funcionalidades.
  2. Porém sua última modificação foi realizada em 2010. Além disso ela utiliza como base a classe ABNTeX(1) que está obsoleta e foi completamente reimplementada em uma nova versão [abtTeX2](https://github.com/abntex/abntex2) por problemas de compatibilidade com outros pacotes. Esta nova versão é incompatível com a anterior. 
  3. Tem como única opção escrever o documento em português (alterar diretamente na classe para cabeçalhos e nomes reflitam um outro idioma não é trivial)
  4. Em suma é uma boa classe caso se queira escrever em português evitando usar recursos que por ventura sejam incompatíveis. 
* Versão usando como base a classe [abnTeX2](https://github.com/mateusduboli/ufsc-thesis-latex):
  1. Esta classe está em desenvolvimento e algumas funcionalidades básicas ainda não foram implementadas.
  2. Tem potêncial para ser uma excelente classe no futuro.

#### Instalação ####

#### Utilizando a classe ufscthesis.cls ####


#### Motivação ####

A criação desta classe LaTeX nasceu com a escrita da minha Dissertação de Mestrado que precisava ser escrita em inglês. Como eu desejava escrever utilizando LaTeX e não havia uma classe que me permitisse fazê-lo de uma forma eficiente iniciei o desenvolvimento de uma nova classe. Algumas informções importantes:
* A classe "ufscthesis.cls" utiliza como base a classe [Memoir](https://www.ctan.org/pkg/memoir?lang=en). Esta é uma classe muito utilizada e com ótima documentação. Inclusive ela serve como base para a classe abnTeX2.
* Muitas das funcionalidades presentes na classe ufscthesis foi implementada tendo como base as funcionalidades da versão LaTeX oficial da UFSC.
* Para as refêrencias e citações é utilizado o pacote abnTeX2Cite.

#### Contribuições ####
