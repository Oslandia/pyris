-- diplomes formation infra communale (IRIS)
DROP TABLE IF EXISTS insee.formation;

CREATE TABLE IF NOT EXISTS insee.formation (
  iris varchar(9) PRIMARY KEY,
  reg varchar(2),
  reg2016 varchar(2),
  dep varchar(3),
  uu2010 varchar(5),
  com varchar(5),
  libcom varchar(50),
  triris varchar(6),
  grd_quart varchar(7),
  libiris varchar(80),
  typ_iris varchar(1),
  modif_iris varchar(10),
  lab_iris varchar(1),
  p13_pop0205 float,
  p13_pop0610 float,
  p13_pop1114 float,
  p13_pop1517 float,
  p13_pop1824 float,
  p13_pop2529 float,
  p13_pop30p float,
  p13_scol0205 float,
  p13_scol0610 float,
  p13_scol1114 float,
  p13_scol1517 float,
  p13_scol1824 float,
  p13_scol2529 float,
  p13_scol30p float,
  p13_nscol15p float,
  p13_nscol15p_diplmin float,
  p13_nscol15p_capbep float,
  p13_nscol15p_bac float,
  p13_nscol15p_sup float,
  p13_hnscol15p float,
  p13_hnscol15p_diplmin float,
  p13_hnscol15p_capbep float,
  p13_hnscol15p_bac float,
  p13_hnscol15p_sup float,
  p13_fnscol15p float,
  p13_fnscol15p_diplmin float,
  p13_fnscol15p_capbep float,
  p13_fnscol15p_bac float,
  p13_fnscol15p_sup float
);


COMMENT ON TABLE insee.formation IS 'Diplôme formation à l''IRIS (2013)';

COMMENT ON COLUMN insee.formation.iris IS 'IRIS';
COMMENT ON COLUMN insee.formation.reg IS 'Région';
COMMENT ON COLUMN insee.formation.reg2016 IS 'Région 2016';
COMMENT ON COLUMN insee.formation.dep IS 'Département';
COMMENT ON COLUMN insee.formation.uu2010 IS 'Unité urbaine';
COMMENT ON COLUMN insee.formation.com IS 'Commune ou ARM';
COMMENT ON COLUMN insee.formation.libcom IS 'Libellé commune ou ARM';
COMMENT ON COLUMN insee.formation.triris IS 'TRIRIS';
COMMENT ON COLUMN insee.formation.grd_quart IS 'Grand quartier';
COMMENT ON COLUMN insee.formation.libiris IS 'Libellé de l''IRIS';
COMMENT ON COLUMN insee.formation.typ_iris IS 'Type d''IRIS';
COMMENT ON COLUMN insee.formation.modif_iris IS 'Modification de l''IRIS';
COMMENT ON COLUMN insee.formation.lab_iris IS 'Label de l''IRIS';

COMMENT ON COLUMN insee.formation.p13_pop0205 IS 'Pop 2-5 ans en 2013 (princ)';
COMMENT ON COLUMN insee.formation.p13_pop0610 IS 'Pop 6-10 ans en 2013 (princ)';
COMMENT ON COLUMN insee.formation.p13_pop1114 IS 'Pop 11-14 ans en 2013 (princ)';
COMMENT ON COLUMN insee.formation.p13_pop1517 IS 'Pop 15-17 ans en 2013 (princ)';
COMMENT ON COLUMN insee.formation.p13_pop1824 IS 'Pop 18-24 ans en 2013 (princ)';
COMMENT ON COLUMN insee.formation.p13_pop2529 IS 'Pop 25-29 ans en 2013 (princ)';
COMMENT ON COLUMN insee.formation.p13_pop30p IS 'Pop 30 ans ou plus en 2013 (princ)';
COMMENT ON COLUMN insee.formation.p13_scol0205 IS 'Pop scolarisée 2-5 ans en 2013 (princ)';
COMMENT ON COLUMN insee.formation.p13_scol0610 IS 'Pop scolarisée 6-10 ans en 2013 (princ)';
COMMENT ON COLUMN insee.formation.p13_scol1114 IS 'Pop scolarisée 11-14 ans en 2013 (princ)';
COMMENT ON COLUMN insee.formation.p13_scol1517 IS 'Pop scolarisée 15-17 ans en 2013 (princ)';
COMMENT ON COLUMN insee.formation.p13_scol1824 IS 'Pop scolarisée 18-24 ans en 2013 (princ)';
COMMENT ON COLUMN insee.formation.p13_scol2529 IS 'Pop scolarisée 25-29 ans en 2013 (princ)';
COMMENT ON COLUMN insee.formation.p13_scol30p IS 'Pop scolarisée 30 ans ou plus en 2013 (princ)';
COMMENT ON COLUMN insee.formation.p13_nscol15p IS 'Pop 15 ans ou plus non scolarisée en 2013 (princ)';
COMMENT ON COLUMN insee.formation.p13_nscol15p_diplmin IS 'Pop 15 ans ou plus non scol. Sans diplôme ou BEPC, brevet des collèges, DNB en 2013 (princ)';
COMMENT ON COLUMN insee.formation.p13_nscol15p_capbep IS 'Pop 15 ans ou plus non scol. CAP-BEP en 2013 (princ)';
COMMENT ON COLUMN insee.formation.p13_nscol15p_bac IS 'Pop 15 ans ou plus non scol. BAC en 2013 (princ)';
COMMENT ON COLUMN insee.formation.p13_nscol15p_sup IS 'Pop 15 ans ou plus non scol. Enseignement sup en 2013 (princ)';
COMMENT ON COLUMN insee.formation.p13_hnscol15p IS 'Hommes 15 ans ou plus non scolarisés en 2013 (princ)';
COMMENT ON COLUMN insee.formation.p13_hnscol15p_diplmin IS 'Hommes 15 ans ou plus non scol. Sans diplôme ou BEPC, brevet des collèges, DNB en 2013 (princ)';
COMMENT ON COLUMN insee.formation.p13_hnscol15p_capbep IS 'Hommes 15 ans ou plus non scol. CAP-BEP en 2013 (princ)';
COMMENT ON COLUMN insee.formation.p13_hnscol15p_bac IS 'Hommes 15 ans ou plus non scol. BAC en 2013 (princ)';
COMMENT ON COLUMN insee.formation.p13_hnscol15p_sup IS 'Hommes 15 ans ou plus non scol. Enseignement sup en 2013 (princ)';
COMMENT ON COLUMN insee.formation.p13_fnscol15p IS 'Femmes 15 ans ou plus non scolarisées en 2013 (princ)';
COMMENT ON COLUMN insee.formation.p13_fnscol15p_diplmin IS 'Femmes 15 ans ou plus non scol. Sans diplôme ou BEPC, brevet des collèges, DNB en 2013 (princ)';
COMMENT ON COLUMN insee.formation.p13_fnscol15p_capbep IS 'Femmes 15 ans ou plus non scol. CAP-BEP en 2013 (princ)';
COMMENT ON COLUMN insee.formation.p13_fnscol15p_bac IS 'Femmes 15 ans ou plus non scol. BAC en 2013 (princ)';
COMMENT ON COLUMN insee.formation.p13_fnscol15p_sup IS 'Femmes 15 ans ou plus non scol. Enseignement sup en 2013 (princ)';
