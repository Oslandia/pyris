-- INSEE employment for an IRIS

SELECT
  iris
  ,com AS citycode
  ,libcom as city
  ,libiris as label
  ,p13_pop1564 as population -- actif+inactif
  ,p13_act1564 as actif  -- actif_occupe + chomeur
  ,p13_inact1564 as inactif -- retraite + etudiant + autre
  -- ,p13_actocc1564 as actif_occupe
  ,p13_etud1564 as etudiant
  ,p13_chom1564 as chomeur
  ,p13_retr1564 as retraite
  ,p13_ainact1564 as autre_inactif
  ,p13_chom1564 / p13_act1564 * 100. as taux_chomage
FROM insee.activite
WHERE iris = %s;
