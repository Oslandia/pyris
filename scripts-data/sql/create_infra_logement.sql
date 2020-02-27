-- logement infra communale (IRIS)
DROP TABLE IF EXISTS insee.logement_{census};

CREATE TABLE IF NOT EXISTS insee.logement_{census} (
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
  p_log float,
  p_rp float,
  p_rsecocc float,
  p_logvac float,
  p_maison float,
  p_appart float,
  p_rp_1p float,
  p_rp_2p float,
  p_rp_3p float,
  p_rp_4p float,
  p_rp_5pp float,
  p_nbpi_rp float,
  p_rpmaison float,
  p_nbpi_rpmaison float,
  p_rpappart float,
  p_nbpi_rpappart float,
  p_rp_m30m2 float,
  p_rp_3040m2 float,
  p_rp_4060m2 float,
  p_rp_6080m2 float,
  p_rp_80100m2 float,
  p_rp_100120m2 float,
  p_rp_120m2p float,
  p_rp_achtot float,
  p_rp_ach19 float,
  p_rp_ach45 float,
  p_rp_ach70 float,
  p_rp_ach90 float,
  p_rp_ach05 float,
  p_rp_ach10 float,
  p_rpmaison_achtot float,
  p_rpmaison_ach19 float,
  p_rpmaison_ach45 float,
  p_rpmaison_ach70 float,
  p_rpmaison_ach90 float,
  p_rpmaison_ach05 float,
  p_rpmaison_ach10 float,
  p_rpappart_achtot float,
  p_rpappart_ach19 float,
  p_rpappart_ach45 float,
  p_rpappart_ach70 float,
  p_rpappart_ach90 float,
  p_rpappart_ach05 float,
  p_rpappart_ach10 float,
  p_men float,
  p_men_anem0002 float,
  p_men_anem0204 float,
  p_men_anem0509 float,
  p_men_anem10p float,
  p_pmen float,
  p_pmen_anem0002 float,
  p_pmen_anem0204 float,
  p_pmen_anem0509 float,
  p_pmen_anem10p float,
  p_nbpi_rp_anem0002 float,
  p_nbpi_rp_anem0204 float,
  p_nbpi_rp_anem0509 float,
  p_nbpi_rp_anem10p float,
  p_rp_prop float,
  p_rp_loc float,
  p_rp_lochlmv float,
  p_rp_grat float,
  p_nper_rp float,
  p_nper_rp_prop float,
  p_nper_rp_loc float,
  p_nper_rp_lochlmv float,
  p_nper_rp_grat float,
  p_anem_rp float,
  p_anem_rp_prop float,
  p_anem_rp_loc float,
  p_anem_rp_lochlmv float,
  p_anem_rp_grat float,
  p_rp_sdb float,
  p_rp_cccoll float,
  p_rp_ccind float,
  p_rp_cindelec float,
  p_rp_elec float,
  p_rp_eauch float,
  p_rp_bdwc float,
  p_rp_chos float,
  p_rp_clim float,
  p_rp_ttegou float,
  p_rp_garl float,
  p_rp_voit1p float,
  p_rp_voit1 float,
  p_rp_voit2p float,
  p_rp_habfor float,
  p_rp_case float,
  p_rp_mibois float,
  p_rp_midur float
);


create index logement_{census}_dep_idx ON insee.logement_{census} USING btree (dep);
create index logement_{census}_com_idx ON insee.logement_{census} USING btree (com);
create index logement_{census}_libcom_idx ON insee.logement_{census} USING btree (libcom);


COMMENT ON TABLE insee.logement_{census} IS 'logement à l''IRIS (source Insee), census {census}';

COMMENT ON COLUMN insee.logement_{census}.iris IS 'IRIS';
COMMENT ON COLUMN insee.logement_{census}.reg IS 'Région (nouvelle)';
COMMENT ON COLUMN insee.logement_{census}.dep IS 'Département';
COMMENT ON COLUMN insee.logement_{census}.uu2010 IS 'Unité urbaine';
COMMENT ON COLUMN insee.logement_{census}.com IS 'Commune ou ARM';
COMMENT ON COLUMN insee.logement_{census}.libcom IS 'Libellé commune ou ARM';
COMMENT ON COLUMN insee.logement_{census}.triris IS 'TRIRIS';
COMMENT ON COLUMN insee.logement_{census}.grd_quart IS 'Grand quartier';
COMMENT ON COLUMN insee.logement_{census}.libiris IS 'Libellé de l''IRIS';
COMMENT ON COLUMN insee.logement_{census}.typ_iris IS 'Type d''IRIS';
COMMENT ON COLUMN insee.logement_{census}.modif_iris IS 'Modification de l''IRIS';
COMMENT ON COLUMN insee.logement_{census}.lab_iris IS 'Label de l''IRIS';

