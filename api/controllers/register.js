const { createUser } = require("../models/users");
const bcrypt = require("bcrypt");

exports.register = async (req, res) => {
  let user = req.body;
  user.password = bcrypt.hashSync(user.password, 10);
  user.role = "member";
  createUser(user)
    .then((data) => res.status(200).json(data))
    .catch((err) => res.status(500).send(err));
};
