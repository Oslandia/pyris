-- INSEE type of employment for an IRIS

SELECT
  iris
  ,com AS citycode
  ,libcom as city
  ,libiris as label

  ,c13_act1564_cs1 as agriculteurs_exploitants
  ,c13_act1564_cs2 as artisans_comm_chefs_entreprise
  ,c13_act1564_cs3 as cadres_prof_intel_superieur
  ,c13_act1564_cs4 as prof_intermédiaires
  ,c13_act1564_cs5 as employés
  ,c13_act1564_cs6 as ouvriers

FROM insee.activite
WHERE iris = %s;










