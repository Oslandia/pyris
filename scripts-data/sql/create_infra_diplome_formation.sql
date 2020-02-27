-- diplomes formation infra communale (IRIS)
DROP TABLE IF EXISTS insee.diplome_formation_{census};

CREATE TABLE IF NOT EXISTS insee.diplome_formation_{census} (
  iris varchar(9) PRIMARY KEY,
  reg varchar(2),
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
  p_pop0205 float,
  p_pop0610 float,
  p_pop1114 float,
  p_pop1517 float,
  p_pop1824 float,
  p_pop2529 float,
  p_pop30p float,
  p_scol0205 float,
  p_scol0610 float,
  p_scol1114 float,
  p_scol1517 float,
  p_scol1824 float,
  p_scol2529 float,
  p_scol30p float,
  p_nscol15p float,
  p_nscol15p_diplmin float,
  p_nscol15p_capbep float,
  p_nscol15p_bac float,
  p_nscol15p_sup float,
  p_hnscol15p float,
  p_hnscol15p_diplmin float,
  p_hnscol15p_capbep float,
  p_hnscol15p_bac float,
  p_hnscol15p_sup float,
  p_fnscol15p float,
  p_fnscol15p_diplmin float,
  p_fnscol15p_capbep float,
  p_fnscol15p_bac float,
  p_fnscol15p_sup float
);


create index diplome_formation_{census}_dep_idx ON insee.diplome_formation_{census} USING btree (dep);
create index diplome_formation_{census}_com_idx ON insee.diplome_formation_{census} USING btree (com);
create index diplome_formation_{census}_libcom_idx ON insee.diplome_formation_{census} USING btree (libcom);


COMMENT ON TABLE insee.diplome_formation_{census} IS 'Diplôme formation à l''IRIS (source Insee), census {census}';

COMMENT ON COLUMN insee.diplome_formation_{census}.iris IS 'IRIS';
COMMENT ON COLUMN insee.diplome_formation_{census}.reg IS 'Région (nouvelle)';
COMMENT ON COLUMN insee.diplome_formation_{census}.dep IS 'Département';
COMMENT ON COLUMN insee.diplome_formation_{census}.uu2010 IS 'Unité urbaine';
COMMENT ON COLUMN insee.diplome_formation_{census}.com IS 'Commune ou ARM';
COMMENT ON COLUMN insee.diplome_formation_{census}.libcom IS 'Libellé commune ou ARM';
COMMENT ON COLUMN insee.diplome_formation_{census}.triris IS 'TRIRIS';
COMMENT ON COLUMN insee.diplome_formation_{census}.grd_quart IS 'Grand quartier';
COMMENT ON COLUMN insee.diplome_formation_{census}.libiris IS 'Libellé de l''IRIS';
COMMENT ON COLUMN insee.diplome_formation_{census}.typ_iris IS 'Type d''IRIS';
COMMENT ON COLUMN insee.diplome_formation_{census}.modif_iris IS 'Modification de l''IRIS';
COMMENT ON COLUMN insee.diplome_formation_{census}.lab_iris IS 'Label de l''IRIS';

