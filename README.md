# Reconhecedor de Afazeres

Projeto em Ruby para identificar padrões textuais em uma linha de afazer usando expressões regulares.

## Problema resolvido

O sistema recebe uma entrada de texto pelo teclado e extrai elementos estruturados presentes na frase, como:

- ações
- pessoas
- datas
- horários
- tags
- emails
- URLs

O objetivo é reconhecer esses padrões de texto e exibir o resultado de forma organizada no terminal.

## Como executar

```bash
ruby main.rb
```

Depois disso, digite uma frase com um afazer e pressione Enter.

## Estrutura do projeto

- `main.rb`: recebe a entrada e aplica as expressões regulares
- `acoes.rb`: centraliza a lista de ações reconhecidas
- `docs/modelagem.md`: documentação da modelagem das expressões regulares

## Visão geral da solução

A implementação usa somente recursos nativos do Ruby e expressões regulares. Não há uso de gems para reconhecimento de datas ou outros parsers prontos.

O fluxo é simples:

1. ler a linha digitada pelo usuário
2. aplicar as regex para cada tipo de elemento
3. armazenar os resultados encontrados
4. imprimir a saída em blocos separados

## Saída esperada

O programa exibe os dados encontrados em seções como:

```text
Pessoas:
- José

Ações:
- agendar

Datas:
- amanhã

Horários:
- 10:00

Tags:
- #trabalho
```

## Documentação técnica

A explicação das expressões regulares usadas no projeto está em [`docs/modelagem.md`](docs/modelagem.md).
