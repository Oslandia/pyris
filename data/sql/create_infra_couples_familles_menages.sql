-- couples familles ménages infra communale (IRIS)
DROP TABLE IF EXISTS insee.menage;

CREATE TABLE IF NOT EXISTS insee.menage (
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
  c13_men float,
  c13_menpseul float,
  c13_menhseul float,
  c13_menfseul float,
  c13_mensfam float,
  c13_menfam float,
  c13_mencoupsenf float,
  c13_mencoupaenf float,
  c13_menfammono float,
  c13_pmen float,
  c13_pmen_menpseul float,
  c13_pmen_menhseul float,
  c13_pmen_menfseul float,
  c13_pmen_mensfam float,
  c13_pmen_menfam float,
  c13_pmen_mencoupsenf float,
  c13_pmen_mencoupaenf float,
  c13_pmen_menfammono float,
  p13_pop15p float,
  p13_pop1524 float,
  p13_pop2554 float,
  p13_pop5579 float,
  p13_pop80p float,
  p13_popmen15p float,
  p13_popmen1524 float,
  p13_popmen2554 float,
  p13_popmen5579 float,
  p13_popmen80p float,
  p13_pop15p_pseul float,
  p13_pop1524_pseul float,
  p13_pop2554_pseul float,
  p13_pop5579_pseul float,
  p13_pop80p_pseul float,
  p13_pop15p_mariee float,
  p13_pop15p_nonmariee float,
  c13_men_cs1 float,
  c13_men_cs2 float,
  c13_men_cs3 float,
  c13_men_cs4 float,
  c13_men_cs5 float,
  c13_men_cs6 float,
  c13_men_cs7 float,
  c13_men_cs8 float,
  c13_pmen_cs1 float,
  c13_pmen_cs2 float,
  c13_pmen_cs3 float,
  c13_pmen_cs4 float,
  c13_pmen_cs5 float,
  c13_pmen_cs6 float,
  c13_pmen_cs7 float,
  c13_pmen_cs8 float,
  c13_fam float,
  c13_coupaenf float,
  c13_fammono float,
  c13_coupsenf float,
  c13_ne24f0 float,
  c13_ne24f1 float,
  c13_ne24f2 float,
  c13_ne24f3 float,
  c13_ne24f4p float
);


COMMENT ON TABLE insee.menage IS 'Couples, familles, ménages à l''IRIS (2013)';

COMMENT ON COLUMN insee.menage.iris IS 'IRIS';
COMMENT ON COLUMN insee.menage.reg IS 'Région';
COMMENT ON COLUMN insee.menage.reg2016 IS 'Région 2016';
COMMENT ON COLUMN insee.menage.dep IS 'Département';
COMMENT ON COLUMN insee.menage.uu2010 IS 'Unité urbaine';
COMMENT ON COLUMN insee.menage.com IS 'Commune ou ARM';
COMMENT ON COLUMN insee.menage.libcom IS 'Libellé commune ou ARM';
COMMENT ON COLUMN insee.menage.triris IS 'TRIRIS';
COMMENT ON COLUMN insee.menage.grd_quart IS 'Grand quartier';
COMMENT ON COLUMN insee.menage.libiris IS 'Libellé de l''IRIS';
COMMENT ON COLUMN insee.menage.typ_iris IS 'Type d''IRIS';
COMMENT ON COLUMN insee.menage.modif_iris IS 'Modification de l''IRIS';
COMMENT ON COLUMN insee.menage.lab_iris IS 'Label de l''IRIS';

