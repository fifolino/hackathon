const {getAllResidences} = require("../models/residences");

exports.giveAllResidences =  async (req, res) => {
    
    getAllResidences()
    .then((data) => res.status(200).json(data))
    .catch((err) => res.status(500).send(err));
};