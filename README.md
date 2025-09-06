# 🛠️ Projeto de Compilador - Linguagem Proprietária

[![Java](https://img.shields.io/badge/Java-17-red?style=for-the-badge&logo=openjdk)](https://java.com)
[![ANTLR](https://img.shields.io/badge/ANTLR-4.13-blue?style=for-the-badge)](https://www.antlr.org/)
[![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)](LICENSE)

Compilador completo desenvolvido em Java para uma linguagem de programação proprietária, incluindo análise léxica, sintática, geração de código intermediário e otimizações.

## 📋 Índice
- [Funcionalidades](#-funcionalidades)
- [Tecnologias Utilizadas](#-tecnologias-utilizadas)
- [Estrutura do Projeto](#-estrutura-do-projeto)
- [Instalação e Execução](#-instalação-e-execução)
- [Exemplos de Código](#-exemplos-de-código)
- [Contribuição](#-contribuição)
- [Licença](#-licença)

## ✨ Funcionalidades

- **🔡 Análise Léxica**: Reconhecimento de tokens e símbolos da linguagem
- **📐 Análise Sintática**: Parsing da estrutura gramatical usando ANTLR4
- **🌳 Árvore Sintática**: Geração de AST (Abstract Syntax Tree)
- **⚙️ Geração de Código Intermediário**: Produção de código de três endereços
- **🚀 Otimizações**: Técnicas de otimização de código intermediário
- **🛟 Tratamento de Erros**: Sistema de mensagens de erro descritivas

## 🛠️ Tecnologias Utilizadas

### Linguagens & Frameworks
- **Java 17**: Linguagem principal de implementação
- **ANTLR 4.13**: Gerador de parsers para análise sintática
- **Maven**: Gerenciamento de dependências e build

### Ferramentas de Desenvolvimento
- **IDE**: IntelliJ IDEA / Eclipse
- **Controle de Versão**: Git
- **Testes**: JUnit 5

## 📁 Estrutura do Projeto
Projeto-Compiladores/
├── src/
│ ├── main/
│ │ ├── java/
│ │ │ └── compilador/
│ │ │ ├── analisador/ # Análise léxica e sintática
│ │ │ ├── arvore/ # Estruturas da AST
│ │ │ ├── codigo/ # Geração de código intermediário
│ │ │ ├── erro/ # Sistema de tratamento de erros
│ │ │ └── otimizacao/ # Técnicas de otimização
│ │ └── antlr/ # Gramáticas ANTLR
│ │ └── Linguagem.g4 # Gramática da linguagem
│ └── test/
│ └── java/
│ └── compilador/ # Testes unitários
├── exemplos/ # Programas de exemplo
│ ├── exemplo1.lang
│ ├── exemplo2.lang
│ └── exemplo3.lang
├── relatorio/ # Documentação técnica
│ ├── especificacao.md
│ └── manual.md
└── README.md


## 🚀 Instalação e Execução

### Pré-requisitos
- Java JDK 17 ou superior
- Maven 3.6+
- Git

### Clone e Build

# Clone o repositório
git clone https://github.com/IsisVO11/Projeto-Compiladores.git
cd Projeto-Compiladores

# Execute o build com Maven
mvn clean compile

# Execute os testes
mvn test
Executando o Compilador
bash
# Compilar um arquivo de exemplo
java -cp target/classes compilador.Main exemplos/exemplo1.lang

# Gerar AST visual (se implementado)
java -cp target/classes compilador.Main -ast exemplos/exemplo1.lang
💻 Exemplos de Código
Exemplo da Linguagem
javascript
// Programa de exemplo na linguagem proprietária
programa OláMundo
início
    inteiro x = 10
    string mensagem = "Olá, Mundo!"

    se x > 5 então
        escrever(mensagem)
    senão
        escrever("X é muito pequeno")
    fim se
fim
Saída do Compilador
assembly
# Código intermediário gerado
START:
    LOAD 10, R1
    STORE R1, x
    LOAD "Olá, Mundo!", R2
    STORE R2, mensagem
    COMPARE x, 5
    JUMP_IF_GREATER THEN_BLOCK
    JUMP ELSE_BLOCK

THEN_BLOCK:
    PRINT mensagem
    JUMP END_IF

ELSE_BLOCK:
    PRINT "X é muito pequeno"

END_IF:
    HALT


🤝 Contribuição
Contribuições são bem-vindas! Siga estos passos:

Faça um Fork do projeto

Crie uma Branch para sua Feature (git checkout -b feature/AmazingFeature)

Commit suas Mudanças (git commit -m 'Add some AmazingFeature')

Push para a Branch (git push origin feature/AmazingFeature)

Abra um Pull Request

📝 Licença
Este projeto está sob a licença MIT. Veja o arquivo LICENSE para detalhes.

👩💻 Autora
Isis Venturin - LinkedIn: https://www.linkedin.com/in/isis-venturin-b72443296/ | GitHub: https://github.com/IsisVO11
