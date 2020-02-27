-- couples familles ménages infra communale (IRIS)
DROP TABLE IF EXISTS insee.menage_{census};

CREATE TABLE IF NOT EXISTS insee.menage_{census} (
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
  c_men float,
  c_menpseul float,
  c_menhseul float,
  c_menfseul float,
  c_mensfam float,
  c_menfam float,
  c_mencoupsenf float,
  c_mencoupaenf float,
  c_menfammono float,
  c_pmen float,
  c_pmen_menpseul float,
  c_pmen_menhseul float,
  c_pmen_menfseul float,
  c_pmen_mensfam float,
  c_pmen_menfam float,
  c_pmen_mencoupsenf float,
  c_pmen_mencoupaenf float,
  c_pmen_menfammono float,
  p_pop15p float,
  p_pop1524 float,
  p_pop2554 float,
  p_pop5579 float,
  p_pop80p float,
  p_popmen15p float,
  p_popmen1524 float,
  p_popmen2554 float,
  p_popmen5579 float,
  p_popmen80p float,
  p_pop15p_pseul float,
  p_pop1524_pseul float,
  p_pop2554_pseul float,
  p_pop5579_pseul float,
  p_pop80p_pseul float,
  p_pop15p_mariee float,
  p_pop15p_nonmariee float,
  c_men_cs1 float,
  c_men_cs2 float,
  c_men_cs3 float,
  c_men_cs4 float,
  c_men_cs5 float,
  c_men_cs6 float,
  c_men_cs7 float,
  c_men_cs8 float,
  c_pmen_cs1 float,
  c_pmen_cs2 float,
  c_pmen_cs3 float,
  c_pmen_cs4 float,
  c_pmen_cs5 float,
  c_pmen_cs6 float,
  c_pmen_cs7 float,
  c_pmen_cs8 float,
  c_fam float,
  c_coupaenf float,
  c_fammono float,
  c_coupsenf float,
  c_ne24f0 float,
  c_ne24f1 float,
  c_ne24f2 float,
  c_ne24f3 float,
  c_ne24f4p float
);


create index menage_{census}_dep_idx ON insee.menage_{census} USING btree (dep);
create index menage_{census}_com_idx ON insee.menage_{census} USING btree (com);
create index menage_{census}_libcom_idx ON insee.menage_{census} USING btree (libcom);


COMMENT ON TABLE insee.menage_{census} IS 'Couples, familles, ménages à l''IRIS (source Insee), census {census}';

COMMENT ON COLUMN insee.menage_{census}.iris IS 'IRIS';
COMMENT ON COLUMN insee.menage_{census}.reg IS 'Région (nouvelle)';
COMMENT ON COLUMN insee.menage_{census}.dep IS 'Département';
COMMENT ON COLUMN insee.menage_{census}.uu2010 IS 'Unité urbaine';
COMMENT ON COLUMN insee.menage_{census}.com IS 'Commune ou ARM';
COMMENT ON COLUMN insee.menage_{census}.libcom IS 'Libellé commune ou ARM';
COMMENT ON COLUMN insee.menage_{census}.triris IS 'TRIRIS';
COMMENT ON COLUMN insee.menage_{census}.grd_quart IS 'Grand quartier';
COMMENT ON COLUMN insee.menage_{census}.libiris IS 'Libellé de l''IRIS';
COMMENT ON COLUMN insee.menage_{census}.typ_iris IS 'Type d''IRIS';
COMMENT ON COLUMN insee.menage_{census}.modif_iris IS 'Modification de l''IRIS';
COMMENT ON COLUMN insee.menage_{census}.lab_iris IS 'Label de l''IRIS';

