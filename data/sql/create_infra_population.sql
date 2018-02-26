-- population infra communale (IRIS)
DROP TABLE IF EXISTS insee.population;

CREATE TABLE IF NOT EXISTS insee.population (
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
  p13_pop float,
  p13_pop0002 float,
  p13_pop0305 float,
  p13_pop0610 float,
  p13_pop1117 float,
  p13_pop1824 float,
  p13_pop2539 float,
  p13_pop4054 float,
  p13_pop5564 float,
  p13_pop6579 float,
  p13_pop80p float,
  p13_pop0014 float,
  p13_pop1529 float,
  p13_pop3044 float,
  p13_pop4559 float,
  p13_pop6074 float,
  p13_pop75p float,
  p13_pop0019 float,
  p13_pop2064 float,
  p13_pop65p float,
  p13_poph float,
  p13_h0014 float,
  p13_h1529 float,
  p13_h3044 float,
  p13_h4559 float,
  p13_h6074 float,
  p13_h75p float,
  p13_h0019 float,
  p13_h2064 float,
  p13_h65p float,
  p13_popf float,
  p13_f0014 float,
  p13_f1529 float,
  p13_f3044 float,
  p13_f4559 float,
  p13_f6074 float,
  p13_f75p float,
  p13_f0019 float,
  p13_f2064 float,
  p13_f65p float,
  c13_pop15p float,
  c13_pop15p_cs1 float,
  c13_pop15p_cs2 float,
  c13_pop15p_cs3 float,
  c13_pop15p_cs4 float,
  c13_pop15p_cs5 float,
  c13_pop15p_cs6 float,
  c13_pop15p_cs7 float,
  c13_pop15p_cs8 float,
  c13_h15p float,
  c13_h15p_cs1 float,
  c13_h15p_cs2 float,
  c13_h15p_cs3 float,
  c13_h15p_cs4 float,
  c13_h15p_cs5 float,
  c13_h15p_cs6 float,
  c13_h15p_cs7 float,
  c13_h15p_cs8 float,
  c13_f15p float,
  c13_f15p_cs1 float,
  c13_f15p_cs2 float,
  c13_f15p_cs3 float,
  c13_f15p_cs4 float,
  c13_f15p_cs5 float,
  c13_f15p_cs6 float,
  c13_f15p_cs7 float,
  c13_f15p_cs8 float,
  p13_pop_fr float,
  p13_pop_etr float,
  p13_pop_imm float,
  p13_pmen float,
  p13_phormen float
);


COMMENT ON TABLE insee.population IS 'population à l''IRIS (2013)';

COMMENT ON COLUMN insee.population.iris IS 'IRIS';
COMMENT ON COLUMN insee.population.reg IS 'Région';
COMMENT ON COLUMN insee.population.reg2016 IS 'Région 2016';
COMMENT ON COLUMN insee.population.dep IS 'Département';
COMMENT ON COLUMN insee.population.uu2010 IS 'Unité urbaine';
COMMENT ON COLUMN insee.population.com IS 'Commune ou ARM';
COMMENT ON COLUMN insee.population.libcom IS 'Libellé commune ou ARM';
COMMENT ON COLUMN insee.population.triris IS 'TRIRIS';
COMMENT ON COLUMN insee.population.grd_quart IS 'Grand quartier';
COMMENT ON COLUMN insee.population.libiris IS 'Libellé de l''IRIS';
COMMENT ON COLUMN insee.population.typ_iris IS 'Type d''IRIS';
COMMENT ON COLUMN insee.population.modif_iris IS 'Modification de l''IRIS';
COMMENT ON COLUMN insee.population.lab_iris IS 'Label de l''IRIS';

