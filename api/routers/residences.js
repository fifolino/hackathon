const { Router } = require("express");
const router = Router();
const controller = require("../controllers/residences");


router.get("/", controller.giveAllResidences);

module.exports = router;
