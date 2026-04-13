# Atv4 To-Do List

Um aplicativo simples e organizado de lista de tarefas desenvolvido com Flutter. O projeto tem como foco a organização de tarefas com um sistema de status claro e uma interface moderna baseada no Material Design 3.

## Visão Geral

O Atv4 To-Do List é um app de gerenciamento de tarefas que permite criar e organizar atividades em três estados:

* A Fazer (To Do)
* Em Andamento (Doing)
* Concluído (Done)

A interface é minimalista e intuitiva, facilitando o acompanhamento do progresso no dia a dia.

## Funcionalidades

* Criar e gerenciar tarefas
* Organizar tarefas por status
* Tela dedicada para tarefas concluídas
* Interface moderna com Material Design 3
* Estrutura de código modular com widgets reutilizáveis
* Aplicativo leve e rápido

## Tecnologias Utilizadas

* Flutter
* Dart
* Material Design 3

## Estrutura do Projeto

lib/
│
├── main.dart                # Ponto de entrada da aplicação
├── models/
│   └── task.dart           # Modelo de dados das tarefas (Task e TaskStatus)
├── pages/
│   ├── home_page.dart      # Página principal com lista de tarefas
│   └── completed_page.dart # Página de tarefas concluídas
├── widgets/
│   ├── task_cards.dart     # Componente visual das tarefas
│   ├── section_header.dart # Cabeçalho das seções
│   └── empty_message.dart  # Mensagem para listas vazias

## Como Rodar o Projeto

### Pré-requisitos

* Flutter instalado
* Dart configurado
* Emulador ou dispositivo físico

### Passos

git clone https://github.com/Coldext/Atv4-To-do-List.git
cd Atv4-To-do-List
flutter pub get
flutter run

## Como Usar

* Adicione novas tarefas pela interface
* Acompanhe o progresso mudando o status das tarefas
* Visualize tarefas concluídas na tela dedicada

## Licença

Este projeto é de uso livre para fins de estudo.
