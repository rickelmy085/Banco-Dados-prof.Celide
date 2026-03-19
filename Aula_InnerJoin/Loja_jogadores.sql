-- Tabela da atividade
CREATE TABLE Jogadores (
id_aluno INT primary key,
nick_name varchar(100) not null
);
-- tabela dos Jogos
CREATE TABLE Jogos (
id_jogo INT primary key,
titulo VARCHAR(50),
preco DECIMAL(10,2)
);

CREATE TABLE Compras(
id_compra INT primary key,
id_jogadores_fk INT,
id_jogos_fk INT
);

INSERT INTO Jogadores(id_aluno, nick_name) VALUES
(1, 'RikEyes081'),
(2, 'Arizinha'),
(3, 'Mathzx');

INSERT INTO Jogos(id_jogo, titulo, preco) VALUES
(66, 'Cult of the Lamb', 112.45),
(81, 'The Last of Us Part I', 250.00),
(77, 'Grand Theft Auto: San Andreas', 50.00);

-- RckEyes combrou o Cult
-- Arizinha comprou The Last of Us e GTA
-- Math comprou nada, sobrou nada
select Jogadores.nick_name, Jogos.titulos, Compras from Jogadores
INNER JOIN Jogadores ON Jogadores.nick_name = Jogos.titulos;

INSERT INTO Compras(id_compra, id_jogadores_fk, id_jogos) VALUES
(101, 1, 66),
(102, 2, 81),
(103, 2, 77);


