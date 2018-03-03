-- INSEE employment for an IRIS by sex

SELECT
  iris
  ,com AS citycode
  ,libcom as city
  ,libiris as label
  ,p13_hact1564 as homme_actif
  ,p13_fact1564 as femme_actif
  ,p13_hchom1564 as homme_chomage
  ,p13_fchom1564 as femme_chomage
  ,p13_hinact1564 as homme_inactif
  ,p13_finact1564 as femme_inactif
  ,p13_hetud1564 as homme_etudiant
  ,p13_fetud1564 as femme_etudiant
  ,p13_hretr1564 as homme_retraite
  ,p13_fretr1564 as femme_retraite
  ,p13_hainact1564 as homme_autre_inactif
  ,p13_fainact1564 as femme_autre_inactif
  ,p13_hchom1564 / p13_hact1564 * 100. as homme_taux_chomage
  ,p13_fchom1564 / p13_fact1564 * 100. as femme_taux_chomage
FROM insee.activite
WHERE iris = %s;
