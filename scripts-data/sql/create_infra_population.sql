-- population infra communale (IRIS)
DROP TABLE IF EXISTS insee.population_{census};

CREATE TABLE IF NOT EXISTS insee.population_{census} (
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
  p_pop float,
  p_pop0002 float,
  p_pop0305 float,
  p_pop0610 float,
  p_pop1117 float,
  p_pop1824 float,
  p_pop2539 float,
  p_pop4054 float,
  p_pop5564 float,
  p_pop6579 float,
  p_pop80p float,
  p_pop0014 float,
  p_pop1529 float,
  p_pop3044 float,
  p_pop4559 float,
  p_pop6074 float,
  p_pop75p float,
  p_pop0019 float,
  p_pop2064 float,
  p_pop65p float,
  p_poph float,
  p_h0014 float,
  p_h1529 float,
  p_h3044 float,
  p_h4559 float,
  p_h6074 float,
  p_h75p float,
  p_h0019 float,
  p_h2064 float,
  p_h65p float,
  p_popf float,
  p_f0014 float,
  p_f1529 float,
  p_f3044 float,
  p_f4559 float,
  p_f6074 float,
  p_f75p float,
  p_f0019 float,
  p_f2064 float,
  p_f65p float,
  c_pop15p float,
  c_pop15p_cs1 float,
  c_pop15p_cs2 float,
  c_pop15p_cs3 float,
  c_pop15p_cs4 float,
  c_pop15p_cs5 float,
  c_pop15p_cs6 float,
  c_pop15p_cs7 float,
  c_pop15p_cs8 float,
  c_h15p float,
  c_h15p_cs1 float,
  c_h15p_cs2 float,
  c_h15p_cs3 float,
  c_h15p_cs4 float,
  c_h15p_cs5 float,
  c_h15p_cs6 float,
  c_h15p_cs7 float,
  c_h15p_cs8 float,
  c_f15p float,
  c_f15p_cs1 float,
  c_f15p_cs2 float,
  c_f15p_cs3 float,
  c_f15p_cs4 float,
  c_f15p_cs5 float,
  c_f15p_cs6 float,
  c_f15p_cs7 float,
  c_f15p_cs8 float,
  p_pop_fr float,
  p_pop_etr float,
  p_pop_imm float,
  p_pmen float,
  p_phormen float
);

create index population_{census}_dep_idx ON insee.population_{census} USING btree (dep);
create index population_{census}_com_idx ON insee.population_{census} USING btree (com);
create index population_{census}_libcom_idx ON insee.population_{census} USING btree (libcom);

COMMENT ON TABLE insee.population_{census} IS 'population à l''IRIS (source Insee), census {census}';

COMMENT ON COLUMN insee.population_{census}.iris IS 'IRIS';
COMMENT ON COLUMN insee.population_{census}.reg IS 'Région (nouvelle)';
COMMENT ON COLUMN insee.population_{census}.dep IS 'Département';
COMMENT ON COLUMN insee.population_{census}.uu2010 IS 'Unité urbaine';
COMMENT ON COLUMN insee.population_{census}.com IS 'Commune ou ARM';
COMMENT ON COLUMN insee.population_{census}.libcom IS 'Libellé commune ou ARM';
COMMENT ON COLUMN insee.population_{census}.triris IS 'TRIRIS';
COMMENT ON COLUMN insee.population_{census}.grd_quart IS 'Grand quartier';
COMMENT ON COLUMN insee.population_{census}.libiris IS 'Libellé de l''IRIS';
COMMENT ON COLUMN insee.population_{census}.typ_iris IS 'Type d''IRIS';
COMMENT ON COLUMN insee.population_{census}.modif_iris IS 'Modification de l''IRIS';
COMMENT ON COLUMN insee.population_{census}.lab_iris IS 'Label de l''IRIS';

