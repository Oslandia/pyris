-- Population by sex and age for an IRIS

SELECT
  iris
  ,com AS citycode
  ,libcom as city
  ,libiris as label
  ,p13_f0014 as female_0_14
  ,p13_f1529 as female_15_29
  ,p13_f3044 as female_30_44
  ,p13_f4559 as female_45_59
  ,p13_f6074 as female_60_74
  ,p13_f75p as female_75
  ,p13_h0014 as men_0_14
  ,p13_h1529 as men_15_29
  ,p13_h3044 as men_30_44
  ,p13_h4559 as men_45_59
  ,p13_h6074 as men_60_74
  ,p13_h75p as men_75
FROM insee.population
WHERE iris = %s;
