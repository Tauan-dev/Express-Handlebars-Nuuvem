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
  });
});

app.get("/catalog", (req, res) => {
  //card

  const sql = `SELECT jogosNome , jogosPrice, jogosImg FROM Jogo `;

  conn.query(sql, (err, data) => {
    if (err) {
      console.log(err);
      return;
    }

    const jogo = [0];
  });
  res.render("catalogo", {
    style: "catalogo.css",
  });
});

app.post("/user/insertuser", (req, res) => {
  const name = req.body.name;
  const surname = req.body.surname;
  const adress = req.body.adress;
  const email = req.body.email;
  const password = req.body.password;

  const sql = `INSERT INTO user (userName,userSurname,userAdress, userEmail, userPassword) VALUES ('${name}','${surname}','${adress}', '${email}','${password}') `;

  conn.query(sql, (err) => {
    if (err) {
      console.log(err);
      return;
    }
    res.redirect("/");
    console.log("User Inserted");
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
