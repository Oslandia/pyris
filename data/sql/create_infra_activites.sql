-- activité résidents infra communale (IRIS)
DROP TABLE IF EXISTS insee.activite;

CREATE TABLE IF NOT EXISTS insee.activite (
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
  p13_pop1564 float,
  p13_pop1524 float,
  p13_pop2554 float,
  p13_pop5564 float,
  p13_h1564 float,
  p13_h1524 float,
  p13_h2554 float,
  p13_h5564 float,
  p13_f1564 float,
  p13_f1524 float,
  p13_f2554 float,
  p13_f5564 float,
  p13_act1564 float,
  p13_act1524 float,
  p13_act2554 float,
  p13_act5564 float,
  p13_hact1564 float,
  p13_hact1524 float,
  p13_hact2554 float,
  p13_hact5564 float,
  p13_fact1564 float,
  p13_fact1524 float,
  p13_fact2554 float,
  p13_fact5564 float,
  p13_actocc1564 float,
  p13_actocc1524 float,
  p13_actocc2554 float,
  p13_actocc5564 float,
  p13_hactocc1564 float,
  p13_hactocc1524 float,
  p13_hactocc2554 float,
  p13_hactocc5564 float,
  p13_factocc1564 float,
  p13_factocc1524 float,
  p13_factocc2554 float,
  p13_factocc5564 float,
  p13_chom1564 float,
  p13_chom1524 float,
  p13_chom2554 float,
  p13_chom5564 float,
  p13_hchom1564 float,
  p13_fchom1564 float,
  p13_inact1564 float,
  p13_hinact1564 float,
  p13_finact1564 float,
  p13_etud1564 float,
  p13_hetud1564 float,
  p13_fetud1564 float,
  p13_retr1564 float,
  p13_hretr1564 float,
  p13_fretr1564 float,
  p13_ainact1564 float,
  p13_hainact1564 float,
  p13_fainact1564 float,
  c13_act1564 float,
  c13_act1564_cs1 float,
  c13_act1564_cs2 float,
  c13_act1564_cs3 float,
  c13_act1564_cs4 float,
  c13_act1564_cs5 float,
  c13_act1564_cs6 float,
  c13_actocc1564 float,
  c13_actocc1564_cs1 float,
  c13_actocc1564_cs2 float,
  c13_actocc1564_cs3 float,
  c13_actocc1564_cs4 float,
  c13_actocc1564_cs5 float,
  c13_actocc1564_cs6 float,
  p13_actocc15p float,
  p13_hactocc15p float,
  p13_factocc15p float,
  p13_sal15p float,
  p13_hsal15p float,
  p13_fsal15p float,
  p13_nsal15p float,
  p13_hnsal15p float,
  p13_fnsal15p float,
  p13_actocc15p_tp float,
  p13_sal15p_tp float,
  p13_hsal15p_tp float,
  p13_fsal15p_tp float,
  p13_nsal15p_tp float,
  p13_sal15p_cdi float,
  p13_sal15p_cdd float,
  p13_sal15p_interim float,
  p13_sal15p_empaid float,
  p13_sal15p_appr float,
  p13_nsal15p_indep float,
  p13_nsal15p_employ float,
  p13_nsal15p_aidfam float,
  p13_actocc15p_ilt1 float,
  p13_actocc15p_ilt2p float,
  p13_actocc15p_ilt2 float,
  p13_actocc15p_ilt3 float,
  p13_actocc15p_ilt4 float,
  p13_actocc15p_ilt5 float,
  c13_actocc15p float,
  c13_actocc15p_pas float,
  c13_actocc15p_mar float,
  c13_actocc15p_drou float,
  c13_actocc15p_voit float,
  c13_actocc15p_tcom float
);


COMMENT ON TABLE insee.activite IS 'Activité des résidents à l''IRIS (2013)';

