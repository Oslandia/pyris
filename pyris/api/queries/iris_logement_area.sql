-- About housing data by area

SELECT
  iris
  ,com AS citycode
  ,libcom as city
  ,libiris as label
  ,p_rp_m30m2 as main_residence_30m2 -- less than 30m2
  ,p_rp_3040m2 as main_residence_30_40m2
  ,p_rp_4060m2 as main_residence_40_60m2
  ,p_rp_6080m2 as main_residence_60_80m2
  ,p_rp_80100m2 as main_residence_80_100m2
  ,p_rp_100120m2 as main_residence_100_120m2
  ,p_rp_120m2p as main_residence_120m2 -- more than 120m2
  ,census
FROM insee.logement
WHERE iris = %s;
