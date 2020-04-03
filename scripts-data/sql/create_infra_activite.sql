-- activité résidents infra communale (IRIS)
DROP TABLE IF EXISTS insee.activite_{census};
CREATE TABLE IF NOT EXISTS insee.activite_{census} (
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
  p_pop1564 float,
  p_pop1524 float,
  p_pop2554 float,
  p_pop5564 float,
  p_h1564 float,
  p_h1524 float,
  p_h2554 float,
  p_h5564 float,
  p_f1564 float,
  p_f1524 float,
  p_f2554 float,
  p_f5564 float,
  p_act1564 float,
  p_act1524 float,
  p_act2554 float,
  p_act5564 float,
  p_hact1564 float,
  p_hact1524 float,
  p_hact2554 float,
  p_hact5564 float,
  p_fact1564 float,
  p_fact1524 float,
  p_fact2554 float,
  p_fact5564 float,
  p_actocc1564 float,
  p_actocc1524 float,
  p_actocc2554 float,
  p_actocc5564 float,
  p_hactocc1564 float,
  p_hactocc1524 float,
  p_hactocc2554 float,
  p_hactocc5564 float,
  p_factocc1564 float,
  p_factocc1524 float,
  p_factocc2554 float,
  p_factocc5564 float,
  p_chom1564 float,
  p_chom1524 float,
  p_chom2554 float,
  p_chom5564 float,
  p_hchom1564 float,
  p_fchom1564 float,
  p_inact1564 float,
  p_hinact1564 float,
  p_finact1564 float,
  p_etud1564 float,
  p_hetud1564 float,
  p_fetud1564 float,
  p_retr1564 float,
  p_hretr1564 float,
  p_fretr1564 float,
  p_ainact1564 float,
  p_hainact1564 float,
  p_fainact1564 float,
  c_act1564 float,
  c_act1564_cs1 float,
  c_act1564_cs2 float,
  c_act1564_cs3 float,
  c_act1564_cs4 float,
  c_act1564_cs5 float,
  c_act1564_cs6 float,
  c_actocc1564 float,
  c_actocc1564_cs1 float,
  c_actocc1564_cs2 float,
  c_actocc1564_cs3 float,
  c_actocc1564_cs4 float,
  c_actocc1564_cs5 float,
  c_actocc1564_cs6 float,
  p_actocc15p float,
  p_hactocc15p float,
  p_factocc15p float,
  p_sal15p float,
  p_hsal15p float,
  p_fsal15p float,
  p_nsal15p float,
  p_hnsal15p float,
  p_fnsal15p float,
  p_actocc15p_tp float,
  p_sal15p_tp float,
  p_hsal15p_tp float,
  p_fsal15p_tp float,
  p_nsal15p_tp float,
  p_sal15p_cdi float,
  p_sal15p_cdd float,
  p_sal15p_interim float,
  p_sal15p_empaid float,
  p_sal15p_appr float,
  p_nsal15p_indep float,
  p_nsal15p_employ float,
  p_nsal15p_aidfam float,
  p_actocc15p_ilt1 float,
  p_actocc15p_ilt2p float,
  p_actocc15p_ilt2 float,
  p_actocc15p_ilt3 float,
  p_actocc15p_ilt4 float,
  p_actocc15p_ilt5 float,
  c_actocc15p float,
  c_actocc15p_pas float,
  c_actocc15p_mar float,
  c_actocc15p_drou float,
  c_actocc15p_voit float,
  c_actocc15p_tcom float
);

create index activite_{census}_dep_idx ON insee.activite_{census} USING btree (dep);
create index activite_{census}_com_idx ON insee.activite_{census} USING btree (com);
create index activite_{census}_libcom_idx ON insee.activite_{census} USING btree (libcom);

COMMENT ON TABLE insee.activite_{census} IS 'Activité des résidents à l''IRIS (source Insee), census {census}';

