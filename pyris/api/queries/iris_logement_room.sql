-- About housing data by number of rooms

SELECT
  iris
  ,com AS citycode
  ,libcom as city
  ,libiris as label
  ,p_rp_1p as main_residence_1_room
  ,p_rp_2p as main_residence_2_room
  ,p_rp_3p as main_residence_3_room
  ,p_rp_4p as main_residence_4_room
  ,p_rp_5pp as main_residence_5_room
  ,census
FROM insee.logement
WHERE iris = %s;
