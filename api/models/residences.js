const db = require("../services/database");

exports.getAllResidences =  async () =>{
 let sql = 'SELECT DISTINCT r.code_acm_residence, i.contrat, i.panne, l.dpe, l.ges, r.zones_sensibles, r.date_construc, t.code_presta, t.libelle_presta, t.complementaire FROM `residences` AS r JOIN `logements` AS l ON r.code_acm_residence = CONVERT(l.code_acm_logements, UNSIGNED) JOIN `interventions_parties_privatives` AS i ON r.code_acm_residence = i.code_acm JOIN `travaux` AS t ON r.code_acm_residence = t.code_acm_travaux WHERE (l.dpe LIKE "%G%" OR l.ges LIKE "%F%" OR l.ges LIKE "%E%") AND (r.zones_sensibles = "QPV") AND (l.ges LIKE "%G%" OR l.ges LIKE "%F%" OR l.ges LIKE "%E%") ORDER BY l.dpe DESC LIMIT 15000';

    const [results] = await db.promise().query(sql);

    const authorOptions = results
  .filter((code, index, array) => {
    const myResults = array.findIndex((c) => code.code_acm_residence === c.code_acm_residence);
    return index === myResults;
  })

    return authorOptions;
}