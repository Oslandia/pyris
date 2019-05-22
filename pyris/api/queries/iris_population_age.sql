-- Population by age for an IRIS

SELECT
  iris
  ,com AS citycode
  ,libcom as city
  ,libiris as label
  ,p_pop0014 as population_0_14
  ,p_pop1529 as population_15_29
  ,p_pop3044 as population_30_44
  ,p_pop4559 as population_45_59
  ,p_pop6074 as population_60_74
  ,p_pop75p as population_75
  ,census
FROM insee.population
WHERE iris = %s;
