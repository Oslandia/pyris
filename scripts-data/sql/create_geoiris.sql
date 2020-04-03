-- script which will create the table of the IRIS contours. Use the tables
-- 'import.iris_xxx_annee'.

drop table if exists geoiris;
create table geoiris (
    insee_com varchar(5),
    nom_com varchar(50),
    iris varchar(4),
    code_iris varchar(9) primary key,
    nom_iris varchar(50),
    type_iris varchar(1),
    annee int,
    geom geometry(MultiPolygon, 4326)
    );

insert into geoiris
select insee_com
  ,nom_com
  ,iris
  ,code_iris
  ,nom_iris
  ,typ_iris
  ,2017 as annee
  , st_transform(geom, 4326)
from import.iris_metropole_2017;

create index geoiris_insee_com_idx on geoiris(insee_com);
create index geoiris_geom_idx on geoiris using gist(geom);

COMMENT ON TABLE geoiris IS 'Contours des IRIS';
