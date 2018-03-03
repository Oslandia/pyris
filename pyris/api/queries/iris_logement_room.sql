-- About housing data by number of rooms

SELECT
  iris
  ,com AS citycode
  ,libcom as city
  ,libiris as label
  ,p13_rp_1p as main_residence_1_room
  ,p13_rp_2p as main_residence_2_room
  ,p13_rp_3p as main_residence_3_room
  ,p13_rp_4p as main_residence_4_room
  ,p13_rp_5pp as main_residence_5_room
FROM insee.logement
WHERE iris = %s;
