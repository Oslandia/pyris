-- Population by sex and age for an IRIS

SELECT
  iris
  ,com AS citycode
  ,libcom as city
  ,libiris as label
  ,p_f0014 as female_0_14
  ,p_f1529 as female_15_29
  ,p_f3044 as female_30_44
  ,p_f4559 as female_45_59
  ,p_f6074 as female_60_74
  ,p_f75p as female_75
  ,p_h0014 as male_0_14
  ,p_h1529 as male_15_29
  ,p_h3044 as male_30_44
  ,p_h4559 as male_45_59
  ,p_h6074 as male_60_74
  ,p_h75p as male_75
  ,census
FROM insee.population
WHERE iris = %s;
