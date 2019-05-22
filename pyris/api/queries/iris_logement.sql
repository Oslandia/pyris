-- About housing data

SELECT
  iris
  ,com AS citycode
  ,libcom as city
  ,libiris as label
  ,p_log as logement
  ,p_rp as main_residence
  ,p_rsecocc as second_residence
  ,p_logvac as unoccupied
  ,p_maison as house
  ,p_appart as appartment
  ,census
FROM insee.logement
WHERE iris = %s;
