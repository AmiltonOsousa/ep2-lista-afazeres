# Modelagem das Expressões Regulares

Este documento descreve os critérios usados para reconhecer os padrões da lista de afazeres.

## 1. Ações

As ações estão centralizadas na classe `Acao` em `acoes.rb`.

Lista reconhecida:

- `agendar`
- `marcar`
- `ligar`
- `comprar`
- `estudar`
- `enviar`
- `pagar`
- `buscar`
- `reunião`

Regex usada:

```rb
\b(#{Acao::TODAS.join('|')})\b
```

### Critério

- `\b` garante fronteira de palavra
- `join('|')` forma uma alternância entre as ações permitidas
- `i` permite maiúsculas e minúsculas

### Casos cobertos

- `agendar`
- `Marcar`
- `reunião`

## 2. Pessoas

O reconhecimento de pessoas procura nomes após a palavra `com`.

Regex usada:

```rb
/com\s+((?:\p{Lu}\p{L}+(?:\s+e\s+\p{Lu}\p{L}+)*)?)/u
```

### Critério

- `com\s+` identifica o conector
- `\p{Lu}` reconhece letra maiúscula
- `\p{L}+` permite letras com acento
- `(?:\s+e\s+...)` permite vários nomes como `Pedro e João`
- `u` ativa modo Unicode

### Casos cobertos

- `com José`
- `com João`
- `com Pedro e João`
- `com Maria e Ana`

## 3. Horários

Foram modelados quatro formatos principais.

Regex usadas:

```rb
\b(?:[01]?\d|2[0-3]):[0-5]\d\b
\b(?:[01]?\d|2[0-3])\s+[0-5]\d\b
\b(?:[01]?\d|2[0-3])\s*horas?\b
\b(?:[aà]s)\s+(?:[01]?\d|2[0-3])\b
```

### Critério

- o primeiro padrão reconhece `10:30`
- o segundo reconhece `10 30`
- o terceiro reconhece `10 horas` e `1 hora`
- o quarto reconhece `às 10`

### Casos cobertos

- `10:30`
- `10 30`
- `10 horas`
- `1 hora`
- `às 10`

## 4. Datas

As datas foram modeladas por formato numérico, datas por extenso e datas relativas.

Regex usadas:

```rb
\b\d{1,2}\/\d{1,2}(?:\/\d{4})?\b
\b(?:hoje|amanh[aã]|depois de amanh[aã])\b
\b\d{1,2}(?:\s+de)?\s+(?:janeiro|fevereiro|março|abril|maio|junho|julho|agosto|setembro|outubro|novembro|dezembro)(?:\s+de\s+\d{4})?\b
```

### Critério

- o primeiro padrão reconhece datas como `30/01` e `20/04/2022`
- o segundo reconhece datas relativas como `hoje`, `amanhã` e `depois de amanhã`
- o terceiro reconhece datas por extenso como `28 de Fevereiro`, `18 agosto` e `13 de agosto de 2021`

### Casos cobertos

- `hoje`
- `amanhã`
- `depois de amanhã`
- `30/01`
- `20/04/2022`
- `18 agosto`
- `18 de agosto 2023`
- `13 de agosto de 2021`

## 5. Tags

Regex usada:

```rb
/#[a-zA-ZÀ-ÿ0-9_]+/
```

### Critério

- reconhece palavras iniciadas com `#`
- aceita letras, números e `_`
- permite acentos em letras

### Casos cobertos

- `#casa`
- `#trabalho`
- `#reunião`

## 6. Emails

Regex usada:

```rb
\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}\b
```

### Critério

- reconhece a parte local do email
- reconhece domínio e subdomínio
- exige extensão com pelo menos duas letras

### Casos cobertos

- `jose.da-silva@sp.senac.br`

## 7. URLs

Regex usada:

```rb
%r{https?:\/\/[^\s]+}i
```

### Critério

- aceita `http` e `https`
- captura até o próximo espaço
- `i` permite maiúsculas e minúsculas
