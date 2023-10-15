const { Router } = require("express");
const router = Router();
const controller = require("../controllers/login");

router.post("/", controller.login);

module.exports = router;
