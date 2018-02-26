-- logement infra communale (IRIS)
DROP TABLE IF EXISTS insee.logement;

CREATE TABLE IF NOT EXISTS insee.logement (
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
  p13_log float,
  p13_rp float,
  p13_rsecocc float,
  p13_logvac float,
  p13_maison float,
  p13_appart float,
  p13_rp_1p float,
  p13_rp_2p float,
  p13_rp_3p float,
  p13_rp_4p float,
  p13_rp_5pp float,
  p13_nbpi_rp float,
  p13_rpmaison float,
  p13_nbpi_rpmaison float,
  p13_rpappart float,
  p13_nbpi_rpappart float,
  p13_rp_m30m2 float,
  p13_rp_3040m2 float,
  p13_rp_4060m2 float,
  p13_rp_6080m2 float,
  p13_rp_80100m2 float,
  p13_rp_100120m2 float,
  p13_rp_120m2p float,
  p13_rp_achtot float,
  p13_rp_ach19 float,
  p13_rp_ach45 float,
  p13_rp_ach70 float,
  p13_rp_ach90 float,
  p13_rp_ach05 float,
  p13_rp_ach10 float,
  p13_rpmaison_achtot float,
  p13_rpmaison_ach19 float,
  p13_rpmaison_ach45 float,
  p13_rpmaison_ach70 float,
  p13_rpmaison_ach90 float,
  p13_rpmaison_ach05 float,
  p13_rpmaison_ach10 float,
  p13_rpappart_achtot float,
  p13_rpappart_ach19 float,
  p13_rpappart_ach45 float,
  p13_rpappart_ach70 float,
  p13_rpappart_ach90 float,
  p13_rpappart_ach05 float,
  p13_rpappart_ach10 float,
  p13_men float,
  p13_men_anem0002 float,
  p13_men_anem0204 float,
  p13_men_anem0509 float,
  p13_men_anem10p float,
  p13_pmen float,
  p13_pmen_anem0002 float,
  p13_pmen_anem0204 float,
  p13_pmen_anem0509 float,
  p13_pmen_anem10p float,
  p13_nbpi_rp_anem0002 float,
  p13_nbpi_rp_anem0204 float,
  p13_nbpi_rp_anem0509 float,
  p13_nbpi_rp_anem10p float,
  p13_rp_prop float,
  p13_rp_loc float,
  p13_rp_lochlmv float,
  p13_rp_grat float,
  p13_nper_rp float,
  p13_nper_rp_prop float,
  p13_nper_rp_loc float,
  p13_nper_rp_lochlmv float,
  p13_nper_rp_grat float,
  p13_anem_rp float,
  p13_anem_rp_prop float,
  p13_anem_rp_loc float,
  p13_anem_rp_lochlmv float,
  p13_anem_rp_grat float,
  p13_rp_sdb float,
  p13_rp_cccoll float,
  p13_rp_ccind float,
  p13_rp_cindelec float,
  p13_rp_elec float,
  p13_rp_eauch float,
  p13_rp_bdwc float,
  p13_rp_chos float,
  p13_rp_clim float,
  p13_rp_ttegou float,
  p13_rp_garl float,
  p13_rp_voit1p float,
  p13_rp_voit1 float,
  p13_rp_voit2p float,
  p13_rp_habfor float,
  p13_rp_case float,
  p13_rp_mibois float,
  p13_rp_midur float
);


COMMENT ON TABLE insee.logement IS 'logement à l''IRIS (2013)';

COMMENT ON COLUMN insee.logement.iris IS 'IRIS';
COMMENT ON COLUMN insee.logement.reg IS 'Région';
COMMENT ON COLUMN insee.logement.reg2016 IS 'Région 2016';
COMMENT ON COLUMN insee.logement.dep IS 'Département';
COMMENT ON COLUMN insee.logement.uu2010 IS 'Unité urbaine';
COMMENT ON COLUMN insee.logement.com IS 'Commune ou ARM';
COMMENT ON COLUMN insee.logement.libcom IS 'Libellé commune ou ARM';
COMMENT ON COLUMN insee.logement.triris IS 'TRIRIS';
COMMENT ON COLUMN insee.logement.grd_quart IS 'Grand quartier';
COMMENT ON COLUMN insee.logement.libiris IS 'Libellé de l''IRIS';
COMMENT ON COLUMN insee.logement.typ_iris IS 'Type d''IRIS';
COMMENT ON COLUMN insee.logement.modif_iris IS 'Modification de l''IRIS';
COMMENT ON COLUMN insee.logement.lab_iris IS 'Label de l''IRIS';

