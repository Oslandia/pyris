-- Get all Insee tables for a given census and create as many tables as necessary. To
-- update the data with a more recent census, you have to load the data into your db,
-- change the census, e.g. 2015 -> 2016 and run this script.

drop table if exists insee.activite;
drop table if exists insee.diplome_formation;
drop table if exists insee.logement;
drop table if exists insee.menage;
drop table if exists insee.population;


create table insee.activite as
select *
from insee.activite_{census};

create table insee.diplome_formation as
select *
from insee.diplome_formation_{census};

create table insee.logement as
select *
from insee.logement_{census};

create table insee.menage as
select *
from insee.menage_{census};

create table insee.population as
select *
from insee.population_{census};


alter table insee.activite add column census int;
alter table insee.diplome_formation add column census int;
alter table insee.logement add column census int;
alter table insee.menage add column census int;
alter table insee.population add column census int;

update insee.activite set census = {census};
update insee.diplome_formation set census = {census};
update insee.logement set census = {census};
update insee.menage set census = {census};
update insee.population set census = {census};

alter table insee.activite add primary key (iris);
alter table insee.diplome_formation add primary key (iris);
alter table insee.logement add primary key (iris);
alter table insee.menage add primary key (iris);
alter table insee.population add primary key (iris);

create index insee_activite_com_idx on insee.activite (com);
create index insee_activite_dep_idx on insee.activite (dep);
create index insee_activite_libcom_idx on insee.activite (libcom);

create index insee_diplome_formation_com_idx on insee.diplome_formation (com);
create index insee_diplome_formation_dep_idx on insee.diplome_formation (dep);
create index insee_diplome_formation_libcom_idx on insee.diplome_formation (libcom);

create index insee_logement_com_idx on insee.logement (com);
create index insee_logement_dep_idx on insee.logement (dep);
create index insee_logement_libcom_idx on insee.logement (libcom);

create index insee_menage_com_idx on insee.menage (com);
create index insee_menage_dep_idx on insee.menage (dep);
create index insee_menage_libcom_idx on insee.menage (libcom);

create index insee_population_com_idx on insee.population (com);
create index insee_population_dep_idx on insee.population (dep);
create index insee_population_libcom_idx on insee.population (libcom);

