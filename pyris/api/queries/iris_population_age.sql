-- Population by age for an IRIS

SELECT
  iris
  ,com AS citycode
  ,libcom as city
  ,libiris as label
  ,p13_pop0014 as population_0_14
  ,p13_pop1529 as population_15_29
  ,p13_pop3044 as population_30_44
  ,p13_pop4559 as population_45_59
  ,p13_pop6074 as population_60_74
  ,p13_pop75p as population_75
FROM insee.population
WHERE iris = %s;
