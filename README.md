# Modelo para LaTeX para Teses e Dissertações da UFSC #

Este projeto implementa o modelo de Tese e Dissertação da Universidade Federal de Santa Catarina para LaTeX.

Antes de mais nada é importante salientar que já existem alguns projetos que implementam classes LaTeX com o modelo exigido pela UFSC. Abaixo seguem alguns pontos (nada imparciais) sobre duas destas implementações de que tenho conhecimento:
* Versão "[Oficial](http://sbu.paginas.ufsc.br/files/2011/03/modelo.zip)" da UFSC:
  1. Esta versão foi modificada pela última vez em 2010 e utiliza como base a classe ABNTeX(1).
  2. A classe ABNTeX(1) está obsoleta e foi completamente reimplementada em uma nova versão [ABNTeX2](https://github.com/abntex/abntex2) por problemas de compatibilidade com outros pacotes. Esta nova versão é incompatível com a anterior. 
  3. Tem como única opção escrever o documento em português (alterar diretamente na classe para cabeçalhos e nomes reflitam um outro idioma não é trivial)
  4. Em suma é uma boa classe caso se queira escrever em português evitando usar recursos que por ventura sejam incompatíveis. 
* Versão usando como base a classe [ABNTeX2](https://github.com/mateusduboli/ufsc-thesis-latex):
  1. Esta classe tem futuro porém ainda está em desenvolvimento e algumas funcionalidades básicas ainda não foram implementadas.
