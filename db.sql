CREATE DATABASE nuuvem;
USE nuuvem;

-- Tabela User
CREATE TABLE User (
    userID INT PRIMARY KEY AUTO_INCREMENT,
    userName VARCHAR(100) NOT NULL,
    userSurname VARCHAR(100) NOT NULL,
    userEmail VARCHAR(80) NOT NULL,
    userPassword VARCHAR(23) NOT NULL,
    userAddress VARCHAR(255) NOT NULL,
    userPedidos INT,
    userCarrinho INT,
    userDesejo INT,
    userChaves INT,
    UNIQUE (userEmail)
);
 
-- Tabela Pedidos
CREATE TABLE Pedidos (
    pedidosID INT PRIMARY KEY AUTO_INCREMENT,
    pedidosChaves INT UNIQUE,
    pedidosTransacao INT,
    pedidosUser INT,
    FOREIGN KEY (pedidosUser) REFERENCES User (userID)
);
 
-- Tabela Transacao
CREATE TABLE Transacao (
    transacaoID INT PRIMARY KEY AUTO_INCREMENT,
    transacaoData DATE,
    transacaoValor FLOAT,
    transacaoStatus VARCHAR(255),
    transacaoCarrinho INT,
    transacaoPedido INT,
    FOREIGN KEY (transacaoCarrinho) REFERENCES Carrinho (carrinhoID),
    FOREIGN KEY (transacaoPedido) REFERENCES Pedidos (pedidosID)
);
 
-- Tabela Carrinho
CREATE TABLE Carrinho (
    carrinhoID INT PRIMARY KEY AUTO_INCREMENT,
    carrinhoValor FLOAT,
    carrinhoJogos INT,
    FOREIGN KEY (carrinhoJogos) REFERENCES Jogo (jogosID)
);
 
-- Tabela Jogo
CREATE TABLE Jogo (
    jogosID INT PRIMARY KEY AUTO_INCREMENT,
    jogosNome VARCHAR(255),
    jogosDescricao TEXT,
    jogosLancamento DATE,
    jogosDesenvolvedora VARCHAR(255),
    jogosNota FLOAT,
    jogosPlataforma INT,
    joposPrice INT,
    jogosImg VARCHAR(255),
    FOREIGN KEY (jogosPlataforma) REFERENCES Plataforma (plataformaID)
);

-- Tabela Chaves
CREATE TABLE Chaves (
    chavesID INT PRIMARY KEY
);

-- Tabela ChavesJogos
CREATE TABLE ChavesJogos (
    chavesID INT,
    jogosID INT,
    PRIMARY KEY (chavesID, jogosID),
    FOREIGN KEY (chavesID) REFERENCES Chaves (chavesID),
    FOREIGN KEY (jogosID) REFERENCES Jogo (jogosID)
);

-- Tabela CarrinhoJogo
CREATE TABLE CarrinhoJogo (
    carrinhoID INT,
    jogoID INT,
    PRIMARY KEY (carrinhoID, jogoID),
    FOREIGN KEY (carrinhoID) REFERENCES Carrinho (carrinhoID),
    FOREIGN KEY (jogoID) REFERENCES Jogo (jogosID)
);

-- Tabela Plataforma
CREATE TABLE Plataforma (
    plataformaID INT PRIMARY KEY AUTO_INCREMENT,
    plataformaNome VARCHAR(255)
);

-- Tabela ListaDesejos
CREATE TABLE ListaDesejos (
    desejoID INT PRIMARY KEY AUTO_INCREMENT,
    desejoJogos INT,
    FOREIGN KEY (desejoJogos) REFERENCES Jogo (jogosID)
);



-- Inserindo os dados


INSERT INTO Plataforma (plataformaNome) VALUES 
    ('PlayStation 4'),
    ('Xbox One'),
    ('PC'),
    ('Nintendo Switch');


INSERT INTO Jogo (jogosNome, jogosDescricao, jogosLancamento, jogosDesenvolvedora, jogosNota, jogosPlataforma, jogosPrice, JogoImg)
VALUES 
    ('Dragon Ball Fighter Z', 'Jogo de luta baseado no universo Dragon Ball.', '2018-01-26', 'Arc System Works', 8.0, 3, 59.99, '../public/assets/home/jogos/dragonball-fighter-z.jpg'),
