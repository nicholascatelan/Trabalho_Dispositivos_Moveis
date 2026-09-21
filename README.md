# Loja de Instrumentos

Trabalho desenvolvido para a disciplina de Programação para Dispositivos Móveis.

O projeto consiste em uma aplicação de loja de instrumentos musicais, desenvolvida utilizando Dart e Flutter. A ideia foi aplicar na prática os principais conceitos vistos durante o bimestre, começando pela modelagem das classes em Dart e depois utilizando essas classes dentro da aplicação Flutter.

## Funcionalidades

A aplicação possui um catálogo com instrumentos musicais cadastrados.

É possível:

- Visualizar os instrumentos disponíveis no catálogo;
- Visualizar o valor total dos instrumentos;
- Abrir os detalhes de um instrumento;
- Cadastrar um novo instrumento;
- Adicionar o instrumento cadastrado à lista;
- Excluir instrumentos do catálogo;
- Atualizar automaticamente a lista e o valor total.

## Conceitos utilizados

Durante o desenvolvimento foram utilizados conceitos de orientação a objetos e Flutter, como:

- Classes e objetos;
- Construtores com parâmetros nomeados;
- `required`;
- Herança;
- Composição;
- Encapsulamento;
- Getters;
- `StatelessWidget`;
- `StatefulWidget`;
- `setState`;
- `ListView.builder`;
- Navegação entre telas;
- `TextFormField`;
- `TextEditingController`.

## Organização do projeto

O trabalho foi dividido em duas partes.

### Parte 1 - Dart

Na primeira parte foram desenvolvidas as classes responsáveis pela modelagem dos instrumentos e do catálogo.

Foram trabalhados conceitos como herança, composição e encapsulamento.

### Parte 2 - Flutter

Na segunda parte, as classes criadas anteriormente foram utilizadas em uma aplicação Flutter.

A aplicação apresenta uma lista inicial com seis instrumentos. Ao selecionar um instrumento, é possível visualizar seus detalhes.

Também existe uma tela de cadastro onde um novo instrumento pode ser informado. Depois da confirmação, ele é adicionado ao catálogo e o valor total é atualizado.

## Estrutura principal

```text
lib/
├── main.dart
├── models/
│   ├── instrumento.dart
│   ├── instrumento_eletrico.dart
│   └── catalogo.dart
└── screens/
    ├── home_page.dart
    ├── cadastro_page.dart
    ├── instrumento_card.dart
    └── instrumento_detalhes.dart
