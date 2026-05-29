# Revisão de PHP 
- **PHP:** É uma linguagem de BackEnd (como Golang, Java, C# etc.), ela roda do lado do servidor e não do usuário.
- **`<?php ?>`** É a tag de abertura do nosso código em PHP.
- **Exceções (não usamos `;`):** Condicionais (`if`, `else`, `elseif`) e `switch`.
- **Laços de repetição:** `for`, `foreach`, `while` (`do while` exige `;` após o `while`).

  - **`for`:** Diz quantas vezes o loop vai se repetir.
  - **`foreach`:** Trabalha com Arrays, alocação de memória, vários valores.
  - **`while`:** Enquanto a minha condição for verdadeira, continua no loop. Não esquecer o incremento (`i++`).
  - **`do while`:** Executa pelo menos uma vez, depois verifica a condição. Exige `;` no final: `while(condicao);`

- **Loop** = repetição de código

- **`break`:** Dá um pause no código. Se esquecer, ele pode executar o resto do código mesmo que indesejado.

- **`=`** : Define valor.
- **`==`** : Verifica se os valores são iguais, sem se importar com o tipo.
- **`===`** : Verifica se os valores **e** o tipo são iguais (estritamente igual).

- **`function`:** Bloco de código autônomo. Só será executado se você chamá-lo. Podemos reutilizar a função em várias partes do código sem reescrevê-lo.

- **Variável Global:** Para usar uma variável global dentro de uma função, use `global $var;` ou o array `$GLOBALS['var']`.
- **Variáveis Superglobais:** Disponíveis em todos os escopos sem precisar de `global`.
  - **`$_GET`** – Dados enviados pela URL (ex: `?nome=Joao`)
  - **`$_POST`** – Dados enviados por formulários, de forma oculta (não aparece na URL).
  - **`$_REQUEST`** – Junta `$_GET`, `$_POST` e `$_COOKIE`.
  - **`$_SESSION`** – Dados da sessão do usuário.
  - **`$_SERVER`** – Informações do servidor (IP, navegador, método HTTP)
- **Regra de ouro:** Nunca confie em dados vindos de `$_GET`, `$_POST`, `$_REQUEST`, `$_COOKIE` – sempre **valide** antes de usar!.