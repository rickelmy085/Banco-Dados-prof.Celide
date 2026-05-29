# Revisão de BD
- **IN(Dentro de uma lista):**Dentro de uma lista. Busca valores que tenham dentro de uma tabela especifica. O IN pode substituir o OR. EX:
```Mysql
SELECT * FROM cliente WHERE estado IN ("SP", "RJ", "BA");
```
- **BETWEEN(Entre):** Busca valores que estão entre um ponto inicial e um ponto final. Ótimo para número e datas. EX:
```MySQL
SELECT nome, preco FROM produtos WHERE preco BETWEEN 50 and 100;
```
- **LIKE(parecido com/contém):** Detetive de textos. Procura padrões em palavras usando o símbolo da porcentagem (%)-> Significa qualquer coisa. EX:
```MySQL
SELETEC * FROM cliente WHERE nome LIKE "Ana%"; (Vai procurar qualquer texto que comece com "Ana" e termine de qualque jeito)
```

- **Count(Contador):** Contador automático. Conta  quantas linhas existem com base no que pedimos na pesquisa. Ele não soma valor, ele só quer saber em quantos linhas (Quantos registros). EX.
```MySQL
SELECT COUNT(*) FROM clientes; -- Ele vai mostrar o número de quantidade de fichas de cadastro 
```

- **AVG(Média):**  Calcula a média aritmética dos valores de uma coluna numérica. EX:
```MySQL
SELECT AVG(idade) FROM cliente;
```

- **ORDER BY(Ordem):** Organiza os resultados da pesquisa em Crescente(ASC) e Decrescente(DESC). EX:
```MySQL
SELECT * FROM cliente ORDER BY nome; -- Crescente (A-Z)
SELECT * FROM cliente ORDER BY idade DESC; -- Decrescente (mais velho)
SELECT * FROM cliente ORDER BY estado ASC, nome ASC; -- Ordena por estado, depois nome
```
- **IS NULL(Está vazio):** Verifica se um campo está vazio (NULL é diferente de vazio ou 0). EX: 
```MySQL
SELECT * FROM cliente WHERE email IS NULL; -- Clientes sem email
SELECT * FROM cliente WHERE email IS NOT NULL; -- Clientes com email
```