const db = require("../services/database");

exports.createUser = async function (user) {
  let sql = `INSERT INTO users SET ?`;
  const [results] = await db.promise().query(sql, user);
  return results;
};

exports.getUsers = async function () {
  let sql = `SELECT * FROM users`;
  const [results] = await db.promise().query(sql);
  console.log(results);
  return results;
};
