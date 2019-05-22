-- INSEE employment for an IRIS by sex

SELECT
  iris
  ,com AS citycode
  ,libcom as city
  ,libiris as label
  ,p_hact1564 as homme_actif
  ,p_fact1564 as femme_actif
  ,p_hchom1564 as homme_chomage
  ,p_fchom1564 as femme_chomage
  ,p_hinact1564 as homme_inactif
  ,p_finact1564 as femme_inactif
  ,p_hetud1564 as homme_etudiant
  ,p_fetud1564 as femme_etudiant
  ,p_hretr1564 as homme_retraite
  ,p_fretr1564 as femme_retraite
  ,p_hainact1564 as homme_autre_inactif
  ,p_fainact1564 as femme_autre_inactif
  ,p_hchom1564 / p_hact1564 * 100. as homme_taux_chomage
  ,p_fchom1564 / p_fact1564 * 100. as femme_taux_chomage
  ,census
FROM insee.activite
WHERE iris = %s;
