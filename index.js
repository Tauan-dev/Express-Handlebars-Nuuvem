const express = require("express");
const exphbs = require("express-handlebars");
const mysql = require("mysql");

const app = express();

app.use(express.urlencoded({ extended: true }));

app.use(express.json());

const hbs = exphbs.create({});
app.engine("handlebars", hbs.engine);
app.set("view engine", "handlebars");

app.use(express.static("public"));

app.use(express.static("node_modules/bootstrap/dist"));

app.get("/", (req, res) => {
  res.render("home", {
    style: "home.css",
    about: "Home",
  });
});

app.get("/register", (req, res) => {
  res.render("register", {
    style: "register.css",
    about: "Register",
  });
});

app.get("/carrinho", (req, res) => {
  res.render("carrinho", {
    style: "carrinho.css",
    about: "Carrinho",
  });
});

app.get("/login", (req, res) => {
  res.render("login", {
    style: "login.css",
    about: "Login",
  });
});

//   ############### CATALOGO  ###############

app.get("/catalog", (req, res) => {
  const sql = `SELECT jogosID, jogosNome , jogosPrice, jogosImg ,jogosPlataforma FROM Jogo `;

  conn.query(sql, (err, data) => {
    if (err) {
      console.log(err);
      return;
    }

    const jogo = data;

    res.render("catalog", {
      jogo: jogo,
      style: "catalog.css",
      about: "Catalog",
    });
  });
});

// ###############  PLATAFORMA  ###############

app.get("/catalog/:id", (req, res) => {
  const id = req.params.id;

  const sql = `SELECT jogosID, jogosNome, jogosPrice, jogosImg ,jogosPlataforma FROM Jogo JOIN Plataforma ON Jogo.jogosPlataforma = Plataforma.plataformaID WHERE Plataforma.plataformaID = '${id}'`;

  conn.query(sql, (err, data) => {
    if (err) {
      console.log(err);
      return;
    }

    jogo = data;

    res.render("plataform", {
      jogos: jogo,
      style: "plataform.css",
    });
  });
});

//  ###############  TIPO  ###############

app.get("/catalog/tipo/:tipo", (req, res) => {
  const tipo = req.params.tipo;
  console.log(`Request for /catalog/tipo/${tipo}`);
  const sql = `SELECT jogosID, jogosNome, jogosPrice, jogosImg, jogosPlataforma, jogosTipo FROM Jogo WHERE jogosTipo = '${tipo}'`;

  conn.query(sql, (err, data) => {
    if (err) {
      console.log(err);
      return;
    }

    jogo = data;

    res.render("type", {
      jogos: jogo,
      style: "type.css",
      about: "Game type",
    });
  });
});

// ###############  CATEGORIA  ###############

app.get("/catalog/category/:category", (req, res) => {
  const category = req.params.category;

  const sql = `
    SELECT 
      jogosID, 
      jogosNome, 
      jogosPrice, 
      jogosImg, 
      jogosPlataforma, 
      jogosTipo,
      COUNT(*) OVER () AS TotalJogos 
    FROM 
      Jogo 
    WHERE 
      jogosCategories = '${category}'`;

  conn.query(sql, (err, data) => {
    if (err) {
      console.log(err);
      return;
    }

    const jogos = data;

    res.render("category", {
      jogos: jogos,
      totalJogos: jogos.length > 0 ? jogos[0].TotalJogos : 0,
      style: "category.css",
      about: "Category",
      categoryName: category,
    });
  });
});

//  ############### DESENVOLVEDORA  ###############

app.get("/catalog/development/:desenvolvedora", (req, res) => {
  const desenvolvedora = req.params.desenvolvedora;
  console.log(desenvolvedora);
  const sql = `SELECT jogosID, jogosNome, jogosPrice, jogosImg, jogosPlataforma, jogosTipo FROM Jogo WHERE jogosDesenvolvedora = '${desenvolvedora}'`;

  conn.query(sql, (err, data) => {
    if (err) {
      console.log(err);
      return;
    }
    const jogo = data;

    console.log(jogo);

    res.render("development", {
      jogos: jogo,
      style: "development.css",
      about: "Development",
    });
  });
});

app.get("/catalog/price/:price", (req, res) => {
  const price = req.params.price;

  const sql = `SELECT jogosID, jogosNome, jogosPrice, jogosImg, jogosPlataforma, jogosTipo 
               FROM Jogo 
               WHERE jogosPrice < ${price}`;

  conn.query(sql, (err, data) => {
    if (err) {
      console.log(err);
      return;
    }

    const jogos = data;

    res.render("price", {
      jogos: jogos,
      style: "price.css",
      about: "Price",
    });
  });
});

// ############## JOGO #############

app.get("/game/:id", (req, res) => {
  const id = req.params.id;

  const sql = `SELECT jogosID, jogosNome, jogosPrice, jogosImg, jogosPlataforma, jogosTipo , jogosDescricao ,jogosLancamento, jogosDesenvolvedora,jogosCategories, jogosTrailer
               FROM Jogo WHERE jogosID = '${id}'`;

  conn.query(sql, (err, data) => {
    if (err) {
      console.log(err);
      return;
    }

    if (data.length === 0) {
      // Não há correspondência para o ID fornecido
      res.status(404).send("Jogo não encontrado");
      return;
    }

    const jogo = data[0];

    res.render("game", {
      jogo: jogo,
      style: "game.css",
      about: "Game",
    });
  });
});

// ##### INSERT USER #####
app.post("/user/register", (req, res) => {
  const name = req.body.name;
  const surname = req.body.surname;
  const adress = req.body.adress;
  const email = req.body.email;
  const password = req.body.password;

  // Verificar se o usuário já existe
  const checkDuplicateSql = `SELECT COUNT(*) AS count FROM user WHERE userEmail = '${email}'`;

  conn.query(checkDuplicateSql, (err, result) => {
    if (err) {
      console.log(err);
      return res.status(500).send("Erro interno do servidor");
    }

    const count = result[0].count;

    if (count === 0) {
      // O email não existe, então podemos inserir o novo usuário
      const insertSql = `INSERT INTO user (userName, userSurname, userAddress, userEmail, userPassword) VALUES ('${name}', '${surname}', '${adress}', '${email}', '${password}')`;

      conn.query(insertSql, (err) => {
        if (err) {
          console.log(err);
          return res.status(500).send("Erro interno do servidor");
        }

        console.log("Usuário inserido com sucesso");
        res.redirect("/");
      });
    } else {
      console.log("Usuário com este email já existe.");

      res.status(400).send("Usuário com este email já existe.");
    }
  });
});

// ###################### INSERT NO CARRINHO ####################

app.post("/insert/carrinho", (req, res) => {
  const id = req.body.id;

  const sql = `INSERT INTO CarrinhoJogo (carrinhoID, jogoID) VALUES (1, ${id})`;

  conn.query(sql, (err) => {
    if (err) {
      console.log(err);
      return res.status(500).send("Erro ao inserir jogo no carrinho");
    }
    console.log("Jogo inserido com sucesso no carrinho");
    res.redirect("/catalog");
  });
});

// conexão mysql
const conn = mysql.createConnection({
  host: "localhost",
  port: 3307,
  user: "root",
  password: "tauan198",
  database: "nodegameteste",
});

conn.connect((err) => {
  if (err) {
    console.error("Erro ao conectar ao MySQL:", err);
  } else {
    console.log("Conectou ao MySQL");

    app.listen(3000, () => {
      console.log("App funcionando");
    });
  }
});

conn.on("error", (err) => {
  console.error("Erro de conexão com o MySQL:", err);
});