COMMENT ON COLUMN insee.population.p13_pop IS 'Population en 2013 (princ)';
COMMENT ON COLUMN insee.population.p13_pop0002 IS 'Pop 0-2 ans en 2013 (princ)';
COMMENT ON COLUMN insee.population.p13_pop0305 IS 'Pop 3-5 ans en 2013 (princ)';
COMMENT ON COLUMN insee.population.p13_pop0610 IS 'Pop 6-10 ans en 2013 (princ)';
COMMENT ON COLUMN insee.population.p13_pop1117 IS 'Pop 11-17 ans en 2013 (princ)';
COMMENT ON COLUMN insee.population.p13_pop1824 IS 'Pop 18-24 ans en 2013 (princ)';
COMMENT ON COLUMN insee.population.p13_pop2539 IS 'Pop 25-39 ans en 2013 (princ)';
COMMENT ON COLUMN insee.population.p13_pop4054 IS 'Pop 40-54 ans en 2013 (princ)';
COMMENT ON COLUMN insee.population.p13_pop5564 IS 'Pop 55-64 ans en 2013 (princ)';
COMMENT ON COLUMN insee.population.p13_pop6579 IS 'Pop 65-79 ans en 2013 (princ)';
COMMENT ON COLUMN insee.population.p13_pop80p IS 'Pop 80 ans ou plus en 2013 (princ)';
COMMENT ON COLUMN insee.population.p13_pop0014 IS 'Pop 0-14 ans en 2013 (princ)';
COMMENT ON COLUMN insee.population.p13_pop1529 IS 'Pop 15-29 ans en 2013 (princ)';
COMMENT ON COLUMN insee.population.p13_pop3044 IS 'Pop 30-44 ans en 2013 (princ)';
COMMENT ON COLUMN insee.population.p13_pop4559 IS 'Pop 45-59 ans en 2013 (princ)';
COMMENT ON COLUMN insee.population.p13_pop6074 IS 'Pop 60-74 ans en 2013 (princ)';
COMMENT ON COLUMN insee.population.p13_pop75p IS 'Pop 75 ans ou plus en 2013 (princ)';
COMMENT ON COLUMN insee.population.p13_pop0019 IS 'Pop 0-19 ans en 2013 (princ)';
COMMENT ON COLUMN insee.population.p13_pop2064 IS 'Pop 20-64 ans en 2013 (princ)';
COMMENT ON COLUMN insee.population.p13_pop65p IS 'Pop 65 ans ou plus en 2013 (princ)';
COMMENT ON COLUMN insee.population.p13_poph IS 'Pop Hommes en 2013 (princ)';
COMMENT ON COLUMN insee.population.p13_h0014 IS 'Pop Hommes 0-14 ans en 2013 (princ)';
COMMENT ON COLUMN insee.population.p13_h1529 IS 'Pop Hommes 15-29 ans en 2013 (princ)';
COMMENT ON COLUMN insee.population.p13_h3044 IS 'Pop Hommes 30-44 ans en 2013 (princ)';
COMMENT ON COLUMN insee.population.p13_h4559 IS 'Pop Hommes 45-59 ans en 2013 (princ)';
COMMENT ON COLUMN insee.population.p13_h6074 IS 'Pop Hommes 60-74 ans en 2013 (princ)';
COMMENT ON COLUMN insee.population.p13_h75p IS 'Pop Hommes 75 ans ou plus en 2013 (princ)';
COMMENT ON COLUMN insee.population.p13_h0019 IS 'Pop Hommes 0-19 ans en 2013 (princ)';
COMMENT ON COLUMN insee.population.p13_h2064 IS 'Pop Hommes 20-64 ans en 2013 (princ)';
COMMENT ON COLUMN insee.population.p13_h65p IS 'Pop Hommes 65 ans ou plus en 2013 (princ)';
COMMENT ON COLUMN insee.population.p13_popf IS 'Pop Femmes en 2013 (princ)';
COMMENT ON COLUMN insee.population.p13_f0014 IS 'Pop Femmes 0-14 ans en 2013 (princ)';
COMMENT ON COLUMN insee.population.p13_f1529 IS 'Pop Femmes 15-29 ans en 2013 (princ)';
COMMENT ON COLUMN insee.population.p13_f3044 IS 'Pop Femmes 30-44 ans en 2013 (princ)';
COMMENT ON COLUMN insee.population.p13_f4559 IS 'Pop Femmes 45-59 ans en 2013 (princ)';
COMMENT ON COLUMN insee.population.p13_f6074 IS 'Pop Femmes 60-74 ans en 2013 (princ)';
COMMENT ON COLUMN insee.population.p13_f75p IS 'Pop Femmes 75 ans ou plus en 2013 (princ)';
COMMENT ON COLUMN insee.population.p13_f0019 IS 'Pop Femmes 0-19 ans en 2013 (princ)';
COMMENT ON COLUMN insee.population.p13_f2064 IS 'Pop Femmes 20-64 ans en 2013 (princ)';
COMMENT ON COLUMN insee.population.p13_f65p IS 'Pop Femmes 65 ans ou plus en 2013 (princ)';
COMMENT ON COLUMN insee.population.c13_pop15p IS 'Pop 15 ans ou plus en 2013 (compl)';
COMMENT ON COLUMN insee.population.c13_pop15p_cs1 IS 'Pop 15 ans ou plus Agriculteurs exploitants en 2013 (compl)';
COMMENT ON COLUMN insee.population.c13_pop15p_cs2 IS 'Pop 15 ans ou plus Artisans, Comm., Chefs entr. en 2013 (compl)';
COMMENT ON COLUMN insee.population.c13_pop15p_cs3 IS 'Pop 15 ans ou plus Cadres, Prof. intel. sup. en 2013 (compl)';
COMMENT ON COLUMN insee.population.c13_pop15p_cs4 IS 'Pop 15 ans ou plus Prof. intermédiaires en 2013 (compl)';
COMMENT ON COLUMN insee.population.c13_pop15p_cs5 IS 'Pop 15 ans ou plus Employés en 2013 (compl)';
COMMENT ON COLUMN insee.population.c13_pop15p_cs6 IS 'Pop 15 ans ou plus Ouvriers en 2013 (compl)';
COMMENT ON COLUMN insee.population.c13_pop15p_cs7 IS 'Pop 15 ans ou plus Retraités en 2013 (compl)';
COMMENT ON COLUMN insee.population.c13_pop15p_cs8 IS 'Pop 15 ans ou plus Autres en 2013 (compl)';
COMMENT ON COLUMN insee.population.c13_h15p IS 'Pop 15 ans ou plus Hommes en 2013 (compl)';
COMMENT ON COLUMN insee.population.c13_h15p_cs1 IS 'Pop 15 ans ou plus Hommes Agriculteurs exploitants en 2013 (compl)';
COMMENT ON COLUMN insee.population.c13_h15p_cs2 IS 'Pop 15 ans ou plus Hommes Artisans, Comm., Chefs entr. en 2013 (compl)';
COMMENT ON COLUMN insee.population.c13_h15p_cs3 IS 'Pop 15 ans ou plus Hommes Cadres, Prof. intel. sup. en 2013 (compl)';
COMMENT ON COLUMN insee.population.c13_h15p_cs4 IS 'Pop 15 ans ou plus Hommes Prof. intermédiaires en 2013 (compl)';
COMMENT ON COLUMN insee.population.c13_h15p_cs5 IS 'Pop 15 ans ou plus Hommes Employés en 2013 (compl)';
COMMENT ON COLUMN insee.population.c13_h15p_cs6 IS 'Pop 15 ans ou plus Hommes Ouvriers en 2013 (compl)';
COMMENT ON COLUMN insee.population.c13_h15p_cs7 IS 'Pop 15 ans ou plus Hommes Retraités en 2013 (compl)';
COMMENT ON COLUMN insee.population.c13_h15p_cs8 IS 'Pop 15 ans ou plus Hommes Autres en 2013 (compl)';
COMMENT ON COLUMN insee.population.c13_f15p IS 'Pop 15 ans ou plus Femmes en 2013 (compl)';
COMMENT ON COLUMN insee.population.c13_f15p_cs1 IS 'Pop 15 ans ou plus Femmes Agriculteurs exploitants en 2013 (compl)';
COMMENT ON COLUMN insee.population.c13_f15p_cs2 IS 'Pop 15 ans ou plus Femmes Artisans, Comm., Chefs entr. en 2013 (compl)';
COMMENT ON COLUMN insee.population.c13_f15p_cs3 IS 'Pop 15 ans ou plus Femmes Cadres, Prof. intel. sup. en 2013 (compl)';
COMMENT ON COLUMN insee.population.c13_f15p_cs4 IS 'Pop 15 ans ou plus Femmes Prof. intermédiaires en 2013 (compl)';
COMMENT ON COLUMN insee.population.c13_f15p_cs5 IS 'Pop 15 ans ou plus Femmes Employés en 2013 (compl)';
COMMENT ON COLUMN insee.population.c13_f15p_cs6 IS 'Pop 15 ans ou plus Femmes Ouvriers en 2013 (compl)';
COMMENT ON COLUMN insee.population.c13_f15p_cs7 IS 'Pop 15 ans ou plus Femmes Retraités en 2013 (compl)';
COMMENT ON COLUMN insee.population.c13_f15p_cs8 IS 'Pop 15 ans ou plus Femmes Autres en 2013 (compl)';
COMMENT ON COLUMN insee.population.p13_pop_fr IS 'Pop Français en 2013 (princ)';
COMMENT ON COLUMN insee.population.p13_pop_etr IS 'Pop Etrangers en 2013 (princ)';
COMMENT ON COLUMN insee.population.p13_pop_imm IS 'Pop Immigrés en 2013 (princ)';
COMMENT ON COLUMN insee.population.p13_pmen IS 'Pop ménages en 2013 (princ)';
COMMENT ON COLUMN insee.population.p13_phormen IS 'Pop hors ménages en 2013 (princ)';
