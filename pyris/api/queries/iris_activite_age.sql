-- INSEE employment for an IRIS

SELECT
  iris
  ,com AS citycode
  ,libcom as city
  ,libiris as label

  ,p_act1524 as actif_15_24
  ,p_act2554 as actif_25_54
  ,p_act5564 as actif_55_64

  ,p_chom1524 as chomage_15_24
  ,p_chom2554 as chomage_25_54
  ,p_chom5564 as chomage_55_64

  ,p_chom1524 / p_act1524 * 100. as taux_chomage_15_24
  ,p_chom2554 / p_act2554 * 100. as taux_chomage_25_54
  ,p_chom5564 / p_act5564 * 100. as taux_chomage_55_64
  ,census
FROM insee.activite
WHERE iris = %s;