COMMENT ON COLUMN insee.activite.iris IS 'IRIS';
COMMENT ON COLUMN insee.activite.reg IS 'Région';
COMMENT ON COLUMN insee.activite.reg2016 IS 'Région 2016';
COMMENT ON COLUMN insee.activite.dep IS 'Département';
COMMENT ON COLUMN insee.activite.uu2010 IS 'Unité urbaine';
COMMENT ON COLUMN insee.activite.com IS 'Commune ou ARM';
COMMENT ON COLUMN insee.activite.libcom IS 'Libellé commune ou ARM';
COMMENT ON COLUMN insee.activite.triris IS 'TRIRIS';
COMMENT ON COLUMN insee.activite.grd_quart IS 'Grand quartier';
COMMENT ON COLUMN insee.activite.libiris IS 'Libellé de l''IRIS';
COMMENT ON COLUMN insee.activite.typ_iris IS 'Type d''IRIS';
COMMENT ON COLUMN insee.activite.modif_iris IS 'Modification de l''IRIS';
COMMENT ON COLUMN insee.activite.lab_iris IS 'Label de l''IRIS';

COMMENT ON COLUMN insee.activite.p13_pop1564 IS 'Pop 15-64 ans en 2013 (princ)';
COMMENT ON COLUMN insee.activite.p13_pop1524 IS 'Pop 15-24 ans en 2013 (princ)';
COMMENT ON COLUMN insee.activite.p13_pop2554 IS 'Pop 25-54 ans en 2013 (princ)';
COMMENT ON COLUMN insee.activite.p13_pop5564 IS 'Pop 55-64 ans en 2013 (princ)';
COMMENT ON COLUMN insee.activite.p13_h1564 IS 'Pop 15-64 ans Hommes en 2013 (princ)';
COMMENT ON COLUMN insee.activite.p13_h1524 IS 'Pop 15-24 ans Hommes en 2013 (princ)';
COMMENT ON COLUMN insee.activite.p13_h2554 IS 'Pop 25-54 ans Hommes en 2013 (princ)';
COMMENT ON COLUMN insee.activite.p13_h5564 IS 'Pop 55-64 ans Hommes en 2013 (princ)';
COMMENT ON COLUMN insee.activite.p13_f1564 IS 'Pop 15-64 ans Femmes en 2013 (princ)';
COMMENT ON COLUMN insee.activite.p13_f1524 IS 'Pop 15-24 ans Femmes en 2013 (princ)';
COMMENT ON COLUMN insee.activite.p13_f2554 IS 'Pop 25-54 ans Femmes en 2013 (princ)';
COMMENT ON COLUMN insee.activite.p13_f5564 IS 'Pop 55-64 ans Femmes en 2013 (princ)';
COMMENT ON COLUMN insee.activite.p13_act1564 IS 'Actifs 15-64 ans en 2013 (princ)';
COMMENT ON COLUMN insee.activite.p13_act1524 IS 'Actifs 15-24 ans en 2013 (princ)';
COMMENT ON COLUMN insee.activite.p13_act2554 IS 'Actifs 25-54 ans en 2013 (princ)';
COMMENT ON COLUMN insee.activite.p13_act5564 IS 'Actifs 55-64 ans en 2013 (princ)';
COMMENT ON COLUMN insee.activite.p13_hact1564 IS 'Actifs 15-64 ans Hommes en 2013 (princ)';
COMMENT ON COLUMN insee.activite.p13_hact1524 IS 'Actifs 15-24 ans Hommes en 2013 (princ)';
COMMENT ON COLUMN insee.activite.p13_hact2554 IS 'Actifs 25-54 ans Hommes en 2013 (princ)';
COMMENT ON COLUMN insee.activite.p13_hact5564 IS 'Actifs 55-64 ans Hommes en 2013 (princ)';
COMMENT ON COLUMN insee.activite.p13_fact1564 IS 'Actifs 15-64 ans Femmes en 2013 (princ)';
COMMENT ON COLUMN insee.activite.p13_fact1524 IS 'Actifs 15-24 ans Femmes en 2013 (princ)';
COMMENT ON COLUMN insee.activite.p13_fact2554 IS 'Actifs 25-54 ans Femmes en 2013 (princ)';
COMMENT ON COLUMN insee.activite.p13_fact5564 IS 'Actifs 55-64 ans Femmes en 2013 (princ)';
COMMENT ON COLUMN insee.activite.p13_actocc1564 IS 'Actifs occupés 15-64 ans en 2013 (princ)';
COMMENT ON COLUMN insee.activite.p13_actocc1524 IS 'Actifs occupés 15-24 ans en 2013 (princ)';
COMMENT ON COLUMN insee.activite.p13_actocc2554 IS 'Actifs occupés 25-54 ans en 2013 (princ)';
COMMENT ON COLUMN insee.activite.p13_actocc5564 IS 'Actifs occupés 55-64 ans en 2013 (princ)';
COMMENT ON COLUMN insee.activite.p13_hactocc1564 IS 'Actifs occupés 15-64 ans Hommes en 2013 (princ)';
COMMENT ON COLUMN insee.activite.p13_hactocc1524 IS 'Actifs occupés 15-24 ans Hommes en 2013 (princ)';
COMMENT ON COLUMN insee.activite.p13_hactocc2554 IS 'Actifs occupés 25-54 ans Hommes en 2013 (princ)';
COMMENT ON COLUMN insee.activite.p13_hactocc5564 IS 'Actifs occupés 55-64 ans Hommes en 2013 (princ)';
COMMENT ON COLUMN insee.activite.p13_factocc1564 IS 'Actifs occupés 15-64 ans Femmes en 2013 (princ)';
COMMENT ON COLUMN insee.activite.p13_factocc1524 IS 'Actifs occupés 15-24 ans Femmes en 2013 (princ)';
COMMENT ON COLUMN insee.activite.p13_factocc2554 IS 'Actifs occupés 25-54 ans Femmes en 2013 (princ)';
COMMENT ON COLUMN insee.activite.p13_factocc5564 IS 'Actifs occupés 55-64 ans Femmes en 2013 (princ)';
COMMENT ON COLUMN insee.activite.p13_chom1564 IS 'Chômeurs 15-64 ans en 2013 (princ)';
COMMENT ON COLUMN insee.activite.p13_chom1524 IS 'Chômeurs 15-24 ans en 2013 (princ)';
COMMENT ON COLUMN insee.activite.p13_chom2554 IS 'Chômeurs 25-54 ans en 2013 (princ)';
COMMENT ON COLUMN insee.activite.p13_chom5564 IS 'Chômeurs 55-64 ans en 2013 (princ)';
COMMENT ON COLUMN insee.activite.p13_hchom1564 IS 'Chômeurs 15-64 ans Hommes en 2013 (princ)';
COMMENT ON COLUMN insee.activite.p13_fchom1564 IS 'Chômeurs 15-64 ans Femmes en 2013 (princ)';
COMMENT ON COLUMN insee.activite.p13_inact1564 IS 'Inactifs 15-64 ans en 2013 (princ)';
COMMENT ON COLUMN insee.activite.p13_hinact1564 IS 'Inactifs 15-64 ans Hommes en 2013 (princ)';
COMMENT ON COLUMN insee.activite.p13_finact1564 IS 'Inactifs 15-64 ans Femmes en 2013 (princ)';
COMMENT ON COLUMN insee.activite.p13_etud1564 IS 'Elèv. Etud. Stag. non rémunérés 15-64 ans en 2013 (princ)';
COMMENT ON COLUMN insee.activite.p13_hetud1564 IS 'Elèv. Etud. Stag. non rémunérés 15-64 ans Hommes en 2013 (princ)';
COMMENT ON COLUMN insee.activite.p13_fetud1564 IS 'Elèv. Etud. Stag. non rémunérés 15-64 ans Femmes en 2013 (princ)';
COMMENT ON COLUMN insee.activite.p13_retr1564 IS 'Retraités Préretraités 15-64 ans en 2013 (princ)';
COMMENT ON COLUMN insee.activite.p13_hretr1564 IS 'Retraités Préretraités 15-64 ans Hommes en 2013 (princ)';
COMMENT ON COLUMN insee.activite.p13_fretr1564 IS 'Retraités Préretraités 15-64 ans Femmes en 2013 (princ)';
COMMENT ON COLUMN insee.activite.p13_ainact1564 IS 'Autres inactifs 15-64 ans en 2013 (princ)';
COMMENT ON COLUMN insee.activite.p13_hainact1564 IS 'Autres inactifs 15-64 ans Hommes en 2013 (princ)';
COMMENT ON COLUMN insee.activite.p13_fainact1564 IS 'Autres inactifs 15-64 ans Femmes en 2013 (princ)';
COMMENT ON COLUMN insee.activite.c13_act1564 IS 'Actifs 15-64 ans en 2013 (compl)';
COMMENT ON COLUMN insee.activite.c13_act1564_cs1 IS 'Actifs 15-64 ans Agriculteurs exploitants en 2013 (compl)';
COMMENT ON COLUMN insee.activite.c13_act1564_cs2 IS 'Actifs 15-64 ans Artisans, Comm., Chefs entr. en 2013 (compl)';
COMMENT ON COLUMN insee.activite.c13_act1564_cs3 IS 'Actifs 15-64 ans Cadres, Prof. intel. sup. en 2013 (compl)';
COMMENT ON COLUMN insee.activite.c13_act1564_cs4 IS 'Actifs 15-64 ans Prof. intermédiaires en 2013 (compl)';
COMMENT ON COLUMN insee.activite.c13_act1564_cs5 IS 'Actifs 15-64 ans Employés en 2013 (compl)';
COMMENT ON COLUMN insee.activite.c13_act1564_cs6 IS 'Actifs 15-64 ans Ouvriers en 2013 (compl)';
COMMENT ON COLUMN insee.activite.c13_actocc1564 IS 'Actifs occupés 15-64 ans en 2013 (compl)';
COMMENT ON COLUMN insee.activite.c13_actocc1564_cs1 IS 'Actifs occ 15-64 ans Agriculteurs exploitants en 2013 (compl)';
COMMENT ON COLUMN insee.activite.c13_actocc1564_cs2 IS 'Actifs occ 15-64 ans Artisans, Comm., Chefs entr. en 2013 (compl)';
COMMENT ON COLUMN insee.activite.c13_actocc1564_cs3 IS 'Actifs occ 15-64 ans Cadres Prof. intel. sup. en 2013 (compl)';
COMMENT ON COLUMN insee.activite.c13_actocc1564_cs4 IS 'Actifs occ 15-64 ans Prof. intermédiaires en 2013 (compl)';
COMMENT ON COLUMN insee.activite.c13_actocc1564_cs5 IS 'Actifs occupés 15-64 ans Employés en 2013 (compl)';
COMMENT ON COLUMN insee.activite.c13_actocc1564_cs6 IS 'Actifs occupés 15-64 ans Ouvriers en 2013 (compl)';
COMMENT ON COLUMN insee.activite.p13_actocc15p IS 'Actifs occupés 15 ans ou plus en 2013 (princ)';
COMMENT ON COLUMN insee.activite.p13_hactocc15p IS 'Actifs occupés 15 ans ou plus Hommes en 2013 (princ)';
COMMENT ON COLUMN insee.activite.p13_factocc15p IS 'Actifs occupés 15 ans ou plus Femmes en 2013 (princ)';
COMMENT ON COLUMN insee.activite.p13_sal15p IS 'Salariés 15 ans ou plus en 2013 (princ)';
COMMENT ON COLUMN insee.activite.p13_hsal15p IS 'Salariés 15 ans ou plus Hommes en 2013 (princ)';
COMMENT ON COLUMN insee.activite.p13_fsal15p IS 'Salariés 15 ans ou plus Femmes en 2013 (princ)';
COMMENT ON COLUMN insee.activite.p13_nsal15p IS 'Non-salariés 15 ans ou plus en 2013 (princ)';
COMMENT ON COLUMN insee.activite.p13_hnsal15p IS 'Non-salariés 15 ans ou plus Hommes en 2013 (princ)';
COMMENT ON COLUMN insee.activite.p13_fnsal15p IS 'Non-salariés 15 ans ou plus Femmes en 2013 (princ)';
COMMENT ON COLUMN insee.activite.p13_actocc15p_tp IS 'Actifs occ 15 ans ou plus TP en 2013 (princ)';
COMMENT ON COLUMN insee.activite.p13_sal15p_tp IS 'Salariés 15 ans ou plus TP en 2013 (princ)';
COMMENT ON COLUMN insee.activite.p13_hsal15p_tp IS 'Salariés 15 ans ou plus TP Hommes en 2013 (princ)';
COMMENT ON COLUMN insee.activite.p13_fsal15p_tp IS 'Salariés 15 ans ou plus TP Femmes en 2013 (princ)';
COMMENT ON COLUMN insee.activite.p13_nsal15p_tp IS 'Non-salariés 15 ans ou plus TP en 2013 (princ)';
COMMENT ON COLUMN insee.activite.p13_sal15p_cdi IS 'Salariés 15 ans ou plus Fonct publ, CDI en 2013 (princ)';
COMMENT ON COLUMN insee.activite.p13_sal15p_cdd IS 'Salariés 15 ans ou plus CDD en 2013 (princ)';
COMMENT ON COLUMN insee.activite.p13_sal15p_interim IS 'Salariés 15 ans ou plus Intérim en 2013 (princ)';
COMMENT ON COLUMN insee.activite.p13_sal15p_empaid IS 'Salariés 15 ans ou plus Emplois aidés en 2013 (princ)';
COMMENT ON COLUMN insee.activite.p13_sal15p_appr IS 'Salariés 15 ans ou plus Apprentissage - Stage en 2013 (princ)';
COMMENT ON COLUMN insee.activite.p13_nsal15p_indep IS 'Non-salariés 15 ans ou plus Indépendants en 2013 (princ)';
COMMENT ON COLUMN insee.activite.p13_nsal15p_employ IS 'Non-salariés 15 ans ou plus Employeurs en 2013 (princ)';
COMMENT ON COLUMN insee.activite.p13_nsal15p_aidfam IS 'Non-salariés 15 ans ou plus Aides familiaux en 2013 (princ)';
COMMENT ON COLUMN insee.activite.p13_actocc15p_ilt1 IS 'Actif occ 15 ans ou plus travaille commune résidence en 2013 (princ)';
COMMENT ON COLUMN insee.activite.p13_actocc15p_ilt2p IS 'Actif occ 15 ans ou plus travaille autre commune que commune résidence en 2013 (princ)';
COMMENT ON COLUMN insee.activite.p13_actocc15p_ilt2 IS 'Actif occ 15 ans ou plus travaille autre commune même dépt résidence en 2013 (princ)';
COMMENT ON COLUMN insee.activite.p13_actocc15p_ilt3 IS 'Actif occ 15 ans ou plus travaille autre dépt même région résidence en 2013 (princ)';
COMMENT ON COLUMN insee.activite.p13_actocc15p_ilt4 IS 'Actif occ 15 ans ou plus travaille autre région en métropole en 2013 (princ)';
COMMENT ON COLUMN insee.activite.p13_actocc15p_ilt5 IS 'Actif occ 15 ans ou plus travaille autre région hors métropole en 2013 (princ)';
COMMENT ON COLUMN insee.activite.c13_actocc15p IS 'Actif occ 15 ans ou plus en 2013 (compl)';
COMMENT ON COLUMN insee.activite.c13_actocc15p_pas IS 'Actif occ 15 ans ou plus pas de transport en 2013 (compl)';
COMMENT ON COLUMN insee.activite.c13_actocc15p_mar IS 'Actif occ 15 ans ou plus marche à pied en 2013 (compl)';
COMMENT ON COLUMN insee.activite.c13_actocc15p_drou IS 'Actif occ 15 ans ou plus deux roues en 2013 (compl)';
COMMENT ON COLUMN insee.activite.c13_actocc15p_voit IS 'Actif occ 15 ans ou plus voiture, camion en 2013 (compl)';
COMMENT ON COLUMN insee.activite.c13_actocc15p_tcom IS 'Actif occ 15 ans ou plus transport en commun en 2013 (compl)';
