-- INSEE employment for an IRIS

SELECT
  iris
  ,com AS citycode
  ,libcom as city
  ,libiris as label
  ,p_pop1564 as population -- actif+inactif
  ,p_act1564 as actif  -- actif_occupe + chomeur
  ,p_inact1564 as inactif -- retraite + etudiant + autre
  -- ,p13_actocc1564 as actif_occupe
  ,p_etud1564 as etudiant
  ,p_chom1564 as chomeur
  ,p_retr1564 as retraite
  ,p_ainact1564 as autre_inactif
  ,p_chom1564 / p_act1564 * 100. as taux_chomage
  ,census
FROM insee.activite
WHERE iris = %s;
