CREATE TABLE aluno (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome TEXT,
    idade INT,
    curso TEXT,
    nota DECIMAL(3,1),
    data_matricula DATE,
    status_matricula VARCHAR(10)
);
# CREATES aula 06
INSERT INTO aluno (nome, idade, curso, nota) VALUE
("Lucas", 20, "Matemática", 8.5),
("Mariana", 22, "História", 9.0),
("Pedro", NULL, NULL, NULL),
("Ana", 19, NULL, NULL),
("Carlos", NULL, "Física", NULL),
("Fernanda", 21, NULL, 10.0),
("Roberto", 18, "Geografia", NULL),
("Beatriz", NULL, "Química", 7.5),
("Rafael", 30, "Artes", 6.0);
INSERT INTO aluno(id, nome, idade ,curso, nota) VALUE
(100, "João", 25, NULL, NULL);

# CREATES 
/*("", ,"", , "2025-01-01", "")*/
INSERT INTO aluno(nome, idade, curso, nota, data_matricula, status_matricula) VALUE
("Matheus Silva", 18,"Desenvolvimento de Sistemas", 8.5, "2025-02-10", "ativo"),
("Rafael Ramos", 19,"Administração", 7.0, "2025-02-03", "ativo"),
("Pedro Costa", 20,"Guia de Turismo", 1.0, "2025-01-01", "trancado"),
/*Usando o Current*/
("Rickelmy", 18,"Desenvolvimento de Sistemas", 10.0, CURRENT_DATE(), "trancado"),
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
SELECT COUNT(nome) AS total_alunos_ativos FROM aluno WHERE status_matricula = 'Ativo';