COMMENT ON COLUMN insee.activite_{census}.iris IS 'IRIS';
COMMENT ON COLUMN insee.activite_{census}.reg IS 'Région (nouvelle)';
COMMENT ON COLUMN insee.activite_{census}.dep IS 'Département';
COMMENT ON COLUMN insee.activite_{census}.uu2010 IS 'Unité urbaine';
COMMENT ON COLUMN insee.activite_{census}.com IS 'Commune ou ARM';
COMMENT ON COLUMN insee.activite_{census}.libcom IS 'Libellé commune ou ARM';
COMMENT ON COLUMN insee.activite_{census}.triris IS 'TRIRIS';
COMMENT ON COLUMN insee.activite_{census}.grd_quart IS 'Grand quartier';
COMMENT ON COLUMN insee.activite_{census}.libiris IS 'Libellé de l''IRIS';
COMMENT ON COLUMN insee.activite_{census}.typ_iris IS 'Type d''IRIS';
COMMENT ON COLUMN insee.activite_{census}.modif_iris IS 'Modification de l''IRIS';
COMMENT ON COLUMN insee.activite_{census}.lab_iris IS 'Label de l''IRIS';

COMMENT ON COLUMN insee.activite_{census}.p_pop1564 IS 'Pop 15-64 ans (princ)';
COMMENT ON COLUMN insee.activite_{census}.p_pop1524 IS 'Pop 15-24 ans (princ)';
COMMENT ON COLUMN insee.activite_{census}.p_pop2554 IS 'Pop 25-54 ans (princ)';
COMMENT ON COLUMN insee.activite_{census}.p_pop5564 IS 'Pop 55-64 ans (princ)';
COMMENT ON COLUMN insee.activite_{census}.p_h1564 IS 'Pop 15-64 ans Hommes (princ)';
COMMENT ON COLUMN insee.activite_{census}.p_h1524 IS 'Pop 15-24 ans Hommes (princ)';
COMMENT ON COLUMN insee.activite_{census}.p_h2554 IS 'Pop 25-54 ans Hommes (princ)';
COMMENT ON COLUMN insee.activite_{census}.p_h5564 IS 'Pop 55-64 ans Hommes (princ)';
COMMENT ON COLUMN insee.activite_{census}.p_f1564 IS 'Pop 15-64 ans Femmes (princ)';
COMMENT ON COLUMN insee.activite_{census}.p_f1524 IS 'Pop 15-24 ans Femmes (princ)';
COMMENT ON COLUMN insee.activite_{census}.p_f2554 IS 'Pop 25-54 ans Femmes (princ)';
COMMENT ON COLUMN insee.activite_{census}.p_f5564 IS 'Pop 55-64 ans Femmes (princ)';
COMMENT ON COLUMN insee.activite_{census}.p_act1564 IS 'Actifs 15-64 ans (princ)';
COMMENT ON COLUMN insee.activite_{census}.p_act1524 IS 'Actifs 15-24 ans (princ)';
COMMENT ON COLUMN insee.activite_{census}.p_act2554 IS 'Actifs 25-54 ans (princ)';
COMMENT ON COLUMN insee.activite_{census}.p_act5564 IS 'Actifs 55-64 ans (princ)';
COMMENT ON COLUMN insee.activite_{census}.p_hact1564 IS 'Actifs 15-64 ans Hommes (princ)';
COMMENT ON COLUMN insee.activite_{census}.p_hact1524 IS 'Actifs 15-24 ans Hommes (princ)';
COMMENT ON COLUMN insee.activite_{census}.p_hact2554 IS 'Actifs 25-54 ans Hommes (princ)';
COMMENT ON COLUMN insee.activite_{census}.p_hact5564 IS 'Actifs 55-64 ans Hommes (princ)';
COMMENT ON COLUMN insee.activite_{census}.p_fact1564 IS 'Actifs 15-64 ans Femmes (princ)';
COMMENT ON COLUMN insee.activite_{census}.p_fact1524 IS 'Actifs 15-24 ans Femmes (princ)';
COMMENT ON COLUMN insee.activite_{census}.p_fact2554 IS 'Actifs 25-54 ans Femmes (princ)';
COMMENT ON COLUMN insee.activite_{census}.p_fact5564 IS 'Actifs 55-64 ans Femmes (princ)';
COMMENT ON COLUMN insee.activite_{census}.p_actocc1564 IS 'Actifs occupés 15-64 ans (princ)';
COMMENT ON COLUMN insee.activite_{census}.p_actocc1524 IS 'Actifs occupés 15-24 ans (princ)';
COMMENT ON COLUMN insee.activite_{census}.p_actocc2554 IS 'Actifs occupés 25-54 ans (princ)';
COMMENT ON COLUMN insee.activite_{census}.p_actocc5564 IS 'Actifs occupés 55-64 ans (princ)';
COMMENT ON COLUMN insee.activite_{census}.p_hactocc1564 IS 'Actifs occupés 15-64 ans Hommes (princ)';
COMMENT ON COLUMN insee.activite_{census}.p_hactocc1524 IS 'Actifs occupés 15-24 ans Hommes (princ)';
COMMENT ON COLUMN insee.activite_{census}.p_hactocc2554 IS 'Actifs occupés 25-54 ans Hommes (princ)';
COMMENT ON COLUMN insee.activite_{census}.p_hactocc5564 IS 'Actifs occupés 55-64 ans Hommes (princ)';
COMMENT ON COLUMN insee.activite_{census}.p_factocc1564 IS 'Actifs occupés 15-64 ans Femmes (princ)';
COMMENT ON COLUMN insee.activite_{census}.p_factocc1524 IS 'Actifs occupés 15-24 ans Femmes (princ)';
COMMENT ON COLUMN insee.activite_{census}.p_factocc2554 IS 'Actifs occupés 25-54 ans Femmes (princ)';
COMMENT ON COLUMN insee.activite_{census}.p_factocc5564 IS 'Actifs occupés 55-64 ans Femmes (princ)';
COMMENT ON COLUMN insee.activite_{census}.p_chom1564 IS 'Chômeurs 15-64 ans (princ)';
COMMENT ON COLUMN insee.activite_{census}.p_chom1524 IS 'Chômeurs 15-24 ans (princ)';
COMMENT ON COLUMN insee.activite_{census}.p_chom2554 IS 'Chômeurs 25-54 ans (princ)';
COMMENT ON COLUMN insee.activite_{census}.p_chom5564 IS 'Chômeurs 55-64 ans (princ)';
COMMENT ON COLUMN insee.activite_{census}.p_hchom1564 IS 'Chômeurs 15-64 ans Hommes (princ)';
COMMENT ON COLUMN insee.activite_{census}.p_fchom1564 IS 'Chômeurs 15-64 ans Femmes (princ)';
COMMENT ON COLUMN insee.activite_{census}.p_inact1564 IS 'Inactifs 15-64 ans (princ)';
COMMENT ON COLUMN insee.activite_{census}.p_hinact1564 IS 'Inactifs 15-64 ans Hommes (princ)';
COMMENT ON COLUMN insee.activite_{census}.p_finact1564 IS 'Inactifs 15-64 ans Femmes (princ)';
COMMENT ON COLUMN insee.activite_{census}.p_etud1564 IS 'Elèv. Etud. Stag. non rémunérés 15-64 ans (princ)';
COMMENT ON COLUMN insee.activite_{census}.p_hetud1564 IS 'Elèv. Etud. Stag. non rémunérés 15-64 ans Hommes (princ)';
COMMENT ON COLUMN insee.activite_{census}.p_fetud1564 IS 'Elèv. Etud. Stag. non rémunérés 15-64 ans Femmes (princ)';
COMMENT ON COLUMN insee.activite_{census}.p_retr1564 IS 'Retraités Préretraités 15-64 ans (princ)';
COMMENT ON COLUMN insee.activite_{census}.p_hretr1564 IS 'Retraités Préretraités 15-64 ans Hommes (princ)';
COMMENT ON COLUMN insee.activite_{census}.p_fretr1564 IS 'Retraités Préretraités 15-64 ans Femmes (princ)';
COMMENT ON COLUMN insee.activite_{census}.p_ainact1564 IS 'Autres inactifs 15-64 ans (princ)';
COMMENT ON COLUMN insee.activite_{census}.p_hainact1564 IS 'Autres inactifs 15-64 ans Hommes (princ)';
COMMENT ON COLUMN insee.activite_{census}.p_fainact1564 IS 'Autres inactifs 15-64 ans Femmes (princ)';
COMMENT ON COLUMN insee.activite_{census}.c_act1564 IS 'Actifs 15-64 ans (compl)';
COMMENT ON COLUMN insee.activite_{census}.c_act1564_cs1 IS 'Actifs 15-64 ans Agriculteurs exploitants (compl)';
COMMENT ON COLUMN insee.activite_{census}.c_act1564_cs2 IS 'Actifs 15-64 ans Artisans, Comm., Chefs entr. (compl)';
COMMENT ON COLUMN insee.activite_{census}.c_act1564_cs3 IS 'Actifs 15-64 ans Cadres, Prof. intel. sup. (compl)';
COMMENT ON COLUMN insee.activite_{census}.c_act1564_cs4 IS 'Actifs 15-64 ans Prof. intermédiaires (compl)';
COMMENT ON COLUMN insee.activite_{census}.c_act1564_cs5 IS 'Actifs 15-64 ans Employés (compl)';
COMMENT ON COLUMN insee.activite_{census}.c_act1564_cs6 IS 'Actifs 15-64 ans Ouvriers (compl)';
COMMENT ON COLUMN insee.activite_{census}.c_actocc1564 IS 'Actifs occupés 15-64 ans (compl)';
COMMENT ON COLUMN insee.activite_{census}.c_actocc1564_cs1 IS 'Actifs occ 15-64 ans Agriculteurs exploitants (compl)';
COMMENT ON COLUMN insee.activite_{census}.c_actocc1564_cs2 IS 'Actifs occ 15-64 ans Artisans, Comm., Chefs entr. (compl)';
COMMENT ON COLUMN insee.activite_{census}.c_actocc1564_cs3 IS 'Actifs occ 15-64 ans Cadres Prof. intel. sup. (compl)';
COMMENT ON COLUMN insee.activite_{census}.c_actocc1564_cs4 IS 'Actifs occ 15-64 ans Prof. intermédiaires (compl)';
COMMENT ON COLUMN insee.activite_{census}.c_actocc1564_cs5 IS 'Actifs occupés 15-64 ans Employés (compl)';
COMMENT ON COLUMN insee.activite_{census}.c_actocc1564_cs6 IS 'Actifs occupés 15-64 ans Ouvriers (compl)';
COMMENT ON COLUMN insee.activite_{census}.p_actocc15p IS 'Actifs occupés 15 ans ou plus (princ)';
COMMENT ON COLUMN insee.activite_{census}.p_hactocc15p IS 'Actifs occupés 15 ans ou plus Hommes (princ)';
COMMENT ON COLUMN insee.activite_{census}.p_factocc15p IS 'Actifs occupés 15 ans ou plus Femmes (princ)';
COMMENT ON COLUMN insee.activite_{census}.p_sal15p IS 'Salariés 15 ans ou plus (princ)';
COMMENT ON COLUMN insee.activite_{census}.p_hsal15p IS 'Salariés 15 ans ou plus Hommes (princ)';
COMMENT ON COLUMN insee.activite_{census}.p_fsal15p IS 'Salariés 15 ans ou plus Femmes (princ)';
COMMENT ON COLUMN insee.activite_{census}.p_nsal15p IS 'Non-salariés 15 ans ou plus (princ)';
COMMENT ON COLUMN insee.activite_{census}.p_hnsal15p IS 'Non-salariés 15 ans ou plus Hommes (princ)';
COMMENT ON COLUMN insee.activite_{census}.p_fnsal15p IS 'Non-salariés 15 ans ou plus Femmes (princ)';
COMMENT ON COLUMN insee.activite_{census}.p_actocc15p_tp IS 'Actifs occ 15 ans ou plus TP (princ)';
COMMENT ON COLUMN insee.activite_{census}.p_sal15p_tp IS 'Salariés 15 ans ou plus TP (princ)';
COMMENT ON COLUMN insee.activite_{census}.p_hsal15p_tp IS 'Salariés 15 ans ou plus TP Hommes (princ)';
COMMENT ON COLUMN insee.activite_{census}.p_fsal15p_tp IS 'Salariés 15 ans ou plus TP Femmes (princ)';
COMMENT ON COLUMN insee.activite_{census}.p_nsal15p_tp IS 'Non-salariés 15 ans ou plus TP (princ)';
COMMENT ON COLUMN insee.activite_{census}.p_sal15p_cdi IS 'Salariés 15 ans ou plus Fonct publ, CDI (princ)';
COMMENT ON COLUMN insee.activite_{census}.p_sal15p_cdd IS 'Salariés 15 ans ou plus CDD (princ)';
COMMENT ON COLUMN insee.activite_{census}.p_sal15p_interim IS 'Salariés 15 ans ou plus Intérim (princ)';
COMMENT ON COLUMN insee.activite_{census}.p_sal15p_empaid IS 'Salariés 15 ans ou plus Emplois aidés (princ)';
COMMENT ON COLUMN insee.activite_{census}.p_sal15p_appr IS 'Salariés 15 ans ou plus Apprentissage - Stage (princ)';
COMMENT ON COLUMN insee.activite_{census}.p_nsal15p_indep IS 'Non-salariés 15 ans ou plus Indépendants (princ)';
COMMENT ON COLUMN insee.activite_{census}.p_nsal15p_employ IS 'Non-salariés 15 ans ou plus Employeurs (princ)';
COMMENT ON COLUMN insee.activite_{census}.p_nsal15p_aidfam IS 'Non-salariés 15 ans ou plus Aides familiaux (princ)';
COMMENT ON COLUMN insee.activite_{census}.p_actocc15p_ilt1 IS 'Actif occ 15 ans ou plus travaille commune résidence (princ)';
COMMENT ON COLUMN insee.activite_{census}.p_actocc15p_ilt2p IS 'Actif occ 15 ans ou plus travaille autre commune que commune résidence (princ)';
COMMENT ON COLUMN insee.activite_{census}.p_actocc15p_ilt2 IS 'Actif occ 15 ans ou plus travaille autre commune même dépt résidence (princ)';
COMMENT ON COLUMN insee.activite_{census}.p_actocc15p_ilt3 IS 'Actif occ 15 ans ou plus travaille autre dépt même région résidence (princ)';
COMMENT ON COLUMN insee.activite_{census}.p_actocc15p_ilt4 IS 'Actif occ 15 ans ou plus travaille autre région en métropole (princ)';
COMMENT ON COLUMN insee.activite_{census}.p_actocc15p_ilt5 IS 'Actif occ 15 ans ou plus travaille autre région hors métropole (princ)';
COMMENT ON COLUMN insee.activite_{census}.c_actocc15p IS 'Actif occ 15 ans ou plus (compl)';
COMMENT ON COLUMN insee.activite_{census}.c_actocc15p_pas IS 'Actif occ 15 ans ou plus pas de transport (compl)';
COMMENT ON COLUMN insee.activite_{census}.c_actocc15p_mar IS 'Actif occ 15 ans ou plus marche à pied (compl)';
COMMENT ON COLUMN insee.activite_{census}.c_actocc15p_drou IS 'Actif occ 15 ans ou plus deux roues (compl)';
COMMENT ON COLUMN insee.activite_{census}.c_actocc15p_voit IS 'Actif occ 15 ans ou plus voiture, camion (compl)';
COMMENT ON COLUMN insee.activite_{census}.c_actocc15p_tcom IS 'Actif occ 15 ans ou plus transport en commun (compl)';


\copy insee.activite_{census} FROM '{fpath}' DELIMITER '{sep}' CSV HEADER;
