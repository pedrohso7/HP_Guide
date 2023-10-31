<p align="middle">
<img alt="banner" title="App" src="https://github.com/pedrohso7/HP_Guide/assets/32853995/2ce44539-1d02-41bb-8d44-223664d81ab9" width="200"/>
</p>
          
<p align="center">
  <a href="#-projeto">Projeto</a>
  &nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#-tecnologias">Tecnologias</a>
  &nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#-visao-geral">Visão Geral</a>
  &nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#-telas-implementadas">Telas Implementadas</a>
  &nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#-utilizacao">Utilização</a>
</p>

## ✦ Projeto
<p align="justify">
 Esse repositório foi criado para ser um guia a respeito dos personagens de Harry Potter utilizando o padrão de arquitetura <a href="https://resocoder.com/2019/08/27/flutter-tdd-clean-architecture-course-1-explanation-projeto-structure">Reso Coder's Flutter Clean Architecture Proposal™</a> 
e aplica as mais populares tecnologias e abordagens de um projeto robusto e escalável.
</p>

## ✦ Tecnologias
As tecnologias utilizadas:
- [Flutter](https://flutter.dev/)
- [Dart](https://dart.dev/)
- [Flutter Modular](https://pub.dev/packages/flutter_modular) para injeção de dependência e roteamento. Esse pacote permite utilizar uma estrutura modularizada e inteligente para injetar dependências nas classes e definir as rotas do aplicativo. Dessa forma é possível melhorar o entendimeto das features, lidar com menos breaking changes and melhorar o reuso de componentes.
- [Flutter BLoC](https://pub.dev/packages/flutter_bloc) para o gerenciamento de estado das páginas do app. O BLoC permite uma separação clara entre os componentes da UI e a lógica de negócios e isso ajuda a organizar o código e torná-lo mais sustentável e testável.

## ✦ Visão Geral
<p align="justify">
A divisão do app é feita em pasta core e pasta app. A pasta core responsável por armazenar componentes que podem ser compartilhados ao longo do app e a pasta app comporta as features do aplicativo que, neste caso, terá apenas uma:
</p>

<p align="middle">
<img alt="App content" title="App" src="https://github.com/pedrohso7/HP_Guide/assets/32853995/606677c8-a3d3-473c-9e6e-01402056736e" width="200"/>
</p>

<p align="justify">
O conteúdo a seguir explica como cada feature foi estruturada:
</p>

<p align="middle">
<img alt="App Architeture" title="App" src="https://user-images.githubusercontent.com/32853995/194931703-4ba7e856-fe0f-4a4f-b3d8-04372c3a4441.png" width="385"/>
</p>

<p align="justify">
A feature "characters" será utilizada como exemplo:
</p>

<h4>Presentation</h4>

<p align="justify">
No topo do fluxo supracitado, temo a camada de apresentação que inclui os widgets, telas e presenters. Além disso é responsável por renderizar a interface do usuário e lidar com as ações do mesmo. 

Essa separação faz com que o código seja testável e de manutenção fácil pois remove as lógicas de negócio do comportamento da UI, evitando um código acoplado. Utilizando o BLoC também ajuda a fazer uma separação ainda melhor do que é um componente da UI e os possíveis eventos.
</p>

<p align="justify">
A camada de apresentação do projeto foi dividido em bloc, widgets, screens e presenter:
</p>

<ul>
<li><b>bloc</b>: A pasta bloc para o gerenciamento de estado da página.</li>
<li><b>screens</b>: A pasta screens contém as possíveis telas que podem ser exibidas (normalmente componentes stateless).</li>
<li><b>widgets</b>: A de widgets para componentes stateless gerais, especialmente os que podem ser reutilizados entre as telas.</li>
<li><b>presenter</b>: Arquivo orquestrador que gerencia as páginas e ações disponíveis</li>
</ul>

<p align="middle">
<img alt="Presentation structure" title="App" src="https://github.com/pedrohso7/HP_Guide/assets/32853995/61b22810-399a-494d-a387-145ae944cd44" width="385"/>
</p>

<h4>Domain</h4>

<p align="justify">
Abaixo da camada de apresentação no diagrama da arquitetura está a camada de domínio que, basicamente, contém toda a lógica de negócio e as entidades. Ela representa as funcionalidades principais da feature e deve ser necessariamente independente de elementos externos. Construir um domínio dessa forma ajuda a lógica de negócio a ser independente da UI e das fontes de dados.  
</p>

<p align="middle">
<img alt="Domain structure" title="App" src="https://github.com/pedrohso7/HP_Guide/assets/32853995/f8da46cf-738e-44ec-8782-e5a698c78fcb" width="385"/>
</p>

As pastas relatadas são:
<ul>
<li><b>usecases</b>: Contém as regras de negócios ou casos de uso específicos do aplicativo. Esses casos de uso representam as ações que podem ser executadas dentro do aplicativo.</li>
<li><b>protocols</b>: Inclui as interfaces ou classes que definem os métodos para operações de dados. Essas interfaces são implementadas na camada de dados, em repositórios.</li>
<li><b>entities</b>: Contém os principais modelos de dados ou entidades que representam os objetos de negócios e estruturas de dados usados no recurso</li>
</ul>

<h4>Data</h4>
<p align="justify">
Essa camada, por sua vez, lida com os dados, incluindo fontes de dados, repositórios e models. É responsável por retornar e armazenar os dados de recursos externos como bancos de dados, API's ou repositórios. 

Além disso a camada de dados abstrai as fontes de dados e provê uma interface unificada para acessar e manipular dados, separando o o processamento de dados do resto da aplicação. Dessa forma conseguimos gerenciar e isolar dados facilmente, trocar dados livremente sem se preocupar em impactar a lógica de negócio.
</p>

<p align="middle">
<img alt="Data structure" title="App" src="https://github.com/pedrohso7/HP_Guide/assets/32853995/87f8dae2-cc4f-442c-99da-ebc0fc537c0c" width="385"/>
</p>

As pastas da camada de dados são:
<ul>
<li><b>datasources</b>: Contém classes responsáveis por interagir com fontes de dados remotas, como APIs ou serviços web.</li>
<li><b>repositories</b>: Implementa as interfaces definidas na camada de domínio. Essas implementações concretas lidam com operações de dados e servem como ponte entre a camada de domínio e fontes de dados externas.</li>
<li><b>models</b>: Contém os modelos de dados (implementação concreta das entidades de domínio) que representam as estruturas de dados usadas para manipulação de dados dentro do aplicativo</li>
</ul>

<h4>Core</h4>
<p align="justify">
Além dos recursos, foi criada uma pasta core que contém todos os componentes compartilhados usados na aplicação como erros, mixins, extensões, constantes e widgets comuns:
</p>

<p align="middle">
<img alt="Core folder" title="App" src="https://github.com/pedrohso7/HP_Guide/assets/32853995/e628b416-299d-410d-bd3e-a89f5155a6f1" width="450"/>
</p>

<h4>Injeção de Dependência</h4>

<p align="justify">
A injeção de dependência segue o diagrama do início deste documento, ou seja, as fontes de dados são injetadas nos repositórios, os repositórios são injetados nos casos de uso e os casos de uso são injetados na apresentação. Modular tornou tudo mais fácil, felizmente.
</p>

<p align="middle">
<img alt="characters feature injection" title="App" src="https://github.com/pedrohso7/HP_Guide/assets/32853995/ce151bf8-0c5c-4a8c-b6eb-4f41e4ddc63a" width="350"/>
</p>

<h5>Binds</h5>

<p align="middle">
<img alt="characters feature binds" title="App" src="https://github.com/pedrohso7/HP_Guide/assets/32853995/0b865b31-7c3e-4ba8-a4ff-fdb0092b55be" width="500"/>
</p>

<h5>Routes</h5>

<p align="middle">
<img alt="characters feature routes" title="App" src="https://github.com/pedrohso7/HP_Guide/assets/32853995/0f9aa61d-0579-464f-9646-786a56459ca5" width="500"/>
</p>

<p align="justify">
Dessa forma é possível adicionar apenas as dependências necessárias e o modular vai criar e limpar automaticamente os módulos quando alguma ação de navegação for acionada.
</p>

## ✦ Telas Implementadas
<p align="justify">
          As imagens abaixo mostram as telas implementadas no app.
</p>

<p align="middle">    
<img alt="Home View" title="App" src="https://github.com/pedrohso7/HP_Guide/assets/32853995/0a5bc004-9bdb-4915-964e-57a492cdeb1d" width="300"/>
<img alt="Search View" title="App" src="https://github.com/pedrohso7/HP_Guide/assets/32853995/d3c9f365-bc45-4df3-b0f5-a38cb8bb9bdb" width="300"/>
          <img alt="Personagens View" title="App" src="https://github.com/pedrohso7/HP_Guide/assets/32853995/c6436d29-fc3c-4210-9473-161f9fa5b2c2" width="300"/>
<img alt="Details 1 View" title="App" src="https://github.com/pedrohso7/HP_Guide/assets/32853995/af2a9e9a-26f4-4a5b-bd62-63f9f294c0d3" width="300"/>
          <img alt="Details 2 View" title="App" src="https://github.com/pedrohso7/HP_Guide/assets/32853995/6be309c0-53ce-4d30-af4f-264e4ceffa0b" width="300"/>
</p>

## ✦ Utilização
<p align="justify">
          Para começar a usar o projeto, tenha certeza de que criou um arquivo .env no diretório raiz seguindo o exemplo no arquivo .env.example. Depois disso, utilize o comando:
</p>

```
flutter pub get
```

<p align="justify">
Agora que obtemos as dependências do projeto, basta rodar com o comando:
</p>

```
flutter run
```

<p align="justify">
Ao invés disso você também pode gerar um build no formato .apk e rodar no seu dispositivo android utilizando:
</p>

```
flutter build apk
```
