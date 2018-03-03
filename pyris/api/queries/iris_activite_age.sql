-- INSEE employment for an IRIS

SELECT
  iris
  ,com AS citycode
  ,libcom as city
  ,libiris as label

  ,p13_act1524 as actif_15_24
  ,p13_act2554 as actif_25_54
  ,p13_act5564 as actif_55_64

  ,p13_chom1524 as chomage_15_24
  ,p13_chom2554 as chomage_25_54
  ,p13_chom5564 as chomage_55_64

  ,p13_chom1524 / p13_act1524 * 100. as taux_chomage_15_24
  ,p13_chom2554 / p13_act2554 * 100. as taux_chomage_25_54
  ,p13_chom5564 / p13_act5564 * 100. as taux_chomage_55_64

FROM insee.activite
WHERE iris = %s;