COMMENT ON COLUMN insee.menage_{census}.c_men IS 'Ménages (compl)';
COMMENT ON COLUMN insee.menage_{census}.c_menpseul IS 'Ménages 1 personne (compl)';
COMMENT ON COLUMN insee.menage_{census}.c_menhseul IS 'Ménages Hommes seuls (compl)';
COMMENT ON COLUMN insee.menage_{census}.c_menfseul IS 'Ménages Femmes seules (compl)';
COMMENT ON COLUMN insee.menage_{census}.c_mensfam IS 'Ménages Autres sans famille (compl)';
COMMENT ON COLUMN insee.menage_{census}.c_menfam IS 'Ménages avec famille(s) (compl)';
COMMENT ON COLUMN insee.menage_{census}.c_mencoupsenf IS 'Mén fam princ Couple sans enfant (compl)';
COMMENT ON COLUMN insee.menage_{census}.c_mencoupaenf IS 'Mén fam princ Couple avec enfant(s) (compl)';
COMMENT ON COLUMN insee.menage_{census}.c_menfammono IS 'Mén fam princ Famille mono (compl)';
COMMENT ON COLUMN insee.menage_{census}.c_pmen IS 'Pop Ménages (compl)';
COMMENT ON COLUMN insee.menage_{census}.c_pmen_menpseul IS 'Pop mén Personnes seules (compl)';
COMMENT ON COLUMN insee.menage_{census}.c_pmen_menhseul IS 'Pop mén Hommes seuls (compl)';
COMMENT ON COLUMN insee.menage_{census}.c_pmen_menfseul IS 'Pop mén Femmes seules (compl)';
COMMENT ON COLUMN insee.menage_{census}.c_pmen_mensfam IS 'Pop mén Autres sans famille (compl)';
COMMENT ON COLUMN insee.menage_{census}.c_pmen_menfam IS 'Pop mén avec famille(s) (compl)';
COMMENT ON COLUMN insee.menage_{census}.c_pmen_mencoupsenf IS 'Pop mén fam princ Couple sans enfant (compl)';
COMMENT ON COLUMN insee.menage_{census}.c_pmen_mencoupaenf IS 'Pop mén fam princ Couple avec enfant(s) (compl)';
COMMENT ON COLUMN insee.menage_{census}.c_pmen_menfammono IS 'Pop mén fam princ Famille mono (compl)';
COMMENT ON COLUMN insee.menage_{census}.p_pop15p IS 'Pop 15 ans ou plus (princ)';
COMMENT ON COLUMN insee.menage_{census}.p_pop1524 IS 'Pop 15-24 ans (princ)';
COMMENT ON COLUMN insee.menage_{census}.p_pop2554 IS 'Pop 25-54 ans (princ)';
COMMENT ON COLUMN insee.menage_{census}.p_pop5579 IS 'Pop 55-79 ans (princ)';
COMMENT ON COLUMN insee.menage_{census}.p_pop80p IS 'Pop 80 ans ou plus (princ)';
COMMENT ON COLUMN insee.menage_{census}.p_popmen15p IS 'Pop mén 15 ans ou plus (princ)';
COMMENT ON COLUMN insee.menage_{census}.p_popmen1524 IS 'Pop mén 15-24 ans (princ)';
COMMENT ON COLUMN insee.menage_{census}.p_popmen2554 IS 'Pop mén 25-54 ans (princ)';
COMMENT ON COLUMN insee.menage_{census}.p_popmen5579 IS 'Pop mén 55-79 ans (princ)';
COMMENT ON COLUMN insee.menage_{census}.p_popmen80p IS 'Pop mén 80 ans ou plus (princ)';
COMMENT ON COLUMN insee.menage_{census}.p_pop15p_pseul IS 'Pop 15 ans ou plus ans vivant seule (princ)';
COMMENT ON COLUMN insee.menage_{census}.p_pop1524_pseul IS 'Pop 15-24 ans vivant seule (princ)';
COMMENT ON COLUMN insee.menage_{census}.p_pop2554_pseul IS 'Pop 25-54 ans vivant seule (princ)';
COMMENT ON COLUMN insee.menage_{census}.p_pop5579_pseul IS 'Pop 55-79 ans vivant seule (princ)';
COMMENT ON COLUMN insee.menage_{census}.p_pop80p_pseul IS 'Pop 80 ans ou plus vivant seule (princ)';
COMMENT ON COLUMN insee.menage_{census}.p_pop15p_mariee IS 'Pop 15 ans ou plus Mariée (princ)';
COMMENT ON COLUMN insee.menage_{census}.p_pop15p_nonmariee IS 'Pop 15 ans ou plus Non mariée (princ)';
COMMENT ON COLUMN insee.menage_{census}.c_men_cs1 IS 'Ménages Pers Réf Agri. expl. (compl)';
COMMENT ON COLUMN insee.menage_{census}.c_men_cs2 IS 'Ménages Pers Réf Art. Comm. Chefs entr. (compl)';
COMMENT ON COLUMN insee.menage_{census}.c_men_cs3 IS 'Ménages Pers Réf Cadres Prof int sup (compl)';
COMMENT ON COLUMN insee.menage_{census}.c_men_cs4 IS 'Ménages Pers Réf Prof intermédiaire (compl)';
COMMENT ON COLUMN insee.menage_{census}.c_men_cs5 IS 'Ménages Pers Réf Employé (compl)';
COMMENT ON COLUMN insee.menage_{census}.c_men_cs6 IS 'Ménages Pers Réf Ouvrier (compl)';
COMMENT ON COLUMN insee.menage_{census}.c_men_cs7 IS 'Ménages Pers Réf Retraité (compl)';
COMMENT ON COLUMN insee.menage_{census}.c_men_cs8 IS 'Ménages Pers Réf Autre (compl)';
COMMENT ON COLUMN insee.menage_{census}.c_pmen_cs1 IS 'Pop mén Pers Réf Agri. expl. (compl)';
COMMENT ON COLUMN insee.menage_{census}.c_pmen_cs2 IS 'Pop mén Pers Réf Art Com Chef ent (compl)';
COMMENT ON COLUMN insee.menage_{census}.c_pmen_cs3 IS 'Pop mén Pers Réf Cadres Prof int sup (compl)';
COMMENT ON COLUMN insee.menage_{census}.c_pmen_cs4 IS 'Pop mén Pers Réf Prof intermédiaire (compl)';
COMMENT ON COLUMN insee.menage_{census}.c_pmen_cs5 IS 'Pop mén Pers Réf Employé (compl)';
COMMENT ON COLUMN insee.menage_{census}.c_pmen_cs6 IS 'Pop mén Pers Réf Ouvrier (compl)';
COMMENT ON COLUMN insee.menage_{census}.c_pmen_cs7 IS 'Pop mén Pers Réf Retraité (compl)';
COMMENT ON COLUMN insee.menage_{census}.c_pmen_cs8 IS 'Pop mén Pers Réf Autre (compl)';
COMMENT ON COLUMN insee.menage_{census}.c_fam IS 'Familles (compl)';
COMMENT ON COLUMN insee.menage_{census}.c_coupaenf IS 'Fam Couple avec enfant(s) (compl)';
COMMENT ON COLUMN insee.menage_{census}.c_fammono IS 'Fam Monoparentales (compl)';
COMMENT ON COLUMN insee.menage_{census}.c_coupsenf IS 'Fam Couple sans enfant (compl)';
COMMENT ON COLUMN insee.menage_{census}.c_ne24f0 IS 'Fam 0 enfant moins 25 ans (compl)';
COMMENT ON COLUMN insee.menage_{census}.c_ne24f1 IS 'Fam 1 enfant moins 25 ans (compl)';
COMMENT ON COLUMN insee.menage_{census}.c_ne24f2 IS 'Fam 2 enfants moins 25 ans (compl)';
COMMENT ON COLUMN insee.menage_{census}.c_ne24f3 IS 'Fam 3 enfants moins 25 ans (compl)';
COMMENT ON COLUMN insee.menage_{census}.c_ne24f4p IS 'Fam 4 enfants ou plus moins 25 ans (compl)';

\copy insee.menage_{census} FROM '{fpath}' DELIMITER '{sep}' CSV HEADER;