COMMENT ON COLUMN insee.menage.c13_men IS 'Ménages en 2013 (compl)';
COMMENT ON COLUMN insee.menage.c13_menpseul IS 'Ménages 1 personne en 2013 (compl)';
COMMENT ON COLUMN insee.menage.c13_menhseul IS 'Ménages Hommes seuls en 2013 (compl)';
COMMENT ON COLUMN insee.menage.c13_menfseul IS 'Ménages Femmes seules en 2013 (compl)';
COMMENT ON COLUMN insee.menage.c13_mensfam IS 'Ménages Autres sans famille en 2013 (compl)';
COMMENT ON COLUMN insee.menage.c13_menfam IS 'Ménages avec famille(s) en 2013 (compl)';
COMMENT ON COLUMN insee.menage.c13_mencoupsenf IS 'Mén fam princ Couple sans enfant en 2013 (compl)';
COMMENT ON COLUMN insee.menage.c13_mencoupaenf IS 'Mén fam princ Couple avec enfant(s) en 2013 (compl)';
COMMENT ON COLUMN insee.menage.c13_menfammono IS 'Mén fam princ Famille mono en 2013 (compl)';
COMMENT ON COLUMN insee.menage.c13_pmen IS 'Pop Ménages en 2013 (compl)';
COMMENT ON COLUMN insee.menage.c13_pmen_menpseul IS 'Pop mén Personnes seules en 2013 (compl)';
COMMENT ON COLUMN insee.menage.c13_pmen_menhseul IS 'Pop mén Hommes seuls en 2013 (compl)';
COMMENT ON COLUMN insee.menage.c13_pmen_menfseul IS 'Pop mén Femmes seules en 2013 (compl)';
COMMENT ON COLUMN insee.menage.c13_pmen_mensfam IS 'Pop mén Autres sans famille en 2013 (compl)';
COMMENT ON COLUMN insee.menage.c13_pmen_menfam IS 'Pop mén avec famille(s) en 2013 (compl)';
COMMENT ON COLUMN insee.menage.c13_pmen_mencoupsenf IS 'Pop mén fam princ Couple sans enfant en 2013 (compl)';
COMMENT ON COLUMN insee.menage.c13_pmen_mencoupaenf IS 'Pop mén fam princ Couple avec enfant(s) en 2013 (compl)';
COMMENT ON COLUMN insee.menage.c13_pmen_menfammono IS 'Pop mén fam princ Famille mono en 2013 (compl)';
COMMENT ON COLUMN insee.menage.p13_pop15p IS 'Pop 15 ans ou plus en 2013 (princ)';
COMMENT ON COLUMN insee.menage.p13_pop1524 IS 'Pop 15-24 ans en 2013 (princ)';
COMMENT ON COLUMN insee.menage.p13_pop2554 IS 'Pop 25-54 ans en 2013 (princ)';
COMMENT ON COLUMN insee.menage.p13_pop5579 IS 'Pop 55-79 ans en 2013 (princ)';
COMMENT ON COLUMN insee.menage.p13_pop80p IS 'Pop 80 ans ou plus en 2013 (princ)';
COMMENT ON COLUMN insee.menage.p13_popmen15p IS 'Pop mén 15 ans ou plus en 2013 (princ)';
COMMENT ON COLUMN insee.menage.p13_popmen1524 IS 'Pop mén 15-24 ans en 2013 (princ)';
COMMENT ON COLUMN insee.menage.p13_popmen2554 IS 'Pop mén 25-54 ans en 2013 (princ)';
COMMENT ON COLUMN insee.menage.p13_popmen5579 IS 'Pop mén 55-79 ans en 2013 (princ)';
COMMENT ON COLUMN insee.menage.p13_popmen80p IS 'Pop mén 80 ans ou plus en 2013 (princ)';
COMMENT ON COLUMN insee.menage.p13_pop15p_pseul IS 'Pop 15 ans ou plus ans vivant seule en 2013 (princ)';
COMMENT ON COLUMN insee.menage.p13_pop1524_pseul IS 'Pop 15-24 ans vivant seule en 2013 (princ)';
COMMENT ON COLUMN insee.menage.p13_pop2554_pseul IS 'Pop 25-54 ans vivant seule en 2013 (princ)';
COMMENT ON COLUMN insee.menage.p13_pop5579_pseul IS 'Pop 55-79 ans vivant seule en 2013 (princ)';
COMMENT ON COLUMN insee.menage.p13_pop80p_pseul IS 'Pop 80 ans ou plus vivant seule en 2013 (princ)';
COMMENT ON COLUMN insee.menage.p13_pop15p_mariee IS 'Pop 15 ans ou plus Mariée en 2013 (princ)';
COMMENT ON COLUMN insee.menage.p13_pop15p_nonmariee IS 'Pop 15 ans ou plus Non mariée en 2013 (princ)';
COMMENT ON COLUMN insee.menage.c13_men_cs1 IS 'Ménages Pers Réf Agri. expl. en 2013 (compl)';
COMMENT ON COLUMN insee.menage.c13_men_cs2 IS 'Ménages Pers Réf Art. Comm. Chefs entr. en 2013 (compl)';
COMMENT ON COLUMN insee.menage.c13_men_cs3 IS 'Ménages Pers Réf Cadres Prof int sup en 2013 (compl)';
COMMENT ON COLUMN insee.menage.c13_men_cs4 IS 'Ménages Pers Réf Prof intermédiaire en 2013 (compl)';
COMMENT ON COLUMN insee.menage.c13_men_cs5 IS 'Ménages Pers Réf Employé en 2013 (compl)';
COMMENT ON COLUMN insee.menage.c13_men_cs6 IS 'Ménages Pers Réf Ouvrier en 2013 (compl)';
COMMENT ON COLUMN insee.menage.c13_men_cs7 IS 'Ménages Pers Réf Retraité en 2013 (compl)';
COMMENT ON COLUMN insee.menage.c13_men_cs8 IS 'Ménages Pers Réf Autre en 2013 (compl)';
COMMENT ON COLUMN insee.menage.c13_pmen_cs1 IS 'Pop mén Pers Réf Agri. expl. en 2013 (compl)';
COMMENT ON COLUMN insee.menage.c13_pmen_cs2 IS 'Pop mén Pers Réf Art Com Chef ent en 2013 (compl)';
COMMENT ON COLUMN insee.menage.c13_pmen_cs3 IS 'Pop mén Pers Réf Cadres Prof int sup en 2013 (compl)';
COMMENT ON COLUMN insee.menage.c13_pmen_cs4 IS 'Pop mén Pers Réf Prof intermédiaire en 2013 (compl)';
COMMENT ON COLUMN insee.menage.c13_pmen_cs5 IS 'Pop mén Pers Réf Employé en 2013 (compl)';
COMMENT ON COLUMN insee.menage.c13_pmen_cs6 IS 'Pop mén Pers Réf Ouvrier en 2013 (compl)';
COMMENT ON COLUMN insee.menage.c13_pmen_cs7 IS 'Pop mén Pers Réf Retraité en 2013 (compl)';
COMMENT ON COLUMN insee.menage.c13_pmen_cs8 IS 'Pop mén Pers Réf Autre en 2013 (compl)';
COMMENT ON COLUMN insee.menage.c13_fam IS 'Familles en 2013 (compl)';
COMMENT ON COLUMN insee.menage.c13_coupaenf IS 'Fam Couple avec enfant(s) en 2013 (compl)';
COMMENT ON COLUMN insee.menage.c13_fammono IS 'Fam Monoparentales en 2013 (compl)';
COMMENT ON COLUMN insee.menage.c13_coupsenf IS 'Fam Couple sans enfant en 2013 (compl)';
COMMENT ON COLUMN insee.menage.c13_ne24f0 IS 'Fam 0 enfant moins 25 ans en 2013 (compl)';
COMMENT ON COLUMN insee.menage.c13_ne24f1 IS 'Fam 1 enfant moins 25 ans en 2013 (compl)';
COMMENT ON COLUMN insee.menage.c13_ne24f2 IS 'Fam 2 enfants moins 25 ans en 2013 (compl)';
COMMENT ON COLUMN insee.menage.c13_ne24f3 IS 'Fam 3 enfants moins 25 ans en 2013 (compl)';
COMMENT ON COLUMN insee.menage.c13_ne24f4p IS 'Fam 4 enfants ou plus moins 25 ans en 2013 (compl)';
