-- About housing data

SELECT
  iris
  ,com AS citycode
  ,libcom as city
  ,libiris as label
  ,p13_log as logement
  ,p13_rp as main_residence
  ,p13_rsecocc as second_residence
  ,p13_logvac as unoccupied
  ,p13_maison as house
  ,p13_appart as appartment
FROM insee.logement
WHERE iris = %s;
