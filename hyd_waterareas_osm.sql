ALTER TABLE multipolygon DROP COLUMN geometry ;
ALTER TABLE multipolygon DROP COLUMN name_eng ;
ALTER TABLE multipolygon DROP COLUMN type ;
ALTER TABLE multipolygon DROP COLUMN area ;

ALTER TABLE multipolygon add column name_eng VARCHAR;
ALTER TABLE multipolygon add column type VARCHAR;
ALTER TABLE multipolygon add column area VARCHAR;


UPDATE  multipolygon SET name_eng = name ;
UPDATE  multipolygon SET type ='swimming_pool' where amenity ='swimming_pool' ;
UPDATE  multipolygon SET type ='basin' where landuse='basin' ;
UPDATE  multipolygon SET type ='reservoir' where landuse='reservoir' ;
UPDATE  multipolygon SET type ='swimming_pool' where leisure='swimming_pool' ;
UPDATE  multipolygon SET type ='water' where natural='water';
UPDATE  multipolygon SET type ='riverbank' where waterway='riverbank';

DROP TABLE hyd_waterareas_osm ;

CREATE TABLE hyd_waterareas_osm (
	id serial,
	name_eng VARCHAR,
	type VARCHAR,
	area VARCHAR,
	constraint pk_hyd_waterareas_osm primary key (id)
);

SELECT AddGeometryColumn ('hyd_waterareas_osm','geometry',4326,'MULTIPOLYGON',2);

INSERT INTO hyd_waterareas_osm (
	geometry,
	name_eng,
	type,
	area
)
SELECT 
	wkb_geometry,
	name,
	type,
	area
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
