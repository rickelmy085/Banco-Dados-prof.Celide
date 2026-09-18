CREATE TABLE aluno (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome TEXT,
    idade INT,
    curso TEXT,
    nota DECIMAL(3,1)
);

# CREATE
INSERT INTO aluno(nome, idade, curso, nota) VALUE
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

# READS
# Busque todos os dados de todos os alunos da tabela.
SELECT * FROM aluno;
# Consulte apenas a coluna nome de todos os alunos.
SELECT nome FROM aluno;
# Liste todos os alunos que estão no curso de "Matemática".
SELECT curso FROM aluno WHERE curso = "Matemática";
# Encontre todos os alunos que têm mais de 20 anos.
SELECT idade FROM aluno WHERE idade >= 20;
# Busque os alunos que tiraram uma nota maior ou igual a 7.0.
SELECT nota FROM aluno WHERE nota >= 7.0;
# Encontre o aluno específico que possui o id número 5.
SELECT nome FROM aluno WHERE id = 5;
# Liste o nome e a nota de todos os alunos do curso de "História".
SELECT nome, nota FROM aluno WHERE curso = "História";
# Busque todos os alunos cuja idade seja exatamente 18 anos.
SELECT * FROM aluno WHERE idade = 18;
# Consulte os alunos que tiraram a nota máxima (10.0).
SELECT * FROM aluno WHERE nota = 10.0;
# Liste todos os alunos cujo nome seja "Ana".
SELECT * FROM aluno WHERE nome = "Ana";

/*
1. Atualize a nota do aluno com id igual a 1 para 9.5.
2. Mude o curso da aluna "Mariana" para "Geografia".
3. Altere a idade do aluno com id igual a 3 para 21 anos.
4. Atualize a nota de todos os alunos do curso de "Física" para 8.0.
5. Corrija o nome do aluno com id 4 para "Ana Carolina".
6. Mude o curso de todos os alunos que estão em "Artes" para "Design".
7. Aumente a nota da aluna "Beatriz" para 8.5.
8. Altere a idade e a nota do aluno "Lucas" para 21 anos e nota 9.0,
respectivamente.
9. Atualize a nota do aluno com id 10 para 5.0.
10. Mude o curso do aluno com id 2 para "Ciências da Computação"
*/

# UPDATE
UPDATE aluno SET nota = 9.5 WHERE id = 1;
UPDATE aluno SET curso = "Geografia" WHERE nome = "Mariana";
UPDATE aluno SET idade = 21 WHERE id = 3;
UPDATE aluno SET nota = 8.0 WHERE curso = "Física";
UPDATE aluno SET nome = "Ana Carolina" WHERE id = 4;
UPDATE aluno SET curso = "Design" WHERE curso = "Artes";
UPDATE aluno SET nota = 8.5 WHERE nome = "Beatriz";
UPDATE aluno SET idade = 21, nota = 9.0 WHERE nome = "Lucas";
UPDATE aluno SET nota = 5.0 WHERE id = 9;
UPDATE aluno SET curso = "Ciências da Computação" WHERE id = 2;

/*1. Delete o aluno que possui o id igual a 10.
2. Remova a aluna chamada "Fernanda" do banco de dados.
3. Delete todos os alunos que possuem uma nota menor que 5.0.
4. Exclua todos os registros de alunos do curso de "Química".
5. Remova o aluno com id igual a 7.
6. Delete todos os alunos que têm menos de 18 anos.
7. Exclua do banco de dados o aluno chamado "Roberto".
8. Remova todos os alunos cuja nota seja exatamente 0.
9. Delete o aluno com id igual a 15.
10. Exclua todos os alunos do curso de "História" que tenham uma nota menor que 6.0
*/

# Delete
DELETE FROM aluno WHERE id = 9 ;
DELETE FROM aluno WHERE nome = "Fernanda";
DELETE FROM aluno WHERE nota < 5.0;
DELETE FROM aluno WHERE curso = "Química";
DELETE FROM aluno WHERE id = 7;
DELETE FROM aluno WHERE id < 18;
DELETE FROM aluno WHERE nome = "Roberto";
DELETE FROM aluno WHERE nota = 0;
DELETE FROM aluno WHERE id = 15;
DELETE FROM aluno WHERE curso = "História" AND nota < 6.0;

UPDATE aluno SET nota = nota + 1.5 WHERE curso = "Física" AND nota < 7;
SELECT * FROM aluno;