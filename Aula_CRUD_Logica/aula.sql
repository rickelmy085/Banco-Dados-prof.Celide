CREATE TABLE aluno (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    curso VARCHAR(100),
    idade INT,
    nota DECIMAL(4,2),
    status_matricula VARCHAR(20) DEFAULT 'Ativo',
    data_matricula DATE DEFAULT (CURRENT_DATE)
);

INSERT INTO aluno (nome, curso, idade, nota, status_matricula, data_matricula) VALUES
("Ana Souza", "Matemática", 20, 7.5, "Ativo", "2025-03-10"),
("Carlos Silva", "Desenvolvimento de Sistemas", 22, 6.0, "Ativo", "2025-03-12"),
("Mariana Oliveira", "Química", 19, 8.0, "Ativo", "2025-03-15"),
/*Omissão de colunas*/
("Camila", NULL,"História", NULL, NULL, NULL),
/*Caracteres de escape - CORRIGIDO (sem crases externas e com aspas duplas no nome)*/
("D'Angelo", NULL, NULL, 8.5, NULL, NULL),
/*Cálculo na inserção*/
(NULL, 2026 - 2008 ,"Logica de Programação", NULL, NULL, NULL),
/*Inserção com status*/
("Marcos", NULL, NULL, 5.0, NULL, "trancado"),
/*Matrícula antiga*/
("Sônia", NULL, NULL, NULL, "2024-02-15", NULL),
/*Cálculo de nota*/
("Beto", NULL, NULL,(7.5 + 8.0)/2 , NULL, "transferido"),
/*Inserção completa dinâmica*/
(UPPER("Letícia"), NULL, NULL, NULL, NULL, NULL);

/*Insert ignorando erros (MySQL)*/
INSERT IGNORE INTO aluno(id, nome) VALUES
(1, "Rodrigo Forçadas");

INSERT INTO aluno(id, nome, idade ,curso, nota) VALUE
(100, "João", 25, NULL, NULL);

# READS
select * from aluno;
/*Operador BETWEEN*/
SELECT nome, nota FROM aluno WHERE nota BETWEEN 6.0 AND 8.5;
/*Operador IN*/
SELECT nome, curso FROM aluno WHERE curso IN ("Matemática", "Física", "Química");
/*Operador LIKE (Início) a letra "C"*/
SELECT nome FROM aluno WHERE nome LIKE "C%";
/*Operador LIKE (Conteúdo) sobrenome silva*/
SELECT nome FROM aluno WHERE nome LIKE "%Silva%";
/*Tratamento de Nulos:nota não foi lançada(IS NULL)*/
SELECT nome, nota FROM aluno WHERE nota IS NULL;
/*. Agregação Simples*/
SELECT COUNT(nome) AS total_alunos_ativos FROM aluno WHERE status_matricula = "Ativo";
/*Ordenação Múltipla: curso ASC, nota DESC*/
SELECT nome, curso, nota FROM aluno ORDER BY curso ASC, nota DESC;
/*Exclusão Lógica: NÃO está em Artes*/
SELECT nome, curso FROM aluno WHERE curso != "Artes";
/*Média Matemática*/
SELECT AVG(nota) FROM aluno;
/*Busca de Distintos*/
SELECT DISTINCT curso FROM aluno;

# UPDATES
/*Acréscimo Percentual 10%*/
UPDATE aluno SET nota = nota * 1.1 WHERE curso = "Banco de Dados";
/*Condição Dupla (AND)*/
UPDATE aluno SET status_matricula = "Trancado" WHERE nota < 4.0 AND idade > 18;
/*Atualização Múltipla (id 12)*/
UPDATE aluno SET curso = "Desenvolvimento Web", nota = 9.0 WHERE id = 12;
/*Condição Inclusiva (IN)*/
UPDATE aluno SET idade = 20 WHERE id IN (2, 5, 7, 10);
/*Limpando Dados (setando nulo)*/
UPDATE aluno SET nota = NULL WHERE status_matricula = "Trancado";
/*Padronização de Texto (LOWER)*/
UPDATE aluno SET nome = LOWER(nome) WHERE curso = "História";
/*Condição Alternativa (OR)*/
UPDATE aluno SET nota = nota - 0.5 WHERE curso = "Física" OR curso = "Química";
/*Condição por Data*/
UPDATE aluno SET status_matricula = "Concluido" WHERE data_matricula < "2025-01-01";
/*Concatenação*/
UPDATE aluno SET nome = CONCAT(nome, " (Representante)") WHERE id = 3;
/*Ajuste Dinâmico (Nota > 10 vira 10)*/
UPDATE aluno SET nota = 10.0 WHERE nota > 10.0;

# DELETES
# SET SQL_SAFE_UPDATES = 0;
/*Delete Parcial (LIKE)*/
DELETE FROM aluno WHERE nome LIKE '%Junior';
/*Delete com IN*/
DELETE FROM aluno WHERE id IN (4, 8, 15);
/*Limpeza de Nulos*/
DELETE FROM aluno WHERE curso IS NULL;
/*Delete por Intervalo*/
DELETE FROM aluno WHERE idade BETWEEN 30 AND 40;
/*Combinação Exata (Geografia e Trancado)*/
DELETE FROM aluno WHERE curso = 'Geografia' AND status_matricula = 'Trancado';
/*Ordenação com Delete (3 menores notas - MySQL)*/
DELETE FROM aluno ORDER BY nota ASC LIMIT 3;
/*Delete por Exceção (Menor que 5, exceto DS)*/
DELETE FROM aluno WHERE nota < 5.0 AND curso != 'Desenvolvimento de Sistemas';
/*Limpeza por Padrão*/
DELETE FROM aluno WHERE nome LIKE '%Teste%';
/*Validação Rigorosa*/
DELETE FROM aluno WHERE idade < 16 AND YEAR(data_matricula) = 2026;
/*Remoção Condicional Múltipla*/
DELETE FROM aluno WHERE nota = 0.0 OR status_matricula IS NULL;

/*Desafio 1: o raio-x do conselho de classe (leitura com agrupamento)*/
SELECT curso, AVG(nota) FROM aluno GROUP BY curso HAVING AVG(nota) > 7.0;

/*Desafio 2: a migração de sistema (criação dinâmica)*/
CREATE TABLE alunos_aprovados AS SELECT * FROM aluno WHERE nota >= 6.0;
SELECT * FROM alunos_aprovados;

/*Desafio 3: a regra de negócio automatizada (update condicional)*/
UPDATE aluno SET status_matricula = CASE 
    WHEN nota >= 6.0 THEN "Concluido" 
    ELSE "Retido" 
END;

/*Desafio 4: a limpeza de inconsistências (delete com subquery lógica)*/
DELETE FROM aluno WHERE nota IS NULL AND curso = (SELECT curso FROM aluno WHERE nome = "Pedro Costa");

# Rickelmy Feitosa - 28/05/2026 - Banco de Dados II - ETEC PROFESSOR GAMARGO ARANHA