COMMENT ON COLUMN insee.logement.p13_log IS 'Logements en 2013 (princ)';
COMMENT ON COLUMN insee.logement.p13_rp IS 'Résidences principales en 2013 (princ)';
COMMENT ON COLUMN insee.logement.p13_rsecocc IS 'Rés secondaires et logts occasionnels en 2013 (princ)';
COMMENT ON COLUMN insee.logement.p13_logvac IS 'Logements vacants en 2013 (princ)';
COMMENT ON COLUMN insee.logement.p13_maison IS 'Maisons en 2013 (princ)';
COMMENT ON COLUMN insee.logement.p13_appart IS 'Appartements en 2013 (princ)';
COMMENT ON COLUMN insee.logement.p13_rp_1p IS 'Rés princ 1 pièce en 2013 (princ)';
COMMENT ON COLUMN insee.logement.p13_rp_2p IS 'Rés princ 2 pièces en 2013 (princ)';
COMMENT ON COLUMN insee.logement.p13_rp_3p IS 'Rés princ 3 pièces en 2013 (princ)';
COMMENT ON COLUMN insee.logement.p13_rp_4p IS 'Rés princ 4 pièces en 2013 (princ)';
COMMENT ON COLUMN insee.logement.p13_rp_5pp IS 'Rés princ 5 pièces ou plus en 2013 (princ)';
COMMENT ON COLUMN insee.logement.p13_nbpi_rp IS 'Pièces rés princ en 2013 (princ)';
COMMENT ON COLUMN insee.logement.p13_rpmaison IS 'Rés princ type maison en 2013 (princ)';
COMMENT ON COLUMN insee.logement.p13_nbpi_rpmaison IS 'Pièces rés princ type maison en 2013 (princ)';
COMMENT ON COLUMN insee.logement.p13_rpappart IS 'Rés princ type appartement en 2013 (princ)';
COMMENT ON COLUMN insee.logement.p13_nbpi_rpappart IS 'Pièces rés princ type appartement en 2013 (princ)';
COMMENT ON COLUMN insee.logement.p13_rp_m30m2 IS 'Rés princ de moins de 30 m2 en 2013 (princ)';
COMMENT ON COLUMN insee.logement.p13_rp_3040m2 IS 'Rés princ de 30 à moins de 40 m2 en 2013 (princ)';
COMMENT ON COLUMN insee.logement.p13_rp_4060m2 IS 'Rés princ de 40 à moins de 60 m2 en 2013 (princ)';
COMMENT ON COLUMN insee.logement.p13_rp_6080m2 IS 'Rés princ de 60 à moins de 80 m2 en 2013 (princ)';
COMMENT ON COLUMN insee.logement.p13_rp_80100m2 IS 'Rés princ de 80 à moins de 100 m2 en 2013 (princ)';
COMMENT ON COLUMN insee.logement.p13_rp_100120m2 IS 'Rés princ de 100 à moins de 120 m2 en 2013 (princ)';
COMMENT ON COLUMN insee.logement.p13_rp_120m2p IS 'Rés princ de 120 m2 ou plus en 2013 (princ)';
COMMENT ON COLUMN insee.logement.p13_rp_achtot IS 'Rés princ avt 2011 en 2013 (princ) ';
COMMENT ON COLUMN insee.logement.p13_rp_ach19 IS 'Rés princ avt 1919 en 2013 (princ) ';
COMMENT ON COLUMN insee.logement.p13_rp_ach45 IS 'Rés princ 1919 à 1945 en 2013 (princ) ';
COMMENT ON COLUMN insee.logement.p13_rp_ach70 IS 'Rés princ 1946 à 1970 en 2013 (princ) ';
COMMENT ON COLUMN insee.logement.p13_rp_ach90 IS 'Rés princ 1971 à 1990 en 2013 (princ) ';
COMMENT ON COLUMN insee.logement.p13_rp_ach05 IS 'Rés princ 1991 à 2005 en 2013 (princ) ';
COMMENT ON COLUMN insee.logement.p13_rp_ach10 IS 'Rés princ 2006 à 2010 en 2013 (princ) ';
COMMENT ON COLUMN insee.logement.p13_rpmaison_achtot IS 'Rés princ Type maison avt 2011 en 2013 (princ) ';
COMMENT ON COLUMN insee.logement.p13_rpmaison_ach19 IS 'Rés princ Type maison avt 1919 en 2013 (princ) ';
COMMENT ON COLUMN insee.logement.p13_rpmaison_ach45 IS 'Rés princ Type maison 1919 à 1945 en 2013 (princ) ';
COMMENT ON COLUMN insee.logement.p13_rpmaison_ach70 IS 'Rés princ Type maison 1946 à 1970 en 2013 (princ) ';
COMMENT ON COLUMN insee.logement.p13_rpmaison_ach90 IS 'Rés princ Type maison 1971 à 1990 en 2013 (princ) ';
COMMENT ON COLUMN insee.logement.p13_rpmaison_ach05 IS 'Rés princ Type maison 1991 à 2005 en 2013 (princ) ';
COMMENT ON COLUMN insee.logement.p13_rpmaison_ach10 IS 'Rés princ Type maison 2006 à 2010 en 2013 (princ) ';
COMMENT ON COLUMN insee.logement.p13_rpappart_achtot IS 'Rés princ Type appart avt 2011 en 2013 (princ) ';
COMMENT ON COLUMN insee.logement.p13_rpappart_ach19 IS 'Rés princ Type appart avt 1919 en 2013 (princ) ';
COMMENT ON COLUMN insee.logement.p13_rpappart_ach45 IS 'Rés princ Type appart 1919 à 1945 en 2013 (princ) ';
COMMENT ON COLUMN insee.logement.p13_rpappart_ach70 IS 'Rés princ Type appart 1946 à 1970 en 2013 (princ) ';
COMMENT ON COLUMN insee.logement.p13_rpappart_ach90 IS 'Rés princ Type appart 1971 à 1990 en 2013 (princ) ';
COMMENT ON COLUMN insee.logement.p13_rpappart_ach05 IS 'Rés princ Type appart 1991 à 2005 en 2013 (princ) ';
COMMENT ON COLUMN insee.logement.p13_rpappart_ach10 IS 'Rés princ Type appart 2006 à 2010 en 2013 (princ) ';
COMMENT ON COLUMN insee.logement.p13_men IS 'Ménages en 2013 (princ)';
COMMENT ON COLUMN insee.logement.p13_men_anem0002 IS 'Ménages emménagés moins 2 ans en 2013 (princ)';
COMMENT ON COLUMN insee.logement.p13_men_anem0204 IS 'Ménages emménagés entre 2-4 ans en 2013 (princ)';
COMMENT ON COLUMN insee.logement.p13_men_anem0509 IS 'Ménages emménagés entre 5-9 ans en 2013 (princ)';
COMMENT ON COLUMN insee.logement.p13_men_anem10p IS 'Ménages emménagés depuis 10 ans ou plus en 2013 (princ)';
COMMENT ON COLUMN insee.logement.p13_pmen IS 'Pop ménages en 2013 (princ)';
COMMENT ON COLUMN insee.logement.p13_pmen_anem0002 IS 'Pop mén emménagés moins 2 ans en 2013 (princ)';
COMMENT ON COLUMN insee.logement.p13_pmen_anem0204 IS 'Pop mén emménagés entre 2-4 ans en 2013 (princ)';
COMMENT ON COLUMN insee.logement.p13_pmen_anem0509 IS 'Pop mén emménagés entre 5-9 ans en 2013 (princ)';
COMMENT ON COLUMN insee.logement.p13_pmen_anem10p IS 'Pop mén emménagés depuis 10 ans ou plus en 2013 (princ)';
COMMENT ON COLUMN insee.logement.p13_nbpi_rp_anem0002 IS 'Pièces Rés princ Mén. emménagés moins 2 ans en 2013 (princ)';
COMMENT ON COLUMN insee.logement.p13_nbpi_rp_anem0204 IS 'Pièces Rés princ Mén. emménagés entre 2-4 ans en 2013 (princ)';
COMMENT ON COLUMN insee.logement.p13_nbpi_rp_anem0509 IS 'Pièces Rés princ Mén. emménagés entre 5-9 ans en 2013 (princ)';
COMMENT ON COLUMN insee.logement.p13_nbpi_rp_anem10p IS 'Pièces Rés princ Mén. emménagés depuis 10 ans ou plus en 2013 (princ)';
COMMENT ON COLUMN insee.logement.p13_rp_prop IS 'Rés princ occupées Propriétaires en 2013 (princ)';
COMMENT ON COLUMN insee.logement.p13_rp_loc IS 'Rés princ occupées Locataires en 2013 (princ)';
COMMENT ON COLUMN insee.logement.p13_rp_lochlmv IS 'Rés princ HLM louée vide en 2013 (princ)';
COMMENT ON COLUMN insee.logement.p13_rp_grat IS 'Rés princ logé gratuit en 2013 (princ)';
COMMENT ON COLUMN insee.logement.p13_nper_rp IS 'Personnes Rés princ en 2013 (princ)';
COMMENT ON COLUMN insee.logement.p13_nper_rp_prop IS 'Pers Rés princ occupées Propriétaires en 2013 (princ)';
COMMENT ON COLUMN insee.logement.p13_nper_rp_loc IS 'Pers Rés princ occupées Locataires en 2013 (princ)';
COMMENT ON COLUMN insee.logement.p13_nper_rp_lochlmv IS 'Pers Rés princ HLM louées vides en 2013 (princ)';
COMMENT ON COLUMN insee.logement.p13_nper_rp_grat IS 'Pers Rés princ occupées gratuit en 2013 (princ)';
COMMENT ON COLUMN insee.logement.p13_anem_rp IS 'Anc tot Emméngt Rés princ (années) en 2013 (princ)';
COMMENT ON COLUMN insee.logement.p13_anem_rp_prop IS 'Anc tot Emméngt Rés princ occ par Propriétaires (années) en 2013 (princ)';
COMMENT ON COLUMN insee.logement.p13_anem_rp_loc IS 'Anc tot Emméngt Rés princ occ par Locataires (années) en 2013 (princ)';
COMMENT ON COLUMN insee.logement.p13_anem_rp_lochlmv IS 'Anc tot Emméngt Rés princ HLM louées vides (années) en 2013 (princ)';
COMMENT ON COLUMN insee.logement.p13_anem_rp_grat IS 'Anc tot Emméngt Rés princ occ gratuit (années) en 2013 (princ)';
COMMENT ON COLUMN insee.logement.p13_rp_sdb IS 'Rés princ SDB baignoire douche (MET) en 2013 (princ)';
COMMENT ON COLUMN insee.logement.p13_rp_cccoll IS 'Rés princ Chauffage Central Collectif (MET) en 2013 (princ)';
COMMENT ON COLUMN insee.logement.p13_rp_ccind IS 'Rés princ Chauffage Central Individuel (MET) en 2013 (princ)';
COMMENT ON COLUMN insee.logement.p13_rp_cindelec IS 'Rés princ Chauffage Individuel Electrique (MET) en 2013 (princ)';
COMMENT ON COLUMN insee.logement.p13_rp_elec IS 'Rés princ avec électricité (DOM) en 2013 (princ)';
COMMENT ON COLUMN insee.logement.p13_rp_eauch IS 'Rés princ avec eau chaude (DOM) en 2013 (princ)';
COMMENT ON COLUMN insee.logement.p13_rp_bdwc IS 'Rés princ avec Bain/Douche WC (DOM) en 2013 (princ)';
COMMENT ON COLUMN insee.logement.p13_rp_chos IS 'Rés princ avec chauffe-eau solaire (DOM) en 2013 (princ)';
COMMENT ON COLUMN insee.logement.p13_rp_clim IS 'Rés princ avec pièce climatisée (DOM) en 2013 (princ)';
COMMENT ON COLUMN insee.logement.p13_rp_ttegou IS 'Rés princ avec tout à l''égout (DOM) en 2013 (princ)';
COMMENT ON COLUMN insee.logement.p13_rp_garl IS 'Ménages au moins un parking en 2013 (princ)';
COMMENT ON COLUMN insee.logement.p13_rp_voit1p IS 'Ménages au moins une voiture en 2013 (princ)';
COMMENT ON COLUMN insee.logement.p13_rp_voit1 IS 'Ménages une voiture en 2013 (princ)';
COMMENT ON COLUMN insee.logement.p13_rp_voit2p IS 'Ménages deux voitures ou plus en 2013 (princ)';
COMMENT ON COLUMN insee.logement.p13_rp_habfor IS 'Habitations de fortune (DOM) en 2013 (princ)';
COMMENT ON COLUMN insee.logement.p13_rp_case IS 'Cases traditionnelles (DOM) en 2013 (princ)';
COMMENT ON COLUMN insee.logement.p13_rp_mibois IS 'Maisons ou Immeubles en bois (DOM) en 2013 (princ)';
COMMENT ON COLUMN insee.logement.p13_rp_midur IS 'Maisons ou Immeubles en dur (DOM) en 2013 (princ)';
