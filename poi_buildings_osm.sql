ALTER TABLE multipolygon DROP COLUMN geometry ;
ALTER TABLE multipolygon DROP COLUMN name_eng ;
ALTER TABLE multipolygon DROP COLUMN type ;
ALTER TABLE multipolygon DROP COLUMN iso3 ;
ALTER TABLE multipolygon DROP COLUMN last_update ;
ALTER TABLE multipolygon DROP COLUMN country ;

ALTER TABLE multipolygon add column name_eng VARCHAR;
ALTER TABLE multipolygon add column type VARCHAR;
ALTER TABLE multipolygon add COLUMN iso3 VARCHAR;
ALTER TABLE multipolygon add COLUMN last_update VARCHAR;
ALTER TABLE multipolygon add COLUMN country VARCHAR;


UPDATE  multipolygon SET name_eng = name ;
UPDATE  multipolygon SET type = building ;

DROP TABLE poi_buildings_osm ;

CREATE TABLE poi_buildings_osm (
	id serial,
	name_eng varchar,
	type varchar,
	iso3 varchar,
	last_update varchar,
	country varchar,
	constraint pk_poi_buildings_osm primary key (id)
);

SELECT AddGeometryColumn ('poi_buildings_osm','geometry',4326,'LINESTRING',2);

INSERT INTO poi_buildings_osm (
	geometry,
	name_eng,
	type,
	iso3,
	last_update,
	country
)
SELECT 
	wkb_geometry,
	name_eng,
	type,
	iso3,
	last_update,
	country
FROM multipolygon ;



--ALTER TABLE lines add column ref VARCHAR;

--ALTER TABLE table_origine add column numlanes VARCHAR;
--ALTER TABLE table_origine add column iso3 VARCHAR;
--ALTER TABLE table_origine add column country VARCHAR;
--ALTER TABLE table_origine add column last_update VARCHAR;
--ALTER TABLE table_origine add column status VARCHAR;
--ALTER TABLE table_origine add column srfcond VARCHAR;
--ALTER TABLE table_origine add column isseasonal VARCHAR;
--ALTER TABLE table_origine add column curntprac VARCHAR;
