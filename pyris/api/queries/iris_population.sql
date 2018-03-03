-- Population for an IRIS

SELECT
  iris
  ,com AS citycode
  ,libcom as city
  ,libiris as label
  ,p13_pop as population
  ,p13_poph as population_male
  ,p13_popf as population_female
FROM insee.population
WHERE iris = %s;