COMMENT ON COLUMN insee.diplome_formation_{census}.p_pop0205 IS 'Pop 2-5 ans en 2013 (princ)';
COMMENT ON COLUMN insee.diplome_formation_{census}.p_pop0610 IS 'Pop 6-10 ans en 2013 (princ)';
COMMENT ON COLUMN insee.diplome_formation_{census}.p_pop1114 IS 'Pop 11-14 ans en 2013 (princ)';
COMMENT ON COLUMN insee.diplome_formation_{census}.p_pop1517 IS 'Pop 15-17 ans en 2013 (princ)';
COMMENT ON COLUMN insee.diplome_formation_{census}.p_pop1824 IS 'Pop 18-24 ans en 2013 (princ)';
COMMENT ON COLUMN insee.diplome_formation_{census}.p_pop2529 IS 'Pop 25-29 ans en 2013 (princ)';
COMMENT ON COLUMN insee.diplome_formation_{census}.p_pop30p IS 'Pop 30 ans ou plus en 2013 (princ)';
COMMENT ON COLUMN insee.diplome_formation_{census}.p_scol0205 IS 'Pop scolarisée 2-5 ans en 2013 (princ)';
COMMENT ON COLUMN insee.diplome_formation_{census}.p_scol0610 IS 'Pop scolarisée 6-10 ans en 2013 (princ)';
COMMENT ON COLUMN insee.diplome_formation_{census}.p_scol1114 IS 'Pop scolarisée 11-14 ans en 2013 (princ)';
COMMENT ON COLUMN insee.diplome_formation_{census}.p_scol1517 IS 'Pop scolarisée 15-17 ans en 2013 (princ)';
COMMENT ON COLUMN insee.diplome_formation_{census}.p_scol1824 IS 'Pop scolarisée 18-24 ans en 2013 (princ)';
COMMENT ON COLUMN insee.diplome_formation_{census}.p_scol2529 IS 'Pop scolarisée 25-29 ans en 2013 (princ)';
COMMENT ON COLUMN insee.diplome_formation_{census}.p_scol30p IS 'Pop scolarisée 30 ans ou plus en 2013 (princ)';
COMMENT ON COLUMN insee.diplome_formation_{census}.p_nscol15p IS 'Pop 15 ans ou plus non scolarisée en 2013 (princ)';
COMMENT ON COLUMN insee.diplome_formation_{census}.p_nscol15p_diplmin IS 'Pop 15 ans ou plus non scol. Sans diplôme ou BEPC, brevet des collèges, DNB en 2013 (princ)';
COMMENT ON COLUMN insee.diplome_formation_{census}.p_nscol15p_capbep IS 'Pop 15 ans ou plus non scol. CAP-BEP en 2013 (princ)';
COMMENT ON COLUMN insee.diplome_formation_{census}.p_nscol15p_bac IS 'Pop 15 ans ou plus non scol. BAC en 2013 (princ)';
COMMENT ON COLUMN insee.diplome_formation_{census}.p_nscol15p_sup IS 'Pop 15 ans ou plus non scol. Enseignement sup en 2013 (princ)';
COMMENT ON COLUMN insee.diplome_formation_{census}.p_hnscol15p IS 'Hommes 15 ans ou plus non scolarisés en 2013 (princ)';
COMMENT ON COLUMN insee.diplome_formation_{census}.p_hnscol15p_diplmin IS 'Hommes 15 ans ou plus non scol. Sans diplôme ou BEPC, brevet des collèges, DNB en 2013 (princ)';
COMMENT ON COLUMN insee.diplome_formation_{census}.p_hnscol15p_capbep IS 'Hommes 15 ans ou plus non scol. CAP-BEP en 2013 (princ)';
COMMENT ON COLUMN insee.diplome_formation_{census}.p_hnscol15p_bac IS 'Hommes 15 ans ou plus non scol. BAC en 2013 (princ)';
COMMENT ON COLUMN insee.diplome_formation_{census}.p_hnscol15p_sup IS 'Hommes 15 ans ou plus non scol. Enseignement sup en 2013 (princ)';
COMMENT ON COLUMN insee.diplome_formation_{census}.p_fnscol15p IS 'Femmes 15 ans ou plus non scolarisées en 2013 (princ)';
COMMENT ON COLUMN insee.diplome_formation_{census}.p_fnscol15p_diplmin IS 'Femmes 15 ans ou plus non scol. Sans diplôme ou BEPC, brevet des collèges, DNB en 2013 (princ)';
COMMENT ON COLUMN insee.diplome_formation_{census}.p_fnscol15p_capbep IS 'Femmes 15 ans ou plus non scol. CAP-BEP en 2013 (princ)';
COMMENT ON COLUMN insee.diplome_formation_{census}.p_fnscol15p_bac IS 'Femmes 15 ans ou plus non scol. BAC en 2013 (princ)';
COMMENT ON COLUMN insee.diplome_formation_{census}.p_fnscol15p_sup IS 'Femmes 15 ans ou plus non scol. Enseignement sup en 2013 (princ)';


\copy insee.diplome_formation_{census} FROM '{fpath}' DELIMITER '{sep}' CSV HEADER;