COMMENT ON COLUMN insee.population_{census}.p_pop IS 'Population (princ)';
COMMENT ON COLUMN insee.population_{census}.p_pop0002 IS 'Pop 0-2 ans (princ)';
COMMENT ON COLUMN insee.population_{census}.p_pop0305 IS 'Pop 3-5 ans (princ)';
COMMENT ON COLUMN insee.population_{census}.p_pop0610 IS 'Pop 6-10 ans (princ)';
COMMENT ON COLUMN insee.population_{census}.p_pop1117 IS 'Pop 11-17 ans (princ)';
COMMENT ON COLUMN insee.population_{census}.p_pop1824 IS 'Pop 18-24 ans (princ)';
COMMENT ON COLUMN insee.population_{census}.p_pop2539 IS 'Pop 25-39 ans (princ)';
COMMENT ON COLUMN insee.population_{census}.p_pop4054 IS 'Pop 40-54 ans (princ)';
COMMENT ON COLUMN insee.population_{census}.p_pop5564 IS 'Pop 55-64 ans (princ)';
COMMENT ON COLUMN insee.population_{census}.p_pop6579 IS 'Pop 65-79 ans (princ)';
COMMENT ON COLUMN insee.population_{census}.p_pop80p IS 'Pop 80 ans ou plus (princ)';
COMMENT ON COLUMN insee.population_{census}.p_pop0014 IS 'Pop 0-14 ans (princ)';
COMMENT ON COLUMN insee.population_{census}.p_pop1529 IS 'Pop 15-29 ans (princ)';
COMMENT ON COLUMN insee.population_{census}.p_pop3044 IS 'Pop 30-44 ans (princ)';
COMMENT ON COLUMN insee.population_{census}.p_pop4559 IS 'Pop 45-59 ans (princ)';
COMMENT ON COLUMN insee.population_{census}.p_pop6074 IS 'Pop 60-74 ans (princ)';
COMMENT ON COLUMN insee.population_{census}.p_pop75p IS 'Pop 75 ans ou plus (princ)';
COMMENT ON COLUMN insee.population_{census}.p_pop0019 IS 'Pop 0-19 ans (princ)';
COMMENT ON COLUMN insee.population_{census}.p_pop2064 IS 'Pop 20-64 ans (princ)';
COMMENT ON COLUMN insee.population_{census}.p_pop65p IS 'Pop 65 ans ou plus (princ)';
COMMENT ON COLUMN insee.population_{census}.p_poph IS 'Pop Hommes (princ)';
COMMENT ON COLUMN insee.population_{census}.p_h0014 IS 'Pop Hommes 0-14 ans (princ)';
COMMENT ON COLUMN insee.population_{census}.p_h1529 IS 'Pop Hommes 15-29 ans (princ)';
COMMENT ON COLUMN insee.population_{census}.p_h3044 IS 'Pop Hommes 30-44 ans (princ)';
COMMENT ON COLUMN insee.population_{census}.p_h4559 IS 'Pop Hommes 45-59 ans (princ)';
COMMENT ON COLUMN insee.population_{census}.p_h6074 IS 'Pop Hommes 60-74 ans (princ)';
COMMENT ON COLUMN insee.population_{census}.p_h75p IS 'Pop Hommes 75 ans ou plus (princ)';
COMMENT ON COLUMN insee.population_{census}.p_h0019 IS 'Pop Hommes 0-19 ans (princ)';
COMMENT ON COLUMN insee.population_{census}.p_h2064 IS 'Pop Hommes 20-64 ans (princ)';
COMMENT ON COLUMN insee.population_{census}.p_h65p IS 'Pop Hommes 65 ans ou plus (princ)';
COMMENT ON COLUMN insee.population_{census}.p_popf IS 'Pop Femmes (princ)';
COMMENT ON COLUMN insee.population_{census}.p_f0014 IS 'Pop Femmes 0-14 ans (princ)';
COMMENT ON COLUMN insee.population_{census}.p_f1529 IS 'Pop Femmes 15-29 ans (princ)';
COMMENT ON COLUMN insee.population_{census}.p_f3044 IS 'Pop Femmes 30-44 ans (princ)';
COMMENT ON COLUMN insee.population_{census}.p_f4559 IS 'Pop Femmes 45-59 ans (princ)';
COMMENT ON COLUMN insee.population_{census}.p_f6074 IS 'Pop Femmes 60-74 ans (princ)';
COMMENT ON COLUMN insee.population_{census}.p_f75p IS 'Pop Femmes 75 ans ou plus (princ)';
COMMENT ON COLUMN insee.population_{census}.p_f0019 IS 'Pop Femmes 0-19 ans (princ)';
COMMENT ON COLUMN insee.population_{census}.p_f2064 IS 'Pop Femmes 20-64 ans (princ)';
COMMENT ON COLUMN insee.population_{census}.p_f65p IS 'Pop Femmes 65 ans ou plus (princ)';
COMMENT ON COLUMN insee.population_{census}.c_pop15p IS 'Pop 15 ans ou plus (compl)';
COMMENT ON COLUMN insee.population_{census}.c_pop15p_cs1 IS 'Pop 15 ans ou plus Agriculteurs exploitants (compl)';
COMMENT ON COLUMN insee.population_{census}.c_pop15p_cs2 IS 'Pop 15 ans ou plus Artisans, Comm., Chefs entr. (compl)';
COMMENT ON COLUMN insee.population_{census}.c_pop15p_cs3 IS 'Pop 15 ans ou plus Cadres, Prof. intel. sup. (compl)';
COMMENT ON COLUMN insee.population_{census}.c_pop15p_cs4 IS 'Pop 15 ans ou plus Prof. intermédiaires (compl)';
COMMENT ON COLUMN insee.population_{census}.c_pop15p_cs5 IS 'Pop 15 ans ou plus Employés (compl)';
COMMENT ON COLUMN insee.population_{census}.c_pop15p_cs6 IS 'Pop 15 ans ou plus Ouvriers (compl)';
COMMENT ON COLUMN insee.population_{census}.c_pop15p_cs7 IS 'Pop 15 ans ou plus Retraités (compl)';
COMMENT ON COLUMN insee.population_{census}.c_pop15p_cs8 IS 'Pop 15 ans ou plus Autres (compl)';
COMMENT ON COLUMN insee.population_{census}.c_h15p IS 'Pop 15 ans ou plus Hommes (compl)';
COMMENT ON COLUMN insee.population_{census}.c_h15p_cs1 IS 'Pop 15 ans ou plus Hommes Agriculteurs exploitants (compl)';
COMMENT ON COLUMN insee.population_{census}.c_h15p_cs2 IS 'Pop 15 ans ou plus Hommes Artisans, Comm., Chefs entr. (compl)';
COMMENT ON COLUMN insee.population_{census}.c_h15p_cs3 IS 'Pop 15 ans ou plus Hommes Cadres, Prof. intel. sup. (compl)';
COMMENT ON COLUMN insee.population_{census}.c_h15p_cs4 IS 'Pop 15 ans ou plus Hommes Prof. intermédiaires (compl)';
COMMENT ON COLUMN insee.population_{census}.c_h15p_cs5 IS 'Pop 15 ans ou plus Hommes Employés (compl)';
COMMENT ON COLUMN insee.population_{census}.c_h15p_cs6 IS 'Pop 15 ans ou plus Hommes Ouvriers (compl)';
COMMENT ON COLUMN insee.population_{census}.c_h15p_cs7 IS 'Pop 15 ans ou plus Hommes Retraités (compl)';
COMMENT ON COLUMN insee.population_{census}.c_h15p_cs8 IS 'Pop 15 ans ou plus Hommes Autres (compl)';
COMMENT ON COLUMN insee.population_{census}.c_f15p IS 'Pop 15 ans ou plus Femmes (compl)';
COMMENT ON COLUMN insee.population_{census}.c_f15p_cs1 IS 'Pop 15 ans ou plus Femmes Agriculteurs exploitants (compl)';
COMMENT ON COLUMN insee.population_{census}.c_f15p_cs2 IS 'Pop 15 ans ou plus Femmes Artisans, Comm., Chefs entr. (compl)';
COMMENT ON COLUMN insee.population_{census}.c_f15p_cs3 IS 'Pop 15 ans ou plus Femmes Cadres, Prof. intel. sup. (compl)';
COMMENT ON COLUMN insee.population_{census}.c_f15p_cs4 IS 'Pop 15 ans ou plus Femmes Prof. intermédiaires (compl)';
COMMENT ON COLUMN insee.population_{census}.c_f15p_cs5 IS 'Pop 15 ans ou plus Femmes Employés (compl)';
COMMENT ON COLUMN insee.population_{census}.c_f15p_cs6 IS 'Pop 15 ans ou plus Femmes Ouvriers (compl)';
COMMENT ON COLUMN insee.population_{census}.c_f15p_cs7 IS 'Pop 15 ans ou plus Femmes Retraités (compl)';
COMMENT ON COLUMN insee.population_{census}.c_f15p_cs8 IS 'Pop 15 ans ou plus Femmes Autres (compl)';
COMMENT ON COLUMN insee.population_{census}.p_pop_fr IS 'Pop Français (princ)';
COMMENT ON COLUMN insee.population_{census}.p_pop_etr IS 'Pop Etrangers (princ)';
COMMENT ON COLUMN insee.population_{census}.p_pop_imm IS 'Pop Immigrés (princ)';
COMMENT ON COLUMN insee.population_{census}.p_pmen IS 'Pop ménages (princ)';
COMMENT ON COLUMN insee.population_{census}.p_phormen IS 'Pop hors ménages (princ)';


\copy insee.population_{census} FROM '{fpath}' DELIMITER '{sep}' CSV HEADER;
