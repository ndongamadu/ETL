ALTER TABLE points DROP COLUMN geometry ;
ALTER TABLE points DROP COLUMN name_eng ;
ALTER TABLE points DROP COLUMN type ;
ALTER TABLE points DROP COLUMN name_int ;
ALTER TABLE points DROP COLUMN args ;
ALTER TABLE points DROP COLUMN iso3 ;
ALTER TABLE points DROP COLUMN last_update ;
ALTER TABLE points DROP COLUMN country ;
ALTER TABLE points DROP COLUMN population ;
ALTER TABLE points DROP COLUMN source ;

ALTER TABLE points add column name_eng VARCHAR;
ALTER TABLE points add column name_int VARCHAR;
ALTER TABLE points add column type VARCHAR;
ALTER TABLE points add column args VARCHAR;
ALTER TABLE points add column iso3 VARCHAR;
ALTER TABLE points add column last_update VARCHAR;
ALTER TABLE points add column country VARCHAR;
ALTER TABLE points add column population VARCHAR;
ALTER TABLE points add column source VARCHAR;

UPDATE  points SET name_eng = name ;
UPDATE  points SET population = population ;
UPDATE  points SET country = is_in ;
UPDATE  points SET source = source ;
UPDATE  points SET type = 'city' where place='city';
UPDATE  points SET type = 'town' where place='town';
UPDATE  points SET type = 'village' where place='village';
UPDATE  points SET type = 'hamlet' where place='hamlet';
UPDATE  points SET type = 'suburb' where place='suburb';
UPDATE  points SET type = 'locality' where place='locality';

DROP TABLE pop_places_osm ;

CREATE TABLE pop_places_osm (
	id serial,
	name_eng varchar,
	type varchar,
	iso3 varchar,
	last_update varchar,
	country varchar,
	population varchar,
	name_int,
	args varchar,
	source varchar
	constraint pk_pop_places_osm primary key (id)
);

SELECT AddGeometryColumn ('pop_places_osm','geometry',4326,'POINT',2);

INSERT INTO pop_places_osm (
	geometry,
	name_eng,
	type,
	iso3,
	last_update,
	country,
	population,
	name_int,
	args,
	source
)
SELECT 
	wkb_geometry,
	name_eng,
	type,
	iso3,
	last_update,
	country,
	population,
	name_int,
	args,
	source
FROM points ;



--ALTER TABLE lines add column ref VARCHAR;

--ALTER TABLE table_origine add column numlanes VARCHAR;
--ALTER TABLE table_origine add column iso3 VARCHAR;
--ALTER TABLE table_origine add column country VARCHAR;
--ALTER TABLE table_origine add column last_update VARCHAR;
--ALTER TABLE table_origine add column status VARCHAR;
--ALTER TABLE table_origine add column srfcond VARCHAR;
--ALTER TABLE table_origine add column isseasonal VARCHAR;
--ALTER TABLE table_origine add column curntprac VARCHAR;
