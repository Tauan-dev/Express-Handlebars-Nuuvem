const express = require("express");
const exphbs = require("express-handlebars");
const mysql = require("mysql");

const app = express();

//configurar o express pra pegar o body
app.use(express.urlencoded({ extended: true }));

//pega o body pego em formato json
app.use(express.json());

const hbs = exphbs.create({});
app.engine("handlebars", hbs.engine); // Alteração aqui
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

//   ############### CATALOGO  ###############

app.get("/catalog", (req, res) => {
  const sql = `SELECT jogosNome , jogosPrice, jogosImg ,jogosPlataforma FROM Jogo `;

  conn.query(sql, (err, data) => {
    if (err) {
      console.log(err);
      return;
    }

    const jogo = data;

    console.log(jogo);

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

  const sql = `SELECT jogosNome, jogosPrice, jogosImg ,jogosPlataforma FROM Jogo JOIN Plataforma ON Jogo.jogosPlataforma = Plataforma.plataformaID WHERE Plataforma.plataformaID = '${id}'`;

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
  const sql = `SELECT jogosNome, jogosPrice, jogosImg, jogosPlataforma, jogosTipo FROM Jogo WHERE jogosTipo = '${tipo}'`;

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

  const sql = `SELECT jogosNome, jogosPrice, jogosImg, jogosPlataforma, jogosTipo FROM Jogo WHERE jogosCategories = '${category}'`;

  const sqlCount = `SELECT jogosCategories, COUNT(*) AS TotalJogos FROM Jogo WHERE jogosCategories = '${category}' GROUP BY jogosCategories`;

  const categoryname = category;

  conn.query(sql, (err, data) => {
    if (err) {
      console.log(err);
      return;
    }

    // Resultado da primeira consulta (detalhes dos jogos)
    const jogos = data;

    // Executar a segunda consulta para obter o número total de jogos por categoria
    conn.query(sqlCount, (err, countData) => {
      if (err) {
        console.log(err);
        return;
      }

      const countResult = countData[0] || { TotalJogos: 0 };

      console.log(countResult);

      res.render("category", {
        jogos: jogos,
        totalJogos: countResult.TotalJogos,
        style: "category.css",
        about: "Category",
        categoryName: categoryname,
      });
    });
  });
});

//  ############### DESENVOLVEDORA  ###############

app.get("/catalog/development/:desenvolvedora", (req, res) => {
  const desenvolvedora = req.params.desenvolvedora;
  console.log(desenvolvedora);
  const sql = `SELECT jogosNome, jogosPrice, jogosImg, jogosPlataforma, jogosTipo FROM Jogo WHERE jogosDesenvolvedora = '${desenvolvedora}'`;

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

app.post("/user/register", (req, res) => {
  const name = req.body.name;
  const surname = req.body.surname;
  const adress = req.body.adress;
  const email = req.body.email;
  const password = req.body.password;

  const sql = `INSERT INTO user (userName,userSurname,userAddress, userEmail, userPassword) VALUES ('${name}','${surname}','${adress}', '${email}','${password}') `;

  conn.query(sql, (err) => {
    if (err) {
      console.log(err);
      return;
    }
    console.log("User Inserted");
    res.redirect("/");
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

    // Inicia a aplicação após a conexão bem-sucedida
    app.listen(3000, () => {
      console.log("App funcionando");
    });
  }
});

// Tratamento de erros de conexão
conn.on("error", (err) => {
  console.error("Erro de conexão com o MySQL:", err);
});
