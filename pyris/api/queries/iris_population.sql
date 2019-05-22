-- Population for an IRIS

SELECT
  iris
  ,com AS citycode
  ,libcom as city
  ,libiris as label
  ,p_pop as population
  ,p_poph as population_male
  ,p_popf as population_female
  ,census
FROM insee.population
WHERE iris = %s;
