
create database nodeGameTeste;
use nodeGameTeste;


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
    jogosTipo VARCHAR(100),
    jogosCategories VARCHAR(100),
    jogosPlataforma INT,
    jogosPrice INT,
    jogosImg VARCHAR(255),
    FOREIGN KEY (jogosPlataforma) REFERENCES Plataforma (plataformaID)
);



-- Tabela Chaves
CREATE TABLE Chaves (
    chavesID BIGINT PRIMARY KEY
);

-- Tabela ChavesJogos
CREATE TABLE ChavesJogos (
    chavesID BIGINT,
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


INSERT INTO Jogo (jogosNome, jogosDescricao, jogosLancamento, jogosDesenvolvedora, jogosNota, jogosPlataforma, jogosPrice, jogosImg,jogosTipo,jogosCategories)  
VALUES 
('Dragon Ball Fighter Z', 'Libere o poder dos Saiyajins neste incrível jogo de luta ambientado no universo Dragon Ball. Combates intensos, gráficos deslumbrantes e ação ininterrupta. Prepare-se para a batalha!', '2018-01-26', 'Arc System Works', 8.0, 3, 60, '/assets/home/jogos/dragonball-fighter-z.jpg','jogo', 'Luta'),

('Dying Light Definitive Edition', 'Enfrente hordas de zumbis em um mundo pós-apocalíptico. Sobreviva usando suas habilidades e explore um ambiente tenso e imersivo. A edição definitiva traz ainda mais emoção ao gameplay.', '2015-01-27', 'Techland', 9.0, 2, 40, '/assets/home/jogos/dying-light-definitive.jpg','jogo', 'Ação'),

('Hogwarts Legacy', 'Viva a magia de Harry Potter como nunca antes em um RPG envolvente. Explore o mundo mágico, aprenda feitiços poderosos e embarque em uma jornada épica em Hogwarts. Uma experiência única para os fãs!', '2022-10-28', 'Portkey Games', 9.5, 4, 150, '/assets/home/jogos/hogwarts-legacy-deluxe.jpg','jogo', 'Aventura'),

('Mortal Kombat 11', 'Entre no ringue e prove ser o melhor lutador em Mortal Kombat 11. Combates brutais, personagens icônicos e gráficos impressionantes tornam este jogo uma experiência inesquecível para os amantes de luta.', '2019-04-23', 'NetherRealm Studios', 9.2, 1, 30, '/assets/home/jogos/mk-11.jpg','jogo', 'Luta'),

('Batman Arkham Knight', 'Assuma o papel do Cavaleiro das Trevas em Gotham City. Combata criminosos, resolva mistérios e vivencie a conclusão épica da trilogia Arkham. Uma aventura intensa e sombria para os fãs do Batman.', '2015-06-23', 'Rocksteady Studios', 9.4, 2, 120, '/assets/home/jogos/batman-arkham.jpg','jogo', 'Fantasia'),

('Injustice 2 Legendary Edition', 'Reúna os heróis e vilões da DC Comics em batalhas épicas. Com um elenco diversificado e poderes extraordinários, Injustice 2 Legendary Edition oferece uma experiência de luta única e emocionante.', '2017-05-16', 'NetherRealm Studios', 8.8, 1, 35, '/assets/home/jogos/injustice-2-legendary.jpg','DLC', 'Luta'),

('Baldurs Gate 3', 'Explore os reinos esquecidos em um RPG épico baseado na série Dungeons & Dragons. Com gráficos impressionantes e escolhas significativas, Baldurs Gate 3 leva a experiência de RPG a novos patamares.', '2023-09-29', 'Larian Studios', 9.8, 3, 350, '/assets/home/jogos/baldur-gate-3.jpg','jogo', 'Fantasia'),

('Lego Harry Potter Collection', 'Reviva a magia de Hogwarts com LEGO. Explore os oito filmes da saga Harry Potter em uma coletânea divertida e cheia de humor. Uma jornada encantadora para fãs de todas as idades.', '2020-10-30', 'TT Games', 8.7, 4, 40, '/assets/home/jogos/lego-harry-potter-collection.jpg','jogo', 'Fantasia'),

('Batman Arkham Collection', 'Experimente a trilogia definitiva do Cavaleiro das Trevas com Batman Arkham Collection. Incluindo Arkham Asylum, Arkham City e Arkham Knight, esta coleção é uma homenagem aos fãs do Batman.', '2019-09-06', 'Rocksteady Studios', 9.6, 2, 30, '/assets/home/jogos/batman-arkham-collection.jpg','jogo', 'Ação'),

('Injustice Gods Among Us Ultimate Edition', 'Testemunhe batalhas épicas entre heróis e vilões da DC Comics. Com visuais deslumbrantes e um elenco diversificado, Injustice Gods Among Us Ultimate Edition é um must-have para fãs de luta.', '2013-11-12', 'NetherRealm Studios', 8.5, 1, 25, '/assets/home/jogos/injustice-gods-among-us.jpg','DLC', 'Luta'),

('Naruto Ultimate Ninja Storm 4 Road to Boruto', 'Entre no universo ninja de Naruto em batalhas espetaculares. Com gráficos incríveis e uma narrativa envolvente, este jogo é uma ode aos fãs da série.', '2016-02-05', 'CyberConnect2', 8.9, 3, 145, '/assets/home/jogos/naruto-storm-4.jpg','DLC', 'Luta'),

('Middle Earth Shadow of War Definitive Edition', 'Explore o épico universo de O Senhor dos Anéis em ação e aventura. A edição definitiva traz todo o conteúdo adicional, aprimorando ainda mais a experiência do jogador.', '2017-10-10', 'Monolith Productions', 9.1, 1, 20, '/assets/home/jogos/shadow-of-war-definitive.jpg','jogo', 'Fantasia'),

('Duke Nukem 3D World Tour', 'Reviva o clássico jogo de tiro em primeira pessoa com gráficos aprimorados. Duke Nukem 3D World Tour é uma homenagem aos fãs do gênero FPS e uma oportunidade de redescobrir a ação explosiva.', '2016-10-11', 'Nerve Software', 8.2, 1, 65, '/assets/home/jogos/duke-nukem-3d.jpg','jogo', 'Ação'),

('Lego DC Super Villains Deluxe Edition', 'Assuma o controle dos vilões mais icônicos da DC Comics em uma jornada LEGO divertida e cheia de surpresas. Com um elenco diversificado, esta edição deluxe é um convite para a diversão.', '2018-10-16', 'TT Games', 8.6, 4, 35, '/assets/home/jogos/lego-super-villains.jpg','jogo', 'Fantasia'),

('Nioh Complete Edition', 'Mergulhe no Japão feudal com Nioh Complete Edition. Combates intensos, inimigos desafiadores e uma narrativa envolvente tornam este jogo uma experiência única para os fãs de ação e RPG.', '2017-11-07', 'Team Ninja', 8.8, 3, 50, '/assets/home/jogos/nioh.jpg','jogo', 'Hack and Slash'),

('Minecraft Java', 'Desperte sua criatividade com Minecraft Java. Construa, explore e sobreviva em um mundo pixelizado. Com infinitas possibilidades, este jogo é uma jornada única para os amantes da construção.', '2011-11-18', 'Mojang', 9.0, 3, 100, '/assets/home/jogos/minecraft-java-bedrock.jpg','jogo', 'Ação'),

('Tekken 8 Ultimate Edition', 'Prepare-se para a próxima evolução da série Tekken. Com novos lutadores, arenas e mecânicas aprimoradas, Tekken 8 Ultimate Edition é um convite para os fãs de luta embarcarem em uma jornada épica.', '2023-11-28', 'Bandai Namco Entertainment', 7.5, 1, 260, '/assets/home/jogos/tekken-8.jpg','jogo', 'Luta'),

('Street Fighter 6', 'A lenda da luta retorna com Street Fighter 6. Com gráficos de última geração e um elenco estelar, este jogo promete redefinir a experiência de luta. Junte-se à batalha e mostre suas habilidades!', '2023-06-02', 'Capcom', 9.7, 1, 350, '/assets/home/jogos/street-fighter-6.jpg','jogo', 'Luta'),

('Lego Batman 3 Beyond Gotham Premium Edition', 'Leve o Cavaleiro das Trevas para o espaço em LEGO. Com uma trama envolvente e muitos personagens divertidos, esta edição premium é uma adição imperdível para os fãs de LEGO e Batman.', '2014-11-11', 'TT Games', 8.5, 4, 25, '/assets/home/jogos/lego-batman-3.jpg','pacote', 'Fantasia'),

('Mortal Kombat X Premium Edition', 'A brutalidade está de volta em Mortal Kombat X. Com fatalities incríveis e um elenco expandido, a edição premium oferece ainda mais conteúdo para os fãs de luta. Prepare-se para a carnificina!', '2015-04-14', 'NetherRealm Studios', 9.3, 1, 40, '/assets/home/jogos/mortal-kombat-x.jpg','pacote', 'Luta'),

('Super Mario RPG', 'Reviva a nostalgia com Super Mario RPG. Uma mistura perfeita de ação e RPG, este clássico da série Mario oferece uma jornada encantadora repleta de personagens adoráveis e desafios divertidos.', '1996-03-09', 'Square', 9.1, 4, 320, '/assets/home/jogos/super-mario-rpg.jpg','jogo', 'Aventura'),

('Eiyuden Chronicle', 'Viaje de volta aos RPGs clássicos com Eiyuden Chronicle. Desenvolvido por veteranos da série Suikoden, este jogo promete uma narrativa envolvente e personagens inesquecíveis. Uma ode aos amantes de RPG.', '2023-10-16', 'Rabbit & Bear', 8.7,2, 250, '/assets/home/jogos/eiyuden-chronicle.jpg','jogo', 'Fantasia'),

('Lego Marvel Super Heroes 2 Deluxe Edition', 'Junte-se aos super-heróis da Marvel em uma aventura LEGO épica. Com um elenco vasto e humor característico, esta edição deluxe é perfeita para fãs de LEGO e quadrinhos.', '2017-11-14', 'TT Games', 8.4, 4, 60, '/assets/home/jogos/lego-marvel-super-heroes-2.jpg','assinatura', 'Aventura'),

('Lego Star Wars Skywalker Saga', 'Reviva a saga completa de Star Wars em LEGO. Com novos gráficos e missões emocionantes, esta edição é uma celebração da galáxia muito, muito distante. Que a Força esteja com você!', '2022-04-08', 'TT Games', 7.5, 4, 50, '/assets/home/jogos/lego-star-wars-skywalker-saga.jpg','jogo', 'Aventura'),

('Lego Marvel Super Heroes 2', 'Explore o universo Marvel de uma maneira única em LEGO. Com missões empolgantes e personagens adoráveis, este jogo é uma homenagem à grandeza dos super-heróis em uma versão LEGO.', '2017-11-14', 'TT Games', 8.4, 4, 60, '/assets/home/jogos/lego-marvel-super-heroes-2.jpg','jogo', 'Ação'),

('Lego Indiana Jones', 'Reviva as aventuras do intrépido arqueólogo em LEGO. Com humor característico e quebra-cabeças divertidos, este jogo é uma homenagem à série de filmes Indiana Jones de uma maneira única.', '2008-06-03', 'Traveller''s Tales', 8.2, 4, 55, '/assets/home/jogos/lego-indiana-jones.jpg','jogo', 'Ação'),

('Batman Arkham City GOTY Edition', 'Experimente a obra-prima do Cavaleiro das Trevas com a Edição do Jogo do Ano de Batman Arkham City. Com gráficos aprimorados e todo o conteúdo adicional, esta edição é indispensável para os fãs de Batman.', '2012-09-07', 'Rocksteady Studios', 9.2, 2, 50, '/assets/home/jogos/batman-arkham-knight.jpg','assinatura', 'Ação'),

('Lego Avengers Deluxe Edition', 'Junte-se aos heróis mais poderosos da Terra em LEGO. Com missões emocionantes e personagens icônicos, esta edição deluxe é uma celebração da grandiosidade dos Vingadores em uma versão LEGO.', '2016-01-26', 'TT Games', 8.3, 4, 60, '/assets/home/jogos/lego-avengers.jpg','assinatura', 'Ação'),

('Pure Farming 2018 Deluxe Edition', 'Viva a experiência agrícola definitiva com Pure Farming 2018 Deluxe Edition. Com gráficos incríveis e uma variedade de culturas, esta edição de luxo oferece uma imersão total na vida rural.', '2018-03-13', 'Ice Flames', 7.5, 2, 50, '/assets/home/jogos/pure-farming-2018-deluxe.jpg','jogo', 'Fantasia'),

('One Punch Man Deluxe Edition', 'Assuma o papel do herói mais poderoso em One Punch Man Deluxe Edition. Explore um mundo repleto de desafios e vilões, utilizando superpoderes incríveis para derrotar seus inimigos em combates épicos. Com gráficos de alta qualidade e uma narrativa envolvente, esta edição deluxe oferece conteúdos exclusivos e uma experiência completa para os fãs de anime e ação.', '2020-02-27', 'Spike Chunsoft', 7.8, 1, 185, '/assets/home/jogos/one-punch-man-deluxe.jpg','jogo', 'Luta'),

('Gangs of Sherwood', 'Embarque em uma emocionante jornada estratégica com Gangs of Sherwood. Este jogo transporta você para a lendária floresta de Sherwood, onde você lidera sua gangue na luta contra a injustiça. Utilize táticas astutas, recrute aliados habilidosos e desafie o xerife corrupto para restaurar a justiça. Gráficos envolventes e jogabilidade estratégica fazem deste título uma experiência única para os amantes de estratégia e aventura.', '2022-04-26', 'Atomic Wolf', 7.5, 2, 250, '/assets/home/jogos/gangs-of-sherwood.jpg','jogo', 'Fantasia'),

('Naruto Storm Generation Deluxe Edition', 'Reviva as emocionantes batalhas da série Naruto em Naruto Storm Generation Deluxe Edition. Com gráficos aprimorados e conteúdos exclusivos, este jogo de luta oferece uma experiência completa para os fãs da franquia. Escolha seu ninja favorito, domine técnicas poderosas e participe de confrontos épicos. A Deluxe Edition inclui extras especiais para enriquecer ainda mais sua jornada ninja.', '2012-02-23', 'CyberConnect2', 8.6, 3, 160, '/assets/home/jogos/naruto-storm-generation.jpg','pacote', 'Luta'),

('Super Mario Bros. Wonder', 'Explore uma reimaginação moderna do clássico Super Mario Bros. em Super Mario Bros. Wonder. Com visuais deslumbrantes e novos desafios, esta versão oferece uma experiência nostálgica com um toque contemporâneo. A jornada épica do Mario ganha vida com gráficos atualizados e mecânicas inovadoras. Prepare-se para se encantar novamente com o encanador mais famoso dos videogames.', '2023-10-15', 'Nintendo', 7.5, 4, 350, '/assets/home/jogos/super-mario-wonder.jpg','jogo', 'Aventura'),

('Call of Duty Modern Warfare 3', 'Entre no campo de batalha em Call of Duty: Modern Warfare 3. Como soldado de elite, você enfrentará desafios intensos em um dos jogos mais icônicos da série. Com gráficos realistas e uma narrativa envolvente, Modern Warfare 3 oferece uma experiência de tiro em primeira pessoa inigualável. Prepare-se para a ação frenética e missões emocionantes neste título aclamado pela crítica.', '2011-11-08', 'Infinity Ward', 9.0, 1, 259, '/assets/home/jogos/cod-modern-warfare-3.jpg','jogo', 'FPS'),

('Tales of Arise', 'Embarque em uma jornada épica com Tales of Arise, o mais recente capítulo da renomada série de RPG. Com gráficos deslumbrantes, uma história envolvente e personagens cativantes, este jogo leva você a um mundo rico em detalhes e mistérios. Descubra habilidades únicas, enfrente inimigos formidáveis e mergulhe em um universo vibrante com Tales of Arise.', '2021-09-10', 'Bandai Namco Entertainment', 8.5, 2, 269, '/assets/home/jogos/tales-of-arise.jpg','jogo', 'Fantasia'),

('SpellForce 3', 'Explore o mundo de SpellForce 3, um jogo que combina estratégia em tempo real e elementos de RPG. Lidere seu exército em batalhas épicas, desenvolva suas habilidades mágicas e descubra um enredo envolvente. Com gráficos impressionantes e mecânicas de jogo inovadoras, SpellForce 3 oferece uma experiência única para os fãs de estratégia e RPG.', '2017-12-07', 'Grimlore Games, THQ Nordic', 7.5, 3, 39, '/assets/home/jogos/spellforce-3.jpg','jogo', 'Ação'),

('My Hero Academia 2', 'Entre no mundo de My Hero Academia 2 e descubra a emoção de lutar com superpoderes. Baseado no popular anime, este jogo permite que você controle seu herói favorito em combates intensos. Desenvolva suas habilidades, enfrente vilões poderosos e mergulhe em uma narrativa emocionante. Com gráficos vibrantes e jogabilidade envolvente, esta é a experiência definitiva para os fãs de My Hero Academia.', '2022-10-28', 'Bandai Namco Entertainment', 8.0, 4, 50, '/assets/home/jogos/my-hero-academia-2.jpg','jogo', 'Luta'),

('Batman Arkham Collection', 'Experimente a trilogia épica do Cavaleiro das Trevas com a Batman Arkham Collection. Incluindo Arkham Asylum, Arkham City e Arkham Knight, esta coleção oferece uma jornada completa pelo mundo sombrio e perigoso do Batman. Com gráficos aprimorados, jogabilidade cativante e uma história imersiva, esta é a oportunidade perfeita para se tornar o Batman e enfrentar os maiores desafios de Gotham.', '2015-11-25', 'Rocksteady Studios, WB Games', 9.5, 4, 80, '/assets/home/jogos/batman-arkham-collection.jpg', 'assinatura','Ação');





-- Inserindo chaves para os jogos restantes
INSERT INTO Chaves (chavesID)
VALUES 
    (101000000001),
    (102000000002),
    (103000000003),
    (104000000004),
    (105000000005),
    (106000000006),
    (107000000007),
    (108000000008),
    (109000000009),
    (110000000010),
    (111000000011),
    (112000000012),
    (113000000013),
    (114000000014),
    (115000000015),
    (116000000016),
    (117000000017),
    (118000000018),
    (119000000019),
    (120000000020),
    (121000000021),
    (122000000022),
    (123000000023),
    (124000000024),
    (125000000025),
    (126000000026),
    (127000000027),
    (128000000028),
    (129000000029),
    (130000000030),
    (131000000031),
    (132000000032),
    (133000000033),
    (134000000034),
    (135000000006), -- Chaves para Tales of Arise
    (136000000006), -- Chaves para SpellForce 3
    (137000000006), -- Chaves para My Hero Academia 2
    (138000000006); -- Chaves para Batman Arkham Collection


    -- Associando chaves aos jogos restantes
-- Associações entre as chaves e os jogos na tabela ChavesJogos
INSERT INTO ChavesJogos (chavesID, jogosID)
VALUES 
    (101000000001, 1),    -- Dragon Ball Fighter Z
    (102000000002, 2),    -- Dying Light Definitive Edition
    (103000000003, 3),    -- Hogwarts Legacy
    (104000000004, 4),    -- Mortal Kombat 11
    (105000000005, 5),    -- Batman Arkham Knight
    (106000000006, 6),    -- Injustice 2 Legendary Edition
    (107000000007, 7),    -- Baldurs Gate 3
    (108000000008, 8),    -- Lego Harry Potter Collection
    (109000000009, 9),    -- Batman Arkham Collection
    (110000000010, 10),   -- Injustice Gods Among Us Ultimate Edition
    (111000000011, 11),   -- Naruto Ultimate Ninja Storm 4 Road to Boruto
    (112000000012, 12),   -- Middle Earth Shadow of War Definitive Edition
    (113000000013, 13),   -- Duke Nukem 3D World Tour
    (114000000014, 14),   -- Lego DC Super Villains Deluxe Edition
    (115000000015, 15),   -- Nioh Complete Edition
    (116000000016, 16),   -- Minecraft Java
    (117000000017, 17),   -- Tekken 8 Ultimate Edition
    (118000000018, 18),   -- Street Fighter 6
    (119000000019, 19),   -- Lego Batman 3 Beyond Gotham Premium Edition
    (120000000020, 20),   -- Mortal Kombat X Premium Edition
    (121000000021, 21),   -- Super Mario RPG
    (122000000022, 22),   -- Eiyuden Chronicle
    (123000000023, 23),   -- Lego Marvel Super Heroes 2 Deluxe Edition
    (124000000024, 24),   -- Lego Star Wars Skywalker Saga
    (125000000025, 25),   -- Lego Marvel Super Heroes 2
    (126000000026, 26),   -- Lego Indiana Jones
    (127000000027, 27),   -- Batman Arkham City GOTY Edition
    (128000000028, 28),   -- Lego Avengers Deluxe Edition
    (129000000029, 29),   -- Pure Farming 2018 Deluxe Edition
    (130000000030, 30),   -- One Punch Man Deluxe Edition
    (131000000031, 31),   -- Gangs of Sherwood
    (132000000032, 32),   -- Naruto Storm Generation Deluxe Edition
    (133000000033, 33),   -- Super Mario Bros. Wonder
    (134000000034, 34),   -- Call of Duty Modern Warfare 3
    (135000000006, 35), -- Associação para Tales of Arise
    (136000000006, 36), -- Associação para SpellForce 3
    (137000000006, 37), -- Associação para My Hero Academia 2
    (138000000006, 38); -- Associação para Batman Arkham Collection

select jogosNome, jogosDescricao , jogosPrice from Jogo join ChavesJogos on Jogo.jogosID = ChavesJogos.jogosId where Jogo.jogosPrice < 100;