const { Router } = require("express");
const router = Router();
const controller = require("../controllers/register");

router.post("/", controller.register);

module.exports = router;
