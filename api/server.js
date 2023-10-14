const express = require("express");
const bodyParser = require("body-parser");
const api = express();
const cors = require("cors");
const jwt = require("jsonwebtoken");
require("dotenv").config();

const PORT = 8080;

const login = require("./routers/login.js");
const register = require("./routers/register.js");

// Permet de récupérer des corps formats JSON
api.use(bodyParser.json());

api.use(cors("*"));

const authenticateJWT = (req, res, next) => {
  const authHeader = req.headers.authorization;

  if (authHeader) {
    const token = authHeader.split(" ")[1];

    jwt.verify(token, process.env.TOKEN_SECRET, (err, user) => {
      if (err) {
        return res.sendStatus(403);
      }

      req.user = user;
      next();
    });
  } else {
    res.sendStatus(401);
  }
};

// ############## ROUTES ############### //
api.get("/", (req, res) => {
  res.send("Bienvenue sur l'api d'AMC Habitat");
});
api.use("/login", login);
api.use("/register", register);
// Access only if the user connected
api.get("/home", authenticateJWT, (req, res) => {
  res.send(`Bienvenue à l'accueil, ${req.user.username}!`);
});
// ##################################### //

// Connexion du serveur sur port
api.listen(PORT, () => {
  console.log(`api listening on port ${PORT}`);
});

console.log(`Server launched on http://localhost:${PORT}/`);
