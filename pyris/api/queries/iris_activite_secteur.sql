-- INSEE type of employment for an IRIS

SELECT
  iris
  ,com AS citycode
  ,libcom as city
  ,libiris as label

  ,c_act1564_cs1 as agriculteurs_exploitants
  ,c_act1564_cs2 as artisans_comm_chefs_entreprise
  ,c_act1564_cs3 as cadres_prof_intel_superieur
  ,c_act1564_cs4 as prof_intermédiaires
  ,c_act1564_cs5 as employés
  ,c_act1564_cs6 as ouvriers
  ,census
FROM insee.activite
WHERE iris = %s;










