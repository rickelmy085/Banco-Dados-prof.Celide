-- Tabela do slide
CREATE TABLE Jogadores (
id_aluno INT primary key,
nick_name varchar(100) not null
);
-- tabela das skins
CREATE TABLE skins (
id_skin INT primary key,
nome_skin VARCHAR(50),
id_dono INT
);

-- Inserindo os dados do teste 
INSERT INTO Jogadores VALUES (1, 'RickEyes081'), (2, 'Arizinha'), (3, 'Mathzx');
INSERT INTO Skins VALUES (10, 'Capa de Fogo', 1), (11, 'Espada Laser', 2);

SELECT Jogadores.nick_name, Skins.nome_skin FROM Jogadores
INNER JOIN Skins ON Jogadores.id_aluno = Skins.id_dono;
-- O inner Join vai pegar da tabela jogadores o ID deles que está atribuido no ID do dono da skin
-- Se não tivesse nenhum dado ele excluiria do resultado final

SELECT Jogadores.nick_name, Skins.nome_skin FROM Jogadores
LEFT JOIN Skins ON Jogadores.id_aluno = Skins.id_dono;