('Dying Light Definitve Edition', 'Jogo de sobrevivência em um mundo infestado de zumbis.', '2015-01-27', 'Techland', 9.0, 2, 39.99, '../public/assets/home/jogos/dying-light-definitive.jpg'),
('Hogwarts Legacy', 'RPG ambientado no mundo de Harry Potter.', '2022-10-28', 'Portkey Games', 9.5, 4, 149.99, '../public/assets/home/jogos/hogwarts-legacy-deluxe.jpg'),
('Mortal Kombat 11', 'Jogo de luta da famosa série Mortal Kombat.', '2019-04-23', 'NetherRealm Studios', 9.2, 1, 29.99, '../public/assets/home/jogos/mk-11.jpg'),
('Batman Arkham Knight', 'Jogo de ação e aventura estrelado pelo Batman.', '2015-06-23', 'Rocksteady Studios', 9.4, 2, 19.99, '../public/assets/home/jogos/batman-arkham-knight.jpg'),
('Injustice 2 Legenday Edition', 'Jogo de luta com personagens da DC Comics.', '2017-05-16', 'NetherRealm Studios', 8.8, 1, 34.99, '../public/assets/home/jogos/injustice-2-legendary.jpg'),
('Baldur''s Gate 3', 'RPG de ação baseado na série Dungeons & Dragons.', 'Em desenvolvimento', 'Larian Studios', 9.8, 3, 49.99, '../public/assets/home/jogos/baldur-gate-3.jpg'),
('Lego Harry Potter Collection', 'Coletânea de jogos LEGO baseada na saga Harry Potter.', '2020-10-30', 'TT Games', 8.7, 4, 39.99, '../public/assets/home/jogos/lego-harry-potter-collection.jpg'),
('Batman Arkham Collection', 'Coletânea dos jogos da série Arkham com o Batman.', '2019-09-06', 'Rocksteady Studios', 9.6, 2, 29.99, '../public/assets/home/jogos/batman-arkham-collection.jpg'),
('Injustice Gods Among Us Ultimate Edition', 'Jogo de luta com heróis e vilões da DC Comics.', '2013-11-12', 'NetherRealm Studios', 8.5, 1, 24.99, '../public/assets/home/jogos/injustice-gods-among-us.jpg'),
('Naruto Ultimate Ninja Storm 4 Road to Boruto', 'Jogo de luta baseado na série Naruto.', '2016-02-05', 'CyberConnect2', 8.9, 3, 44.99, '../public/assets/home/jogos/naruto-storm-4.jpg'),
('Middle Earth Shadow of War Definitve Edition', 'Jogo de ação e aventura ambientado no universo de O Senhor dos Anéis.', '2017-10-10', 'Monolith Productions', 9.1, 1, 19.99, '../public/assets/home/jogos/shadow-of-war-definitive.jpg'),
('Duke Nukem 3D World Tour', 'Remasterização do clássico jogo de tiro em primeira pessoa.', '2016-10-11', 'Nerve Software', 8.2, 1, 14.99, '../public/assets/home/jogos/duke-nukem-3d.jpg'),
('Lego DC Super Villains Deluxe Edition', 'Jogo LEGO que permite que os jogadores controlem vilões da DC Comics.', '2018-10-16', 'TT Games', 8.6, 4, 34.99, '../public/assets/home/jogos/lego-super-villains.jpg'),
('Nioh Complete Edition', 'Jogo de ação e RPG situado no Japão feudal.', '2017-11-07', 'Team Ninja', 8.8, 3, 49.99, '../public/assets/home/jogos/nioh.jpg'),
('Minecraft Java', 'Jogo sandbox que permite construção e exploração.', '2011-11-18', 'Mojang', 9.0, 3, 29.99, '../public/assets/home/jogos/minecraft-java-bedrock.jpg'),
('Tekken 8 Ultimate Edition', 'Jogo de luta da série Tekken.', 'Em desenvolvimento', 'Bandai Namco Entertainment', 7.5, 1, 59.99, '../public/assets/home/jogos/tekken-8.jpg'),
('Street Fighter 6', 'Próximo jogo da famosa série de luta Street Fighter.', '2023-06-02', 'Capcom', 9.7, 1, 49.99, '../public/assets/home/jogos/street-fighter-6.jpg'),
('Lego Batman 3 Beyond Gotham Premium Edition', 'Jogo LEGO que segue as aventuras do Batman no espaço.', '2014-11-11', 'TT Games', 8.5, 4, 24.99, '../public/assets/home/jogos/lego-batman-3.jpg'),
('Mortal Kombat X Premium Edition', 'Jogo de luta da série Mortal Kombat.', '2015-04-14', 'NetherRealm Studios', 9.3, 1, 39.99, '../public/assets/home/jogos/mortal-kombat-x.jpg'),
('Super Mario RPG', 'RPG da série Mario com elementos de ação.', '1996-03-09', 'Square', 9.1, 4, 19.99, '../public/assets/home/jogos/super-mario-rpg.jpg'),
('Eiyuden Chronicle', 'RPG clássico desenvolvido por veteranos da série Suikoden.', 'Em desenvolvimento', 'Rabbit & Bear', 8.7, 49.99, '../public/assets/home/jogos/eiyuden-chronicle.jpg'),
('Lego Marvel Super Heroes 2 Deluxe Edition', 'Jogo LEGO com super-heróis da Marvel.', '2017-11-14', 'TT Games', 8.4, 4, 59.99, '../public/assets/home/jogos/lego_marvel_super_heroes_2_deluxe_edition.jpg'),
('Lego Star Wars Skywalker Saga', 'Jogo LEGO que abrange a saga completa de Star Wars.', 'Em desenvolvimento', 'TT Games', 7.5, 4, 49.99, '../public/assets/home/jogos/lego_star_wars_skywalker_saga.jpg'),
('Lego Marvel Super Heroes 2', 'Jogo LEGO com super-heróis da Marvel.', '2017-11-14', 'TT Games', 8.4, 4, 59.99, '../public/assets/home/jogos/lego_marvel_super_heroes_2.jpg'),
('Hogwarts Legacy Deluxe Edition', 'RPG ambientado no mundo de Harry Potter.', '2022-10-28', 'Portkey Games', 9.5, 4, 69.99, '../public/assets/home/jogos/hogwarts_legacy_deluxe_edition.jpg'),
('Lego Indiana Jones', 'Jogo LEGO baseado na série de filmes Indiana Jones.', '2008-06-03', 'Traveller''s Tales', 8.2, 4, 54.99, '../public/assets/home/jogos/lego_indiana_jones.jpg'),
('Batman Arkham City GOTY Edition', 'Edição do Jogo do Ano do Batman Arkham City.', '2012-09-07', 'Rocksteady Studios', 9.2, 2, 49.99, '../public/assets/home/jogos/batman_arkham_city_goty_edition.jpg'),
('Lego Avengers Deluxe Edition', 'Jogo LEGO baseado na equipe de super-heróis Avengers.', '2016-01-26', 'TT Games', 8.3, 4, 59.99, '../public/assets/home/jogos/lego_avengers_deluxe_edition.jpg'),
('Pure Farming 2018 Deluxe Edition', 'Simulador de agricultura com edição de luxo.', '2018-03-13', 'Ice Flames', 7.5, 2, 49.99, '../public/assets/home/jogos/pure_farming_2018_deluxe_edition.jpg'),
('One Punch Man Deluxe Edition', 'Jogo baseado no anime One Punch Man.', '2020-02-27', 'Spike Chunsoft', 7.8, 1, 54.99, '../public/assets/home/jogos/one_punch_man_deluxe_edition.jpg'),
('Gangs of Sherwood', 'Jogo de estratégia com temática de Robin Hood.', '2022-04-26', 'Atomic Wolf', 7.5, 2, 49.99, '../public/assets/home/jogos/gangs_of_sherwood.jpg'),
('Naruto Storm Generation Deluxe Edition', 'Jogo de luta baseado na série Naruto.', '2012-02-23', 'CyberConnect2', 8.6, 3, 59.99, '../public/assets/home/jogos/naruto_storm_generation_deluxe_edition.jpg'),
('Super Mario Bros. Wonder', 'Versão moderna do clássico Super Mario Bros.', 'Em desenvolvimento', 'Nintendo', 7.5, 4, 49.99, '../public/assets/home/jogos/super_mario_bros_wonder.jpg'),
('Call of Duty Modern Warfare 3', 'Jogo de tiro em primeira pessoa da série Call of Duty.', '2011-11-08', 'Infinity Ward', 9.0, 1, 59.99, '../public/assets/home/jogos/call_of_duty_modern_warfare_3.jpg');

-- Exibindo os dados após a inserção
SELECT * FROM Jogo;