COMMENT ON COLUMN insee.logement_{census}.p_log IS 'Logements (princ)';
COMMENT ON COLUMN insee.logement_{census}.p_rp IS 'Résidences principales (princ)';
COMMENT ON COLUMN insee.logement_{census}.p_rsecocc IS 'Rés secondaires et logts occasionnels (princ)';
COMMENT ON COLUMN insee.logement_{census}.p_logvac IS 'Logements vacants (princ)';
COMMENT ON COLUMN insee.logement_{census}.p_maison IS 'Maisons (princ)';
COMMENT ON COLUMN insee.logement_{census}.p_appart IS 'Appartements (princ)';
COMMENT ON COLUMN insee.logement_{census}.p_rp_1p IS 'Rés princ 1 pièce (princ)';
COMMENT ON COLUMN insee.logement_{census}.p_rp_2p IS 'Rés princ 2 pièces (princ)';
COMMENT ON COLUMN insee.logement_{census}.p_rp_3p IS 'Rés princ 3 pièces (princ)';
COMMENT ON COLUMN insee.logement_{census}.p_rp_4p IS 'Rés princ 4 pièces (princ)';
COMMENT ON COLUMN insee.logement_{census}.p_rp_5pp IS 'Rés princ 5 pièces ou plus (princ)';
COMMENT ON COLUMN insee.logement_{census}.p_nbpi_rp IS 'Pièces rés princ (princ)';
COMMENT ON COLUMN insee.logement_{census}.p_rpmaison IS 'Rés princ type maison (princ)';
COMMENT ON COLUMN insee.logement_{census}.p_nbpi_rpmaison IS 'Pièces rés princ type maison (princ)';
COMMENT ON COLUMN insee.logement_{census}.p_rpappart IS 'Rés princ type appartement (princ)';
COMMENT ON COLUMN insee.logement_{census}.p_nbpi_rpappart IS 'Pièces rés princ type appartement (princ)';
COMMENT ON COLUMN insee.logement_{census}.p_rp_m30m2 IS 'Rés princ de moins de 30 m2 (princ)';
COMMENT ON COLUMN insee.logement_{census}.p_rp_3040m2 IS 'Rés princ de 30 à moins de 40 m2 (princ)';
COMMENT ON COLUMN insee.logement_{census}.p_rp_4060m2 IS 'Rés princ de 40 à moins de 60 m2 (princ)';
COMMENT ON COLUMN insee.logement_{census}.p_rp_6080m2 IS 'Rés princ de 60 à moins de 80 m2 (princ)';
COMMENT ON COLUMN insee.logement_{census}.p_rp_80100m2 IS 'Rés princ de 80 à moins de 100 m2 (princ)';
COMMENT ON COLUMN insee.logement_{census}.p_rp_100120m2 IS 'Rés princ de 100 à moins de 120 m2 (princ)';
COMMENT ON COLUMN insee.logement_{census}.p_rp_120m2p IS 'Rés princ de 120 m2 ou plus (princ)';
COMMENT ON COLUMN insee.logement_{census}.p_rp_achtot IS 'Rés princ avt 2011 (princ) ';
COMMENT ON COLUMN insee.logement_{census}.p_rp_ach19 IS 'Rés princ avt 1919 (princ) ';
COMMENT ON COLUMN insee.logement_{census}.p_rp_ach45 IS 'Rés princ 1919 à 1945 (princ) ';
COMMENT ON COLUMN insee.logement_{census}.p_rp_ach70 IS 'Rés princ 1946 à 1970 (princ) ';
COMMENT ON COLUMN insee.logement_{census}.p_rp_ach90 IS 'Rés princ 1971 à 1990 (princ) ';
COMMENT ON COLUMN insee.logement_{census}.p_rp_ach05 IS 'Rés princ 1991 à 2005 (princ) ';
COMMENT ON COLUMN insee.logement_{census}.p_rp_ach10 IS 'Rés princ 2006 à 2010 (princ) ';
COMMENT ON COLUMN insee.logement_{census}.p_rpmaison_achtot IS 'Rés princ Type maison avt 2011 (princ) ';
COMMENT ON COLUMN insee.logement_{census}.p_rpmaison_ach19 IS 'Rés princ Type maison avt 1919 (princ) ';
COMMENT ON COLUMN insee.logement_{census}.p_rpmaison_ach45 IS 'Rés princ Type maison 1919 à 1945 (princ) ';
COMMENT ON COLUMN insee.logement_{census}.p_rpmaison_ach70 IS 'Rés princ Type maison 1946 à 1970 (princ) ';
COMMENT ON COLUMN insee.logement_{census}.p_rpmaison_ach90 IS 'Rés princ Type maison 1971 à 1990 (princ) ';
COMMENT ON COLUMN insee.logement_{census}.p_rpmaison_ach05 IS 'Rés princ Type maison 1991 à 2005 (princ) ';
COMMENT ON COLUMN insee.logement_{census}.p_rpmaison_ach10 IS 'Rés princ Type maison 2006 à 2010 (princ) ';
COMMENT ON COLUMN insee.logement_{census}.p_rpappart_achtot IS 'Rés princ Type appart avt 2011 (princ) ';
COMMENT ON COLUMN insee.logement_{census}.p_rpappart_ach19 IS 'Rés princ Type appart avt 1919 (princ) ';
COMMENT ON COLUMN insee.logement_{census}.p_rpappart_ach45 IS 'Rés princ Type appart 1919 à 1945 (princ) ';
COMMENT ON COLUMN insee.logement_{census}.p_rpappart_ach70 IS 'Rés princ Type appart 1946 à 1970 (princ) ';
COMMENT ON COLUMN insee.logement_{census}.p_rpappart_ach90 IS 'Rés princ Type appart 1971 à 1990 (princ) ';
COMMENT ON COLUMN insee.logement_{census}.p_rpappart_ach05 IS 'Rés princ Type appart 1991 à 2005 (princ) ';
COMMENT ON COLUMN insee.logement_{census}.p_rpappart_ach10 IS 'Rés princ Type appart 2006 à 2010 (princ) ';
COMMENT ON COLUMN insee.logement_{census}.p_men IS 'Ménages (princ)';
COMMENT ON COLUMN insee.logement_{census}.p_men_anem0002 IS 'Ménages emménagés moins 2 ans (princ)';
COMMENT ON COLUMN insee.logement_{census}.p_men_anem0204 IS 'Ménages emménagés entre 2-4 ans (princ)';
COMMENT ON COLUMN insee.logement_{census}.p_men_anem0509 IS 'Ménages emménagés entre 5-9 ans (princ)';
COMMENT ON COLUMN insee.logement_{census}.p_men_anem10p IS 'Ménages emménagés depuis 10 ans ou plus (princ)';
COMMENT ON COLUMN insee.logement_{census}.p_pmen IS 'Pop ménages (princ)';
COMMENT ON COLUMN insee.logement_{census}.p_pmen_anem0002 IS 'Pop mén emménagés moins 2 ans (princ)';
COMMENT ON COLUMN insee.logement_{census}.p_pmen_anem0204 IS 'Pop mén emménagés entre 2-4 ans (princ)';
COMMENT ON COLUMN insee.logement_{census}.p_pmen_anem0509 IS 'Pop mén emménagés entre 5-9 ans (princ)';
COMMENT ON COLUMN insee.logement_{census}.p_pmen_anem10p IS 'Pop mén emménagés depuis 10 ans ou plus (princ)';
COMMENT ON COLUMN insee.logement_{census}.p_nbpi_rp_anem0002 IS 'Pièces Rés princ Mén. emménagés moins 2 ans (princ)';
COMMENT ON COLUMN insee.logement_{census}.p_nbpi_rp_anem0204 IS 'Pièces Rés princ Mén. emménagés entre 2-4 ans (princ)';
COMMENT ON COLUMN insee.logement_{census}.p_nbpi_rp_anem0509 IS 'Pièces Rés princ Mén. emménagés entre 5-9 ans (princ)';
COMMENT ON COLUMN insee.logement_{census}.p_nbpi_rp_anem10p IS 'Pièces Rés princ Mén. emménagés depuis 10 ans ou plus (princ)';
COMMENT ON COLUMN insee.logement_{census}.p_rp_prop IS 'Rés princ occupées Propriétaires (princ)';
COMMENT ON COLUMN insee.logement_{census}.p_rp_loc IS 'Rés princ occupées Locataires (princ)';
COMMENT ON COLUMN insee.logement_{census}.p_rp_lochlmv IS 'Rés princ HLM louée vide (princ)';
COMMENT ON COLUMN insee.logement_{census}.p_rp_grat IS 'Rés princ logé gratuit (princ)';
COMMENT ON COLUMN insee.logement_{census}.p_nper_rp IS 'Personnes Rés princ (princ)';
COMMENT ON COLUMN insee.logement_{census}.p_nper_rp_prop IS 'Pers Rés princ occupées Propriétaires (princ)';
COMMENT ON COLUMN insee.logement_{census}.p_nper_rp_loc IS 'Pers Rés princ occupées Locataires (princ)';
COMMENT ON COLUMN insee.logement_{census}.p_nper_rp_lochlmv IS 'Pers Rés princ HLM louées vides (princ)';
COMMENT ON COLUMN insee.logement_{census}.p_nper_rp_grat IS 'Pers Rés princ occupées gratuit (princ)';
COMMENT ON COLUMN insee.logement_{census}.p_anem_rp IS 'Anc tot Emméngt Rés princ (années) (princ)';
COMMENT ON COLUMN insee.logement_{census}.p_anem_rp_prop IS 'Anc tot Emméngt Rés princ occ par Propriétaires (années) (princ)';
COMMENT ON COLUMN insee.logement_{census}.p_anem_rp_loc IS 'Anc tot Emméngt Rés princ occ par Locataires (années) (princ)';
COMMENT ON COLUMN insee.logement_{census}.p_anem_rp_lochlmv IS 'Anc tot Emméngt Rés princ HLM louées vides (années) (princ)';
COMMENT ON COLUMN insee.logement_{census}.p_anem_rp_grat IS 'Anc tot Emméngt Rés princ occ gratuit (années) (princ)';
COMMENT ON COLUMN insee.logement_{census}.p_rp_sdb IS 'Rés princ SDB baignoire douche (MET) (princ)';
COMMENT ON COLUMN insee.logement_{census}.p_rp_cccoll IS 'Rés princ Chauffage Central Collectif (MET) (princ)';
COMMENT ON COLUMN insee.logement_{census}.p_rp_ccind IS 'Rés princ Chauffage Central Individuel (MET) (princ)';
COMMENT ON COLUMN insee.logement_{census}.p_rp_cindelec IS 'Rés princ Chauffage Individuel Electrique (MET) (princ)';
COMMENT ON COLUMN insee.logement_{census}.p_rp_elec IS 'Rés princ avec électricité (DOM) (princ)';
COMMENT ON COLUMN insee.logement_{census}.p_rp_eauch IS 'Rés princ avec eau chaude (DOM) (princ)';
COMMENT ON COLUMN insee.logement_{census}.p_rp_bdwc IS 'Rés princ avec Bain/Douche WC (DOM) (princ)';
COMMENT ON COLUMN insee.logement_{census}.p_rp_chos IS 'Rés princ avec chauffe-eau solaire (DOM) (princ)';
COMMENT ON COLUMN insee.logement_{census}.p_rp_clim IS 'Rés princ avec pièce climatisée (DOM) (princ)';
COMMENT ON COLUMN insee.logement_{census}.p_rp_ttegou IS 'Rés princ avec tout à l''égout (DOM) (princ)';
COMMENT ON COLUMN insee.logement_{census}.p_rp_garl IS 'Ménages au moins un parking (princ)';
COMMENT ON COLUMN insee.logement_{census}.p_rp_voit1p IS 'Ménages au moins une voiture (princ)';
COMMENT ON COLUMN insee.logement_{census}.p_rp_voit1 IS 'Ménages une voiture (princ)';
COMMENT ON COLUMN insee.logement_{census}.p_rp_voit2p IS 'Ménages deux voitures ou plus (princ)';
COMMENT ON COLUMN insee.logement_{census}.p_rp_habfor IS 'Habitations de fortune (DOM) (princ)';
COMMENT ON COLUMN insee.logement_{census}.p_rp_case IS 'Cases traditionnelles (DOM) (princ)';
COMMENT ON COLUMN insee.logement_{census}.p_rp_mibois IS 'Maisons ou Immeubles en bois (DOM) (princ)';
COMMENT ON COLUMN insee.logement_{census}.p_rp_midur IS 'Maisons ou Immeubles en dur (DOM) (princ)';

\copy insee.logement_{census} FROM '{fpath}' DELIMITER '{sep}' CSV HEADER;
