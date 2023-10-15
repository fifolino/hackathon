const jwt = require("jsonwebtoken");
const bcrypt = require("bcryptjs");
const { getUsers } = require("../models/users");
require("dotenv").config();
exports.login = async (req, res) => {
  // Read username and password from request body
  const { username, password } = req.body;

  // Get All Users in our database
  getUsers()
    .then((users) => {
      // Filter user from the users array by username and hash password
      console.log(users);
      const user = users.find((u) => {
        return (
          u.username === username && bcrypt.compareSync(password, u.password)
        );
      });

      if (user) {
        // Generate an access token
        const accessToken = jwt.sign(
          { username: user.username, role: user.role },
          process.env.TOKEN_SECRET
        );

        res.json({
          accessToken,
        });
      } else {
        res.send("Username or password incorrect");
      }
    })
    .catch((err) => res.status(500).send(err));
};
