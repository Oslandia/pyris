-- About housing data by year of building

SELECT
  iris
  ,com AS citycode
  ,libcom as city
  ,libiris as label
  ,p_rp_ach19 as main_residence_1919  -- built before 1919
  ,p_rp_ach45 as main_residence_1920_1945
  ,p_rp_ach70 as main_residence_1946_1970
  ,p_rp_ach90 as main_residence_1971_1990
  ,p_rp_ach05 as main_residence_1991_2005
  ,p_rp_ach10 as main_residence_2006_2011
  ,census
FROM insee.logement
WHERE iris = %s;
